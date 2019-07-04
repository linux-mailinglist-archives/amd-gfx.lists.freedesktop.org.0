Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041895FB7B
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2444A6E37F;
	Thu,  4 Jul 2019 16:06:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E15A6E36F
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:17 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by CY4PR12MB1845.namprd12.prod.outlook.com (2603:10b6:903:126::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 4 Jul
 2019 16:06:13 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:13 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:57 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/17] drm/amdgpu: add jpeg enc sw and hw init
Date: Thu, 4 Jul 2019 12:04:19 -0400
Message-ID: <20190704160429.14758-7-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(199004)(189003)(478600001)(336012)(72206003)(81166006)(81156014)(8676002)(76176011)(77096007)(26005)(16526019)(186003)(8936002)(4326008)(2876002)(2906002)(70206006)(5660300002)(70586007)(53936002)(3846002)(6116002)(68736007)(7736002)(6666004)(50226002)(486006)(1076003)(305945005)(126002)(476003)(356004)(86362001)(11346002)(2616005)(446003)(50466002)(426003)(48376002)(36756003)(316002)(51416003)(7696005)(16586007)(6916009)(47776003)(53416004)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1845; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52f50815-4227-4d83-fd25-08d70099899f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR12MB1845; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1845:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1845A530B15B335DD9E8E3C687FA0@CY4PR12MB1845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ykdY4oHuyORV7t/rYCChxw6jjbt0QBXQdgqYyxO28lYpbvBoKlxtA+lYbYp7SKonJpgHwlNGh719sNW6p0tdZDvBhsfYbqzIU8lQfZVAr8mZurWhhOo8dfb9a32WT+qmC8esSYgFWOWDgoUBqbwum+sPsdbu1l6J5JUy1ohEvaLtUOxb6W1t0rsHu4gqYxdARxCpc/GwYJ9Zm4wetGp08Zktzm7N+gIVbpuM5HL9TrMqMLlvvKM2WqTQzWJQpQcCp85Ku0MMgQ+0fuKWTf72sQg8cyfp2fLIbfuhOx94lvcy2VOx7W0BpGwBPNxaYXnPdm/eLxaZcUcbR1pHKjqNoo8CMm52qCX9z1qB4AciDTUpzVThNYRWp9auPG0vGUOcylNv2TafNINDhkafdOxVyQKk7dEU338zbwhEQjR+15M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:13.3583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f50815-4227-4d83-fd25-08d70099899f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADQnyzgzZrqGchFG8f6luOwrFlPzG6hwSdg7NRTnThc=;
 b=Rzst2QTwIZ0CMRJqjebLWRdjjLYHtnjLNe0iG0Dx8gHysh2M/xVNJ8dHOHut+nY/XY8+vyLWCprdsVqFrce5FllxybVF4siWYq2alf/8YBntj+4a1YA1x3cyiOsZIPAKcXwybGgQIU8PBplOYtyPHnMyBHEVCUqAZzusx9tJHNc=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBzb2Z0d2FyZSBh
bmQgaGFyZHdhcmUgaW5pdCBmb3IganBlZyBlbmNvZGUgcmluZy4KClNpZ25lZC1vZmYtYnk6IEJv
eXVhbiBaaGFuZyA8Ym95dWFuLnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzAuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKaW5kZXgg
NzY3ZjhjZTkyODc1Li5jYjc3NTU0Y2M2OTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYwpAQCAtMjE5LDYgKzIxOSwxNCBAQCBzdGF0aWMgaW50IHZjbl92Ml8wX3N3X2luaXQo
dm9pZCAqaGFuZGxlKQogCWFkZXYtPnZjbi5pbnRlcm5hbC5qcGVnX3BpdGNoID0gbW1VVkRfSlBF
R19QSVRDSF9JTlRFUk5BTF9PRkZTRVQ7CiAJYWRldi0+dmNuLmV4dGVybmFsLmpwZWdfcGl0Y2gg
PSBTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgMCwgbW1VVkRfSlBFR19QSVRDSCk7CiAKKwlyaW5nID0g
JmFkZXYtPnZjbi5yaW5nX2pwZWdfZW5jOworCXJpbmctPnVzZV9kb29yYmVsbCA9IHRydWU7CisJ
cmluZy0+ZG9vcmJlbGxfaW5kZXggPSAoYWRldi0+ZG9vcmJlbGxfaW5kZXgudmNuLnZjbl9yaW5n
MF8xIDw8IDEpICsgNzsKKwlzcHJpbnRmKHJpbmctPm5hbWUsICJ2Y25fanBlZ19lbmMiKTsKKwly
ID0gYW1kZ3B1X3JpbmdfaW5pdChhZGV2LCByaW5nLCA1MTIsICZhZGV2LT52Y24uaXJxLCAwKTsK
KwlpZiAocikKKwkJcmV0dXJuIHI7CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtMjg0LDYgKzI5Miwx
NCBAQCBzdGF0aWMgaW50IHZjbl92Ml8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQogCQlnb3RvIGRv
bmU7CiAJfQogCisJcmluZyA9ICZhZGV2LT52Y24ucmluZ19qcGVnX2VuYzsKKwlyaW5nLT5zY2hl
ZC5yZWFkeSA9IHRydWU7CisJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsKKwlpZiAo
cikgeworCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOworCQlnb3RvIGRvbmU7CisJfQorCiBk
b25lOgogCWlmICghcikKIAkJRFJNX0lORk8oIlZDTiBkZWNvZGUgYW5kIGVuY29kZSBpbml0aWFs
aXplZCBzdWNjZXNzZnVsbHkuXG4iKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
