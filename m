Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3910182
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB4A89244;
	Tue, 30 Apr 2019 21:10:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25389242
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:59 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 BL0PR12MB2369.namprd12.prod.outlook.com (2603:10b6:207:4d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Tue, 30 Apr 2019 21:09:58 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:57 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/20] drm/amd/display: Support AVI InfoFrame V3 and V4
Date: Tue, 30 Apr 2019 17:09:13 -0400
Message-ID: <20190430210938.32335-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(305945005)(2616005)(486006)(48376002)(50466002)(126002)(86362001)(476003)(72206003)(11346002)(77096007)(50226002)(1076003)(36756003)(446003)(6916009)(2351001)(5660300002)(426003)(81156014)(81166006)(14444005)(8676002)(4326008)(478600001)(26005)(356004)(6666004)(336012)(186003)(316002)(68736007)(7696005)(8936002)(76176011)(16586007)(2906002)(51416003)(47776003)(70206006)(70586007)(53936002)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2369; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb6591f-ce1c-4292-5674-08d6cdb03345
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BL0PR12MB2369; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2369:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2369E2A940BD9B06BD16E8ADF93A0@BL0PR12MB2369.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MUkl9qNcO7nnSKbMj/PE5XHqH3YZeGioGEPImjwlS9gBBt0bkmBwnDoN2XNkkSTPPK8S5Row0raAHgcyPktvRkr2Jicm+0bevfKuOISLxiQnZdl2PRLr0zT48luew1dUgwq+CJpqNhTLCOyJ5hkYp1qSoEcMfjcc0QdxkxnG42y7IbnaNj2F0naZQuaIMqRDb+FKWAvNFx0giaEX2fAJv0JpqFmZbOmc0B8m95Le87wBef99smnEoiLYhiN9XvCC6YTzoMhhKF07Cu0FSeC1SI/7DAOaChikIdP4uxHRpfL69SlWnXO4ZLSpiEufRT8jw4rEsbHQPu9bANh7NATHNwH4zW0K+JACmhVGOpSaeZo7jhuxvFB0qUgJXkOCQbvLeB+0ROwUxZzf+ag9FF51iH6HRlMwOpAe/r8AX/ZHG88=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:57.5732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb6591f-ce1c-4292-5674-08d6cdb03345
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2369
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1qQI2tnmCWYJV4ZhT3xOxwEW6MlJFhHxLsSKYHO920=;
 b=p81gZiTMPKV5VEZ4XwyCFqxDjqiDQ0x1zWD8Wy3plQjqOS9brFJx9i3jvTmAJ9UGbYTu9Gwfctc8c/GNk/IezITYNykknkMWcVVDN9Ltv2Uv4RDCQgFbc5u6h0O2fFuF1W0nKxImUvgg3ulN1QcXYTfHn7wSBh0CRtmQwFcRw9M=
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
Cc: Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgUGFyayA8Q2hyaXMuUGFya0BhbWQuY29tPgoKW1doeV0KUGFydCBvZiBIRE1J
IDIuMSByZXF1aXJlcyBBVkkgSW5mb0ZyYW1lIHZlcnNpb24gdXBkYXRlCmZyb20gY3VycmVudCBW
MiB0byBWMyBmb3IgbmV3IFZJQ3MsIGFuZCBWNCBmb3IKbmV3IGNvbG9yaW1ldHJ5LgoKW0hvd10K
SW1wbGVtZW50IFYzIGFuZCBWNCBBVkkgSW5mb0ZyYW1lLgpJZiAoQzEsIEMwKT0oMSwgMSkgYW5k
IChFQzIsIEVDMSwgRUMwKT0oMSwgMSwgMSksCnRoZSBTb3VyY2Ugc2hhbGwgdXNlIDIwIEFWSSBJ
bmZvRnJhbWUgVmVyc2lvbiA0LgpJZiBWSUMgPj0gMTI4LCB0aGUgU291cmNlIHNoYWxsIHVzZSBB
VkkgSW5mb0ZyYW1lIFZlcnNpb24gMwoKQ2hhbmdlLUlkOiBJOGY4NDZmZDAxYmRmODg3MTc5NzYz
MTRiMDE5MmFiYzk0N2FhYWM1NApTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYXJrIDxDaHJpcy5QYXJr
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBOZXZlbmtvIFN0dXBhciA8TmV2ZW5rby5TdHVwYXJAYW1k
LmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNl
LmMgfCAxNSArKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19yZXNvdXJjZS5jCmluZGV4IGVhYzcxODZlNGYwOC4uOWVmNDE3ZWI2OTdkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMK
QEAgLTIzNTQsNyArMjM1NCwxOCBAQCBzdGF0aWMgdm9pZCBzZXRfYXZpX2luZm9fZnJhbWUoCiAJ
CQlicmVhazsKIAkJfQogCX0KKwkvKiBJZiBWSUMgPj0gMTI4LCB0aGUgU291cmNlIHNoYWxsIHVz
ZSBBVkkgSW5mb0ZyYW1lIFZlcnNpb24gMyovCiAJaGRtaV9pbmZvLmJpdHMuVklDMF9WSUM3ID0g
dmljOworCWlmICh2aWMgPj0gMTI4KQorCQloZG1pX2luZm8uYml0cy5oZWFkZXIudmVyc2lvbiA9
IDM7CisJLyogSWYgKEMxLCBDMCk9KDEsIDEpIGFuZCAoRUMyLCBFQzEsIEVDMCk9KDEsIDEsIDEp
LAorCSAqIHRoZSBTb3VyY2Ugc2hhbGwgdXNlIDIwIEFWSSBJbmZvRnJhbWUgVmVyc2lvbiA0CisJ
ICovCisJaWYgKGhkbWlfaW5mby5iaXRzLkMwX0MxID09IENPTE9SSU1FVFJZX0VYVEVOREVEICYm
CisJCQloZG1pX2luZm8uYml0cy5FQzBfRUMyID09IENPTE9SSU1FVFJZRVhfUkVTRVJWRUQpIHsK
KwkJaGRtaV9pbmZvLmJpdHMuaGVhZGVyLnZlcnNpb24gPSA0OworCQloZG1pX2luZm8uYml0cy5o
ZWFkZXIubGVuZ3RoID0gMTQ7CisJfQogCiAJLyogcGl4ZWwgcmVwZXRpdGlvbgogCSAqIFBSMCAt
IFBSMyBzdGFydCBmcm9tIDAgd2hlcmVhcyBwSHdQYXRoTW9kZS0+bW9kZS50aW1pbmcuZmxhZ3Mu
cGl4ZWwKQEAgLTIzNzYsOSArMjM4Nyw5IEBAIHN0YXRpYyB2b2lkIHNldF9hdmlfaW5mb19mcmFt
ZSgKIAkvKiBjaGVja19zdW0gLSBDYWxjdWxhdGUgQUZNVF9BVklfSU5GTzAgfiBBRk1UX0FWSV9J
TkZPMyAqLwogCWNoZWNrX3N1bSA9ICZoZG1pX2luZm8ucGFja2V0X3Jhd19kYXRhLnNiWzBdOwog
Ci0JKmNoZWNrX3N1bSA9IEhETUlfSU5GT0ZSQU1FX1RZUEVfQVZJICsgSERNSV9BVklfSU5GT0ZS
QU1FX1NJWkUgKyAyOworCSpjaGVja19zdW0gPSBIRE1JX0lORk9GUkFNRV9UWVBFX0FWSSArIGhk
bWlfaW5mby5iaXRzLmhlYWRlci5sZW5ndGggKyBoZG1pX2luZm8uYml0cy5oZWFkZXIudmVyc2lv
bjsKIAotCWZvciAoYnl0ZV9pbmRleCA9IDE7IGJ5dGVfaW5kZXggPD0gSERNSV9BVklfSU5GT0ZS
QU1FX1NJWkU7IGJ5dGVfaW5kZXgrKykKKwlmb3IgKGJ5dGVfaW5kZXggPSAxOyBieXRlX2luZGV4
IDw9IGhkbWlfaW5mby5iaXRzLmhlYWRlci5sZW5ndGg7IGJ5dGVfaW5kZXgrKykKIAkJKmNoZWNr
X3N1bSArPSBoZG1pX2luZm8ucGFja2V0X3Jhd19kYXRhLnNiW2J5dGVfaW5kZXhdOwogCiAJLyog
b25lIGJ5dGUgY29tcGxlbWVudCAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
