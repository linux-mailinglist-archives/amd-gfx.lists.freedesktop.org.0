Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62C7AA4D
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 15:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB25C89AC3;
	Tue, 30 Jul 2019 13:57:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750047.outbound.protection.outlook.com [40.107.75.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942189AC3
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 13:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dppFW9ouJevj/Ak9UV3ytdJwiu1g40VKUzNfi7FsHufW7jYwpIpoAkwf6hH12nGfejd3Jm/wtiLx6ot/WtiJ7niIDSERdFsNHMviO4seJWMkh9e5S+vF381UgSFEEyHJ00xKQSBaj6+f1nHd3pXlTT8KZDjztw9nQ5M57Oc8T6yRE9njTxwdqbg8pPY7HHQ6bYeapnt2+0mxolnNIH+l8WPY1BdL9BgVDyX3kTpWOzz5s2pd8HPPrq9IOu6dUd9saYW0Y3vNmzAi3DdEKhyTnxG6SohfCj/Mijjg/4aec/mwI+ikMEveukOHkm9/I9Mlwi+ncylVl5rSh1UXycByxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nfFj+ihUTgiaqvtnIVq65cibJQ5f3lZZSwQ85/Opno=;
 b=XNs+FvT2YJr+1zZ89AHp3yEpN9nCROklNbDw0+8GdmGghVaiikLJ3bsOZ+B517ZLc2yqi/FO8j71zGS1nsuUoURnCgukw/4NCPd9pw+NKpnwUUw24EiwjGDwKDVHak7gM+VK4fjBXZuOWxcDKKoxVLPgVcwkPwkEhiICid0Nmyod+kSq4tQZiWcMpivHj+7wia5Vp0zRl47wyhk+J5OATrKzdgN9gU1Pem1m9TAAYjvEoE+4HU4LC/AaKAFhJAbv4ZLhbiqdg2FAMI0RJUxIciaFhW3YJ1JO/K9F/kSaXYrMmjYwzdqzonKdE2VQG9ed1XIFyqtpdX7Ov1UIwgXj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Tue, 30 Jul
 2019 13:57:55 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 13:57:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 13:57:54 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Jul 2019
 08:57:53 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/display: Embed DCN2 SOC bounding box
Date: Tue, 30 Jul 2019 09:57:32 -0400
Message-ID: <20190730135733.14563-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(428003)(199004)(189003)(48376002)(70586007)(51416003)(356004)(8936002)(86362001)(50466002)(50226002)(5660300002)(6916009)(305945005)(47776003)(1076003)(81166006)(2906002)(316002)(36756003)(54906003)(8676002)(53416004)(476003)(2616005)(426003)(186003)(126002)(486006)(336012)(14444005)(478600001)(53936002)(81156014)(6666004)(7696005)(68736007)(16586007)(70206006)(2351001)(44832011)(4326008)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2420; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c12f970d-2a60-4d3b-0634-08d714f5eb9e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BL0PR12MB2420; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2420:
X-Microsoft-Antispam-PRVS: <BL0PR12MB242026B594FE3C7D5FA61239ECDC0@BL0PR12MB2420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BZZje8wNdKST113ylSHPZx88vxFYqH87Sw3E34X3Lj2K2HvUqrH7EzeEN/LFMNkNAA+dKAMCjWmn9du9g1CvhE7nFE0V6m7wpNqahIfEh0AzKJvsOP1MprIw24yqc+dZfSQB/iMWv1xDd/KH8tyTeSqPthTKJ9PfbB99eisc+RV5BcEkxbQwUZ1lStwirlQ8EvL6tCXoDivEWqdgeZrKkoP/byRuLVmZlqh6V26vdxfEz8joIRrqme0lreAC76XpcBEBatU/i7KNjc6QD18/cnAerYqBjcVodECfi3x4vq9jFihVRWZH+VTw+DRfWOGWmybWrKezH9YIghsZKsP/hnFv8VoSJY0hdSM6vJ78Bz+znD6G4/xI0EMKdQyZ0092L0HE8r6dcPZMz/DSfPaL5vvJNSXDekZPrKb5eHTVTds=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 13:57:54.6878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12f970d-2a60-4d3b-0634-08d714f5eb9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nfFj+ihUTgiaqvtnIVq65cibJQ5f3lZZSwQ85/Opno=;
 b=CM5OAqfj04M6T/EB7YLlFz+M7sT2wXHKf2Z4SP6oPDgxbr8hSGW0Y8FprlZP2JmUf3TyOJb4N9tIOVJNr9q6Dt08w2I9QHHf2trm4VnLpoN5lDzZcur21p8wnOczqK9pjcOveAm68MGJun2BEk6zl2FqcjrIMKwPf4tzA5J7RlM=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KSW4gb3JkZXIgdG8gc3VwcG9ydCB1Y2xrIHN3aXRjaGluZyBvbiBOVjEwIHRoZSBTT0Mg
Ym91bmRpbmcgYm94Cm5lZWRzIHRvIGJlIHVwZGF0ZWQuCgpbSG93XQpXZSBjdXJyZW50bHkgcmVh
ZCB0aGUgY29uc3RhbnRzIGZyb20gdGhlIGdwdSBpbmZvIEZXLCBidXQgc3VwcG9ydGluZwp3b3Jr
YXJvdW5kcyBpbiBEQyBmb3IgZGlmZmVyZW50IHZlcnNpb25zIG9mIHRoZSBGVyBhZGRzIGFkZGl0
aW9uYWwKY29tcGxleGl0eSB0byB0aGUgY29kZWJhc2UuCgpOVjEwIGhhcyBiZWVuIHJlbGVhc2Vk
IHNvIGl0J3MgY2xlYW5lc3QgdG8ga2VlcCB0aGUgYm91bmRpbmcgYm94IGFuZApzb3VyY2UgY29k
ZSBpbiBzeW5jIGJ5IGVtYmVkZGluZyB0aGUgYm91bmRpbmcgYm94IGxpa2Ugd2UgZG8gZm9yCm90
aGVyIEFTSUNzLgoKRml4ZXM6IDAyMzE2ZTk2M2E1YSAoImRybS9hbWQvZGlzcGxheTogRm9yY2Ug
dWNsayB0byBtYXggZm9yIGV2ZXJ5IHN0YXRlIikKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuYyB8IDExNCArKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMTIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDQ0NTM3NjUxZjBhMS4u
ZmYzMGY1Y2M0OTgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtODAsNyArODAsNyBAQAogCiAjaW5jbHVkZSAi
YW1kZ3B1X3NvY2JiLmgiCiAKLSNkZWZpbmUgU09DX0JPVU5ESU5HX0JPWF9WQUxJRCBmYWxzZQor
I2RlZmluZSBTT0NfQk9VTkRJTkdfQk9YX1ZBTElEIHRydWUKICNkZWZpbmUgRENfTE9HR0VSX0lO
SVQobG9nZ2VyKQogCiBzdHJ1Y3QgX3Zjc19kcGlfaXBfcGFyYW1zX3N0IGRjbjJfMF9pcCA9IHsK
QEAgLTE1NCw3ICsxNTQsMTE3IEBAIHN0cnVjdCBfdmNzX2RwaV9pcF9wYXJhbXNfc3QgZGNuMl8w
X2lwID0gewogCS54ZmNfZmlsbF9jb25zdGFudF9ieXRlcyA9IDAsCiB9OwogCi1zdHJ1Y3QgX3Zj
c19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCBkY24yXzBfc29jID0geyAwIH07CitzdHJ1Y3QgX3Zj
c19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCBkY24yXzBfc29jID0geworCS8qIERlZmF1bHRzIHRo
YXQgZ2V0IHBhdGNoZWQgb24gZHJpdmVyIGxvYWQgZnJvbSBmaXJtd2FyZS4gKi8KKwkuY2xvY2tf
bGltaXRzID0geworCQkJeworCQkJCS5zdGF0ZSA9IDAsCisJCQkJLmRjZmNsa19taHogPSA1NjAu
MCwKKwkJCQkuZmFicmljY2xrX21oeiA9IDU2MC4wLAorCQkJCS5kaXNwY2xrX21oeiA9IDUxMy4w
LAorCQkJCS5kcHBjbGtfbWh6ID0gNTEzLjAsCisJCQkJLnBoeWNsa19taHogPSA1NDAuMCwKKwkJ
CQkuc29jY2xrX21oeiA9IDU2MC4wLAorCQkJCS5kc2NjbGtfbWh6ID0gMTcxLjAsCisJCQkJLmRy
YW1fc3BlZWRfbXRzID0gODk2MC4wLAorCQkJfSwKKwkJCXsKKwkJCQkuc3RhdGUgPSAxLAorCQkJ
CS5kY2ZjbGtfbWh6ID0gNjk0LjAsCisJCQkJLmZhYnJpY2Nsa19taHogPSA2OTQuMCwKKwkJCQku
ZGlzcGNsa19taHogPSA2NDIuMCwKKwkJCQkuZHBwY2xrX21oeiA9IDY0Mi4wLAorCQkJCS5waHlj
bGtfbWh6ID0gNjAwLjAsCisJCQkJLnNvY2Nsa19taHogPSA2OTQuMCwKKwkJCQkuZHNjY2xrX21o
eiA9IDIxNC4wLAorCQkJCS5kcmFtX3NwZWVkX210cyA9IDExMTA0LjAsCisJCQl9LAorCQkJewor
CQkJCS5zdGF0ZSA9IDIsCisJCQkJLmRjZmNsa19taHogPSA4NzUuMCwKKwkJCQkuZmFicmljY2xr
X21oeiA9IDg3NS4wLAorCQkJCS5kaXNwY2xrX21oeiA9IDczNC4wLAorCQkJCS5kcHBjbGtfbWh6
ID0gNzM0LjAsCisJCQkJLnBoeWNsa19taHogPSA4MTAuMCwKKwkJCQkuc29jY2xrX21oeiA9IDg3
NS4wLAorCQkJCS5kc2NjbGtfbWh6ID0gMjQ1LjAsCisJCQkJLmRyYW1fc3BlZWRfbXRzID0gMTQw
MDAuMCwKKwkJCX0sCisJCQl7CisJCQkJLnN0YXRlID0gMywKKwkJCQkuZGNmY2xrX21oeiA9IDEw
MDAuMCwKKwkJCQkuZmFicmljY2xrX21oeiA9IDEwMDAuMCwKKwkJCQkuZGlzcGNsa19taHogPSAx
MTAwLjAsCisJCQkJLmRwcGNsa19taHogPSAxMTAwLjAsCisJCQkJLnBoeWNsa19taHogPSA4MTAu
MCwKKwkJCQkuc29jY2xrX21oeiA9IDEwMDAuMCwKKwkJCQkuZHNjY2xrX21oeiA9IDM2Ny4wLAor
CQkJCS5kcmFtX3NwZWVkX210cyA9IDE2MDAwLjAsCisJCQl9LAorCQkJeworCQkJCS5zdGF0ZSA9
IDQsCisJCQkJLmRjZmNsa19taHogPSAxMjAwLjAsCisJCQkJLmZhYnJpY2Nsa19taHogPSAxMjAw
LjAsCisJCQkJLmRpc3BjbGtfbWh6ID0gMTI4NC4wLAorCQkJCS5kcHBjbGtfbWh6ID0gMTI4NC4w
LAorCQkJCS5waHljbGtfbWh6ID0gODEwLjAsCisJCQkJLnNvY2Nsa19taHogPSAxMjAwLjAsCisJ
CQkJLmRzY2Nsa19taHogPSA0MjguMCwKKwkJCQkuZHJhbV9zcGVlZF9tdHMgPSAxNjAwMC4wLAor
CQkJfSwKKwkJCS8qRXh0cmEgc3RhdGUsIG5vIGRpc3BjbGsgcmFtcGluZyovCisJCQl7CisJCQkJ
LnN0YXRlID0gNSwKKwkJCQkuZGNmY2xrX21oeiA9IDEyMDAuMCwKKwkJCQkuZmFicmljY2xrX21o
eiA9IDEyMDAuMCwKKwkJCQkuZGlzcGNsa19taHogPSAxMjg0LjAsCisJCQkJLmRwcGNsa19taHog
PSAxMjg0LjAsCisJCQkJLnBoeWNsa19taHogPSA4MTAuMCwKKwkJCQkuc29jY2xrX21oeiA9IDEy
MDAuMCwKKwkJCQkuZHNjY2xrX21oeiA9IDQyOC4wLAorCQkJCS5kcmFtX3NwZWVkX210cyA9IDE2
MDAwLjAsCisJCQl9LAorCQl9LAorCS5udW1fc3RhdGVzID0gNSwKKwkuc3JfZXhpdF90aW1lX3Vz
ID0gOC42LAorCS5zcl9lbnRlcl9wbHVzX2V4aXRfdGltZV91cyA9IDEwLjksCisJLnVyZ2VudF9s
YXRlbmN5X3VzID0gNC4wLAorCS51cmdlbnRfbGF0ZW5jeV9waXhlbF9kYXRhX29ubHlfdXMgPSA0
LjAsCisJLnVyZ2VudF9sYXRlbmN5X3BpeGVsX21peGVkX3dpdGhfdm1fZGF0YV91cyA9IDQuMCwK
KwkudXJnZW50X2xhdGVuY3lfdm1fZGF0YV9vbmx5X3VzID0gNC4wLAorCS51cmdlbnRfb3V0X29m
X29yZGVyX3JldHVybl9wZXJfY2hhbm5lbF9waXhlbF9vbmx5X2J5dGVzID0gNDA5NiwKKwkudXJn
ZW50X291dF9vZl9vcmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxfcGl4ZWxfYW5kX3ZtX2J5dGVzID0g
NDA5NiwKKwkudXJnZW50X291dF9vZl9vcmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxfdm1fb25seV9i
eXRlcyA9IDQwOTYsCisJLnBjdF9pZGVhbF9kcmFtX3NkcF9id19hZnRlcl91cmdlbnRfcGl4ZWxf
b25seSA9IDQwLjAsCisJLnBjdF9pZGVhbF9kcmFtX3NkcF9id19hZnRlcl91cmdlbnRfcGl4ZWxf
YW5kX3ZtID0gNDAuMCwKKwkucGN0X2lkZWFsX2RyYW1fc2RwX2J3X2FmdGVyX3VyZ2VudF92bV9v
bmx5ID0gNDAuMCwKKwkubWF4X2F2Z19zZHBfYndfdXNlX25vcm1hbF9wZXJjZW50ID0gNDAuMCwK
KwkubWF4X2F2Z19kcmFtX2J3X3VzZV9ub3JtYWxfcGVyY2VudCA9IDQwLjAsCisJLndyaXRlYmFj
a19sYXRlbmN5X3VzID0gMTIuMCwKKwkuaWRlYWxfZHJhbV9id19hZnRlcl91cmdlbnRfcGVyY2Vu
dCA9IDQwLjAsCisJLm1heF9yZXF1ZXN0X3NpemVfYnl0ZXMgPSAyNTYsCisJLmRyYW1fY2hhbm5l
bF93aWR0aF9ieXRlcyA9IDIsCisJLmZhYnJpY19kYXRhcGF0aF90b19kY25fZGF0YV9yZXR1cm5f
Ynl0ZXMgPSA2NCwKKwkuZGNuX2Rvd25zcHJlYWRfcGVyY2VudCA9IDAuNSwKKwkuZG93bnNwcmVh
ZF9wZXJjZW50ID0gMC4zOCwKKwkuZHJhbV9wYWdlX29wZW5fdGltZV9ucyA9IDUwLjAsCisJLmRy
YW1fcndfdHVybmFyb3VuZF90aW1lX25zID0gMTcuNSwKKwkuZHJhbV9yZXR1cm5fYnVmZmVyX3Bl
cl9jaGFubmVsX2J5dGVzID0gODE5MiwKKwkucm91bmRfdHJpcF9waW5nX2xhdGVuY3lfZGNmY2xr
X2N5Y2xlcyA9IDEzMSwKKwkudXJnZW50X291dF9vZl9vcmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxf
Ynl0ZXMgPSAyNTYsCisJLmNoYW5uZWxfaW50ZXJsZWF2ZV9ieXRlcyA9IDI1NiwKKwkubnVtX2Jh
bmtzID0gOCwKKwkubnVtX2NoYW5zID0gMTYsCisJLnZtbV9wYWdlX3NpemVfYnl0ZXMgPSA0MDk2
LAorCS5kcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5X3VzID0gNDA0LjAsCisJLmR1bW15X3BzdGF0
ZV9sYXRlbmN5X3VzID0gNS4wLAorCS53cml0ZWJhY2tfZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5j
eV91cyA9IDIzLjAsCisJLnJldHVybl9idXNfd2lkdGhfYnl0ZXMgPSA2NCwKKwkuZGlzcGNsa19k
cHBjbGtfdmNvX3NwZWVkX21oeiA9IDM4NTAsCisJLnhmY19idXNfdHJhbnNwb3J0X3RpbWVfdXMg
PSAyMCwKKwkueGZjX3hidWZfbGF0ZW5jeV90b2xlcmFuY2VfdXMgPSA0LAorCS51c2VfdXJnZW50
X2J1cnN0X2J3ID0gMAorfTsKIAogCiAjaWZuZGVmIG1tRFAwX0RQX0RQSFlfSU5URVJOQUxfQ1RS
TAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
