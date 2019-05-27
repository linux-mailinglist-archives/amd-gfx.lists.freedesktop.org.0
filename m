Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6172BAE8
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD86289AA7;
	Mon, 27 May 2019 19:52:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710089.outbound.protection.outlook.com [40.107.71.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581BA89ABA
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:15 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Mon, 27 May 2019 19:52:14 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:52:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:12 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:59 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/26] drm/amd/display: Fix type of pp_smu_wm_set_range struct
Date: Mon, 27 May 2019 15:50:56 -0400
Message-ID: <1558986665-12964-18-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(199004)(189003)(16586007)(48376002)(11346002)(72206003)(356004)(86362001)(2351001)(446003)(426003)(486006)(126002)(6916009)(476003)(305945005)(6666004)(2616005)(316002)(53416004)(478600001)(70586007)(8676002)(2906002)(76176011)(186003)(47776003)(86152003)(77096007)(70206006)(50466002)(36756003)(68736007)(81166006)(81156014)(5660300002)(336012)(2876002)(8936002)(26005)(50226002)(53936002)(4326008)(51416003)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53cf6a83-dcb4-4faf-9c66-08d6e2dcd027
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126592D5EC7118E32FD47095821D0@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: D1FDickXyntwB7tS8/blVASdfh3Boginc60H1gCWowvnB0hALG+qvtXxGoJTmRIKdC8lP17Ms0X8JEzpNtEwl1FZdrrpgJed3cqPfM0JXzwR75JLhxnmPOd2FCtj3IYGW3cJlc+x9cdARu3Gn0YydRZYIKV5jeLJBZUVVOZ+Zw4+GhwFyzwQXzonU4AOm3caoqNUkoT/r07Imak9oc5gCsMMbQdBe5ghdJwpriCOdcIaj7djpGIUkUgWX7OL2u3vvHm15kXm74ryCMvHHkTZmdQDH6sRlvkmOyHaua6q602b5apJJaIiXwmTDM7SF1QUL5/fu3GG2c904KW3L4MvIG2gPsAeCxdzE8Fqmf67L4NUdTrvKUDHj8RapGfrtWBbSuL2f/RAMQ1AwoC42Q4imkMvVV/ULVZRmvgYMG3Fcvo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:12.9752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cf6a83-dcb4-4faf-9c66-08d6e2dcd027
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np+RIoQNVbrf062ZI6zkqccUcisjm92ZR9fbI7Q0+WY=;
 b=CIh6vZlmDCyGplDoi2AoEPoaUWU6j/xOjiUIE+bpntGSJLeZTDcyCDois1apUMbK7ewJkNmkSxwTidAEZw2q/egy9FrJW/9QA10lM44//zgqwuWXn5WUE4GsVwt5JNrxXio0XmqnvaKLi2WL7CzuOKUNOj1EU+nBgoBJ5vubol0=
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
Cc: Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+Cgpbd2h5XQpWYWx1ZSByZWFkIGZy
b20gU01VIGlzIDE2IGJpdHMsIG5vdCAzMi4KCltIb3ddCkZpeCB0eXBlLCBhbmQgYWRkIHdtX3R5
cGUgZW51bSBpbiBwcmVwYXJhdGlvbiBmb3IgZnV0dXJlIGludGVyZmFjZXMuCgpTaWduZWQtb2Zm
LWJ5OiBFcmljIFlhbmcgPEVyaWMuWWFuZzJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hl
bmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaCB8IDMx
ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RtX3BwX3NtdS5oCmluZGV4IDlmN2ViZjYuLjQ3MWYzZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZG1fcHBfc211LmgKQEAgLTQxLDYgKzQxLDcgQEAgZW51bSBwcF9zbXVf
dmVyIHsKIAkgKi8KIAlQUF9TTVVfVU5TVVBQT1JURUQsCiAJUFBfU01VX1ZFUl9SViwKKwogCVBQ
X1NNVV9WRVJfTUFYCiB9OwogCkBAIC01NiwxMiArNTcsMzEgQEAgc3RydWN0IHBwX3NtdSB7CiAJ
Y29uc3Qgdm9pZCAqZG07CiB9OwogCitlbnVtIHBwX3NtdV9zdGF0dXMgeworCVBQX1NNVV9SRVNV
TFRfVU5ERUZJTkVEID0gMCwKKwlQUF9TTVVfUkVTVUxUX09LID0gMSwKKwlQUF9TTVVfUkVTVUxU
X0ZBSUwsCisJUFBfU01VX1JFU1VMVF9VTlNVUFBPUlRFRAorfTsKKworCisjZGVmaW5lIFBQX1NN
VV9XTV9TRVRfUkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUlOIDB4MAorI2RlZmluZSBQUF9TTVVf
V01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01BWCAweEZGRkYKKworZW51bSB3bV90eXBl
IHsKKwlXTV9UWVBFX1BTVEFURV9DSEcgPSAwLAorCVdNX1RZUEVfUkVUUkFJTklORyA9IDEsCit9
OworCisvKiBUaGlzIHN0cnVjdHVyZSBpcyBhIGNvcHkgb2YgV2F0ZXJtYXJrUm93R2VuZXJpY190
IGRlZmluZWQgYnkgc211eHhfZHJpdmVyX2lmLmgqLwogc3RydWN0IHBwX3NtdV93bV9zZXRfcmFu
Z2UgewotCXVuc2lnbmVkIGludCB3bV9pbnN0OwotCXVpbnQzMl90IG1pbl9maWxsX2Nsa19taHo7
Ci0JdWludDMyX3QgbWF4X2ZpbGxfY2xrX21oejsKLQl1aW50MzJfdCBtaW5fZHJhaW5fY2xrX21o
ejsKLQl1aW50MzJfdCBtYXhfZHJhaW5fY2xrX21oejsKKwl1aW50MTZfdCBtaW5fZmlsbF9jbGtf
bWh6OworCXVpbnQxNl90IG1heF9maWxsX2Nsa19taHo7CisJdWludDE2X3QgbWluX2RyYWluX2Ns
a19taHo7CisJdWludDE2X3QgbWF4X2RyYWluX2Nsa19taHo7CisKKwl1aW50OF90IHdtX2luc3Q7
CisJdWludDhfdCB3bV90eXBlOwogfTsKIAogI2RlZmluZSBNQVhfV0FURVJNQVJLX1NFVFMgNApA
QCAtMTIyLDYgKzE0Miw3IEBAIHN0cnVjdCBwcF9zbXVfZnVuY3MgewogCXN0cnVjdCBwcF9zbXUg
Y3R4OwogCXVuaW9uIHsKIAkJc3RydWN0IHBwX3NtdV9mdW5jc19ydiBydl9mdW5jczsKKwogCX07
CiB9OwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
