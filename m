Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A38688516
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7736EECD;
	Fri,  9 Aug 2019 21:39:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700049.outbound.protection.outlook.com [40.107.70.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB8A6EECE
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRzj6KeGvo+FXhRpWTmym1en0Y5S54zeLSQ4DujWhRS4jraO73tDwyESRdwX2l5l1tjCadAj4n8Ip4m+uCvabybk40dwND8fWYWQG6B6ZJuMs7bleEIP7UklZ9fmZJzDQAcFfRR3TgjQTQhtfj1LYIL0n/1qORU4P66ESbHtXe6CVJehsFrMQ4Mak8Yh8sIYEuzIGgHYLTthReLAzV6/WZukePba9SO4er/RhWRweJEctGQJi74+X16j4MHNUBuHVchURdLrq8L5lQpaoSYGB42F+tfah8bOJDpLagZmGrnKIpOC4BIMx5Qj2cM4XXSEhbV29/IBjWREO2ArZbJTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5MLUBk6ZP/I90tvlO68DoE0ES8FMdbTWOZaBlwxDjs=;
 b=eq8bWFHIaU+FayKMw83vAyq0DoMs4mzBBccZd4bEXZaSqFWnYN8V5KrWMbD+3egQcH6DZCvMs5WHOelUVDc+7IMWP1fXWTj4LLR3KEBxmWtewIkFvEkCGEdYwsA2q4NqV1+QgwS2bxSzvvORvCMmAeMxGhjcSgGLMXeAzCPIkpiUvQeMQL/qLr5t15k742UTJEEmG+lQTPsXyXTdn+e5lK6FWwyMHAbo+mmr0g9GEW5Wb+QaPq8bZh3k5GZZiW7DYVcJwF/r/gGHRsj3ski07U0dqq/GO+KNo8balLcHXXMzkbFMfYehUAYxPXB76CpPrcNoJrTzUbIcH2oBTkD5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) by BN7PR12MB2707.namprd12.prod.outlook.com
 (2603:10b6:408:2f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16; Fri, 9 Aug
 2019 21:38:57 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by BN6PR1201CA0005.outlook.office365.com
 (2603:10b6:405:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:57 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:45 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 47/49] drm/amd/display: audio cannot switch to internal when
 display turns off
Date: Fri, 9 Aug 2019 17:37:40 -0400
Message-ID: <20190809213742.30301-48-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(476003)(2876002)(2351001)(86362001)(50466002)(4326008)(23676004)(336012)(53936002)(305945005)(76176011)(426003)(49486002)(2906002)(36756003)(2870700001)(126002)(2616005)(26005)(11346002)(186003)(486006)(446003)(478600001)(14444005)(316002)(54906003)(1076003)(81166006)(6666004)(81156014)(50226002)(356004)(8676002)(70206006)(70586007)(5660300002)(6916009)(8936002)(5820100001)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2707; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abfff94d-c42c-4742-42e9-08d71d11fbcc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2707; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2707:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2707C728A95FFE7618987A9782D60@BN7PR12MB2707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PTQ4ZGFhpCHdAugAB5+UBQc7eKf4OF/TOllF+PwAE4SDuqFQjtQmY5qobg5d9S++H7FHIzUNHLOI5BHa2hMcs2zeXjbKtV1Do9r3rxQ7zWy3/s9APkNPwHh/6gpADu6g1sSsyldH0nzimHA8FvIhFywoYI99ma3fNAdDY7T8Dd0ANRyhWEjmgeWBv0IeGyncet91nCEOaTwY82eGMhMyvf0pM9A8Kwk/bxIPFCyWfDX4vPDOZMqKeT6CkzguQqmd62jyzzfOCtVNvJrtsOJqvw0ENOlTblAFH8K83Qn2DPWPFXwD/HdZu0esoKdwZyx6+vP4XldXndVLRNOoDgesX7w2nicX9PcxTj5xtax6uvyjNYGlTo+hX6x72lPST2fndXHJ/+d8r20rAfdVG1qDOnhUqkCF6E7xCACf6VgdLKE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:57.1260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abfff94d-c42c-4742-42e9-08d71d11fbcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5MLUBk6ZP/I90tvlO68DoE0ES8FMdbTWOZaBlwxDjs=;
 b=azAYzda4bVv8tsZa2B0Ur8a+FZeD8ZzKLLb6wiyhPeRhzpW0bu1ZeUoq8HNXCXn79nlBT7XFkDAjHhg/KWDBU/IFFxhCQ/ihoDiNxXSj1zVtOymATSRenNwf96y37jhcKj/urrsk4dHXszUnyWVQ5Ed+rfzGGE50Jv2IlNrFH0I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 yanyan kang <Yanyan.Kang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogeWFueWFuIGthbmcgPFlhbnlhbi5LYW5nQGFtZC5jb20+Cgpbd2h5XQpkaXNhYmxlX2F6
X2VuZHBvaW50IGhhcyBiZWVuIHNraXBwZWQgYmVjYXVzZQpkYy0+ZGVidWcuYXpfZW5kcG9pbnRf
bXV0ZV9vbmx5ID0gdHJ1ZS4KCltob3ddCnNldCBkYy0+ZGVidWcuYXpfZW5kcG9pbnRfbXV0ZV9v
bmx5IGZhbHNlIHdoZW4gUFBMSULigJlzIFBNRSBub3RpZmljYXRpb24gZnVuY3Rpb24KIHBvaW50
ZXIgaXMgbm90IE5VTEwgYXQgdGhlIGRjbjEwX3Jlc291cmNlIGNvbnN0cnVjdCBmdW5jdGlvbixi
ZWNhdXNlIHJpZ2h0IG5vdwogU01VL1BQTElCIGFuZCBEQUwgYWxsIGhhdmUgdGhlIEFaIEQzIGZv
cmNlIFBNRSBub3RpZmljYXRpb24gaW1wbGVtZW50ZWQuIEFaIEQzIHNob3VsZCB3b3JrLgoKU2ln
bmVkLW9mZi1ieTogeWFueWFuIGthbmcgPFlhbnlhbi5LYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxz
dW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX3Jlc291cmNlLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfcmVzb3VyY2UuYwppbmRleCAyYTAxNjQ1YzRiZmQuLmZmZjhlODdiMzljMCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291
cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jl
c291cmNlLmMKQEAgLTE0MTQsNiArMTQxNCwxNCBAQCBzdGF0aWMgYm9vbCBjb25zdHJ1Y3QoCiAK
IAlwb29sLT5iYXNlLnBwX3NtdSA9IGRjbjEwX3BwX3NtdV9jcmVhdGUoY3R4KTsKIAorCS8qCisJ
ICogUmlnaHQgbm93IFNNVS9QUExJQiBhbmQgREFMIGFsbCBoYXZlIHRoZSBBWiBEMyBmb3JjZSBQ
TUUgbm90aWZpY2F0aW9uICoKKwkgKiBpbXBsZW1lbnRlZC4gU28gQVogRDMgc2hvdWxkIHdvcmsu
Rm9yIGlzc3VlIDE5NzAwNy4gICAgICAgICAgICAgICAgICAgKgorCSAqLworCWlmIChwb29sLT5i
YXNlLnBwX3NtdSAhPSBOVUxMCisJCQkmJiBwb29sLT5iYXNlLnBwX3NtdS0+cnZfZnVuY3Muc2V0
X3BtZV93YV9lbmFibGUgIT0gTlVMTCkKKwkJZGMtPmRlYnVnLmF6X2VuZHBvaW50X211dGVfb25s
eSA9IGZhbHNlOworCiAJaWYgKCFkYy0+ZGVidWcuZGlzYWJsZV9wcGxpYl9jbG9ja19yZXF1ZXN0
KQogCQlkY25fYndfdXBkYXRlX2Zyb21fcHBsaWIoZGMpOwogCWRjbl9id19zeW5jX2NhbGNzX2Fu
ZF9kbWwoZGMpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
