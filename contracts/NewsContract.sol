// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./NewsToken.sol";

abstract contract NewsContract is Ownable {
    NewsToken public newsToken;
    
    struct Article {
        uint256 id;
        string contentHash; // IPFS hash
        address author;
        uint256 timestamp;
    }

    Article[] public articles;
    mapping(address => uint256) public authorEarnings;

    event ArticleSubmitted(uint256 id, string contentHash, address author);
    event ArticleTipped(uint256 articleId, address tipper, uint256 amount);

    constructor(address _tokenAddress) {
        newsToken = NewsToken(payable(_tokenAddress));
    }

    function submitArticle(string memory _contentHash) external {
        uint256 newId = articles.length;
        articles.push(Article(newId, _contentHash, msg.sender, block.timestamp));
        emit ArticleSubmitted(newId, _contentHash, msg.sender);
    }

    function tipArticle(uint256 _articleId, uint256 _amount) external {
        require(_articleId < articles.length, "Invalid article");
        Article memory article = articles[_articleId];
        
        newsToken.transferFrom(msg.sender, article.author, _amount);
        emit ArticleTipped(_articleId, msg.sender, _amount);
    }

    function rewardAuthor(address _author, uint256 _amount) external onlyOwner {
        newsToken.mint(_author, _amount);
    }

    function getArticleCount() external view returns (uint256) {
        return articles.length;
    }
}