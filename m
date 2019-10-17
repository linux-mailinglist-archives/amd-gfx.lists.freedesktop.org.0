Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4553DB743
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8BC6EAD1;
	Thu, 17 Oct 2019 19:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790059.outbound.protection.outlook.com [40.107.79.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082336EABF
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSDmmm+/u8S6ZJh4SHPH6Bqpg+Fpbbp2V/fozu/Yb5ylER1rIFGJ4WJZrrIJ620Sm9R/vAPCLwPxnelobKT6kMrAd/Du4mjBMha7gttuob38mQuqfMAdkPKtaPY3f7kiQ+FtYWysqTJA1yHvTxk9GA2qjNvC+kx16nMXfV4FYweDQcTOkrEPUiR9M9AGk/BOZTVtHA/JLEnXE78lK4hXAYQl94S7z4Y8IRgm44nRhbzb9DbyWjXWtkHi4WdSCpscSJvTzThRCjc7TGCsnK1IF0VWZAKLOOkGV4p3vPKszkq6dmMxD5h8/xTYNUWx8l/uX7Sf8FbyBRYGRjimgtjd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUcxDVtauyQz3TiDPCW5dr6/TDxEncSONR3u9bGCOhE=;
 b=itzus58oRvlXrJnpOc+E8Sv6jyVRDR3mUNDofdUYM3Ba16GKcnJw7oWwDT/f1dowzBxXUBaV09THq+WYSchJ6/n9Bd8eLMAo8Ag2Sk2QhdKJeNSP3TPlQkmKw4Rn539k+AoOAhFHHplsqsePd9YIIrDX99R7l19J2E9tjCxHGUo6WOv3220O9yQvcxtCz4LEdwkeeM1kxddhgLzJdDT4Qft2lL+l57OZPRHpGJK9rMp/SRvFYmwacFK0HqOAf8n2qTfErH1ffVs8yb6rPjH8ZC0kNDFJ1J6m9ffKp3QcVKOnfZLMaV7i7x+s/bcW6Me+Ch/Ai7RgSvnnHoeDJ3ezXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:405:4c::25) by DM5PR12MB1292.namprd12.prod.outlook.com
 (2603:10b6:3:73::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Thu, 17 Oct
 2019 19:15:53 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR1201CA0015.outlook.office365.com
 (2603:10b6:405:4c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:49 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:49 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:48 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 29/37] drm/amd/display: Only use EETF when maxCL > max display
Date: Thu, 17 Oct 2019 15:13:21 -0400
Message-ID: <20191017191329.11857-30-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(428003)(189003)(199004)(81166006)(305945005)(2876002)(54906003)(48376002)(50466002)(51416003)(316002)(2906002)(2351001)(36756003)(8676002)(8936002)(50226002)(76176011)(6916009)(186003)(336012)(2870700001)(26005)(426003)(356004)(486006)(446003)(476003)(47776003)(11346002)(2616005)(126002)(4326008)(5660300002)(6666004)(1076003)(81156014)(478600001)(70206006)(70586007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1292; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7071a86e-639d-4506-330b-08d753366dc3
X-MS-TrafficTypeDiagnostic: DM5PR12MB1292:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1292CEC8EDB20290CBDC67A3826D0@DM5PR12MB1292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dzy0f5nalEig3WG8Jks5yCc9cNz4W4+9/6RxZRoUpwqAbhxwtVEAShYR0jZoaBcra5yPG8hih/pJ4G5G3z5SJ7OwwE9CuyIgkzlYo2q2Ui6o9RgJPbKCEpPbusTX05w1K4BTTgFyDO7UxNwnOALhJ4TmfvG5+VhgBjUK2hmriIrZwjyzGHkvCzrUdqMX1z1HpSq4/suCpfa5br/tvIB2w5K/YtriUzVzPY636gmJzf3ZGeGHD0qA3dG7HarpID8Ti6wkx43pWsaYuNmmstO9d7rCuPpyzvO7pEeIDi+CvxN0tgZtFOiL/5S8Fa21+gXK7oH7V3bOBnHWEnQv+gGwSy3lR8IBVh7C90PLQkqRKbZcUrfe8SpWvfBSRRMlV9ckasgoAOPE29aLn4m/SDWchjEUjviRUqwCgxGLeuq1bcg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:52.9731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7071a86e-639d-4506-330b-08d753366dc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1292
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUcxDVtauyQz3TiDPCW5dr6/TDxEncSONR3u9bGCOhE=;
 b=3DgGAb+yWXrUmaGo4e5bkutRdryC1uVDWORV8V2w0Uo0i7dzsRre+CWFZzn2N8jH4RYHC+8zpCYzuYrPgIKOqKuDCYNtg8UpvsAVPbqhU8wtjctASUkmGZQ5JMM3bLai8JYm1l+KVYW7hEbKpKVCa5wJKAU00R6Thj1L3FYpWf0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KCltXaHkmSG93
XQpCVC4yMzkwIEVFVEYgaXMgdXNlZCBmb3IgdG9uZSBtYXBwaW5nL3JhbmdlIHJlZHVjdGlvbi4K
U2F5IGRpc3BsYXkgaXMgMC4xIC0gNTAwIG5pdHMuClRoZSBwcm9ibGVtYXRpYyBjYXNlIGlzIHdo
ZW4gY29udGVudCBpcyAwLTQwMC4gV2UgYXBwbHkgRUVURiBiZWNhdXNlCjA8MC4xIHNvIHdlIG5l
ZWQgdG8gcmVkdWNlIHRoZSByYW5nZSBieSAwLjEuCgpJbiB0aGUgY29tbWl0LCB3ZSBpZ25vcmUg
dGhlIGJvdHRvbSByYW5nZS4gTW9zdCBkaXNwbGF5cyBtYXAgMCB0byBtaW4gYW5kCnRoZW4gaGF2
ZSBhIHJhbXAgdG8gMC4xLCBzbyBzZW5kaW5nIDAuMSBpcyBhY3R1YWxseSA+MC4xLgpGdXJ0aGVy
bW9kZSwgSFcgdGhhdCB1c2VzIDNEIExVVCBhbHNvIGFzc3VtZXMgbWluPTAuCgpTaWduZWQtb2Zm
LWJ5OiBLcnVub3NsYXYgS292YWMgPEtydW5vc2xhdi5Lb3ZhY0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xv
ci9jb2xvcl9nYW1tYS5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYwppbmRleCA4NWRhZDM1NmM5ZDUuLjFkZTQ4
MDVjYjhjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMv
Y29sb3IvY29sb3JfZ2FtbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9k
dWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCkBAIC05NTksMTEgKzk1OSw3IEBAIHN0YXRpYyBib29s
IGJ1aWxkX2ZyZWVzeW5jX2hkcihzdHJ1Y3QgcHdsX2Zsb2F0X2RhdGFfZXggKnJnYl9yZWdhbW1h
LAogCWlmIChmc19wYXJhbXMtPm1heF9kaXNwbGF5IDwgMTAwKSAvLyBjYXAgYXQgMTAwIGF0IHRo
ZSB0b3AKIAkJbWF4X2Rpc3BsYXkgPSBkY19maXhwdF9mcm9tX2ludCgxMDApOwogCi0JaWYgKGZz
X3BhcmFtcy0+bWluX2NvbnRlbnQgPCBmc19wYXJhbXMtPm1pbl9kaXNwbGF5KQotCQl1c2VfZWV0
ZiA9IHRydWU7Ci0JZWxzZQotCQltaW5fY29udGVudCA9IG1pbl9kaXNwbGF5OwotCisJLy8gb25s
eSBtYXggdXNlZCwgd2UgZG9uJ3QgYWRqdXN0IG1pbiBsdW1pbmFuY2UKIAlpZiAoZnNfcGFyYW1z
LT5tYXhfY29udGVudCA+IGZzX3BhcmFtcy0+bWF4X2Rpc3BsYXkpCiAJCXVzZV9lZXRmID0gdHJ1
ZTsKIAllbHNlCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
