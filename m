Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0279FC0
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 06:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157356E3A4;
	Tue, 30 Jul 2019 04:09:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5020D6E3A4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 04:09:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2cCsOLedW631qb8xUEi/etZKvrZ6+XLwRDDzxFg3IffFM2pPUIGCFQCIDM5PjqRSuZYvITH8btpV9FyFv/03+twfFt9TZcYn8kJDJLme1ou+Q+9lXB0OD9H1HEjWe+k2OJ9mj3D30rXb8wPyiuICNTLlt96tIUc8hQlwOvPvtgGurAF3CpRij98j+zXZzyiU55BvRnT74vuhypanUMnsnopJ/R/xvhRwz85BiN4J7nnnBPp9s/NiwhU/QOS5saE2IeqgQ+xAxsEAch1CmHdWMCUp8onPJtVTNm5i3lMCsmgu9TJZpTAQDIuLufDRCC708ufjVCxeBHwwpWAepmnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSmRxaPkDD1jCwt/zwb51av1d699cWYzWlEHKYzw/Xo=;
 b=VTBDwi1Y+zvr/7QxaZ4/hweMyUjKzGRdlqq2tO59EC6P9MND/oEKO99L32iJc09oz28ErtVc2r9oKGbJppJZXhpjv4k2+1BYFsUQoYll2mWeFuIiHfWf/phyVzlpqvcfS+PdFKGHyaL6SeakeGOD4wOrtHcTNS/vRgVhfZyAmspmlBkET17fUcjyUA9DZ/sff+j5MezzDaJspoaqb9CUrKJvDuEzeU37f6OGw2PNLq6YtVsbH21o0UAqOWY8dzzCiOg1hutVmGtLEpBMxq6ZVIGeTz0qJmTVWj/qj5zAN7I0qhAEYmuOtvDi7r+zmlqcX8pTtjcZU4GVQAhM0MibcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0059.namprd12.prod.outlook.com (2603:10b6:0:56::27) by
 MW2PR12MB2425.namprd12.prod.outlook.com (2603:10b6:907:8::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 04:09:15 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by DM3PR12CA0059.outlook.office365.com
 (2603:10b6:0:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 04:09:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 04:09:15 +0000
Received: from lnx-kenneth.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 29 Jul 2019
 23:09:13 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/powerplay: provide the interface to disable uclk
 switch for DAL
Date: Tue, 30 Jul 2019 12:09:07 +0800
Message-ID: <1564459747-21206-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(47776003)(8936002)(336012)(86362001)(26005)(2351001)(126002)(53936002)(186003)(44832011)(14444005)(2906002)(5660300002)(356004)(6666004)(486006)(4326008)(2616005)(476003)(81156014)(81166006)(70206006)(36756003)(426003)(7696005)(8676002)(6916009)(478600001)(16586007)(68736007)(70586007)(305945005)(51416003)(316002)(53416004)(50466002)(50226002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2425; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06e51e28-acb4-43ce-8399-08d714a3afcc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MW2PR12MB2425; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2425:
X-Microsoft-Antispam-PRVS: <MW2PR12MB24258276CCC33F1029AA1F348EDC0@MW2PR12MB2425.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7utoTujItL7rlbx8T1TzwtGJx8VtZZP3RKOro0ENeI2K7v3MQGEYtA3wShYZShfbTntoq/gaySKZ514DbJt1fHeXtJvwhPJgsJcapEG+xl92JFOroCmWCFuVMSDzwKbfpSlaka/1sqcHvqdjGLBOasJnpCWahgFMX70pvN5Jzlvdx5BBHeAQp5tGGqctlXEGRWZqSSDEiNYtMPb93lDO7Ch3MWHrvQ/Kqg4Ol8rkUQAZ3q01dZUoZ+187eCzLmyQc0q2W6nAxExF09CsbguzE5gd5X7CvePKBF6QZHJWzbyGnZgfm3dM+LdbVxrQyCVVIRAXG4hCJszrcPrxR3jH7thjDxzik+JlxvZwXxf06Fh/WVjG38wUYKJi0+CDi3xpqwVb+htehIfjDvjgDbLyIt548onyb2dnQn59XYGMqoo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 04:09:15.6864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e51e28-acb4-43ce-8399-08d714a3afcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2425
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSmRxaPkDD1jCwt/zwb51av1d699cWYzWlEHKYzw/Xo=;
 b=Pq5Mxguvk2lv3ITo3sP9Go1F57KfrwYFjrXCsfLUmUB55DFW8sTIPtTfJzvzlZoNWFT2ALzqtBuSzYXKzfVmQaP7UfIcLIENhhu/FgMsgNAb4MN3QH7ABOIEtdpF5XKJVrzJ9WneylCfl6U+bjXguG+QYarDQ/iwsElTW0XlqSQ=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cHJvdmlkZSB0aGUgaW50ZXJmYWNlIGZvciBEQUwgdG8gZGlzYWJsZSB1Y2xrIHN3aXRjaCBvbiBu
YXZpMTAuCmluIHRoaXMgY2FzZSwgdGhlIHVjbGsgd2lsbCBiZSBmaXhlZCB0byBtYXhpbXVtLgp0
aGlzIGlzIGEgd29ya2Fyb3VuZCB3aGVuIGRpc3BsYXkgY29uZmlndXJhdGlvbiBjYXVzZXMgdW5k
ZXJmbG93IGlzc3VlLgoKU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdA
YW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBf
c211LmMgICB8IDE3ICsrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2FtZGdwdV9zbXUuaCAgICAgfCAgNSArKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgICAgICB8ICA3
ICsrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUu
YwppbmRleCA3YmM3YWJjLi41YjQzMjNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYwpAQCAtODAyLDYgKzgw
MiwyMiBAQCBlbnVtIHBwX3NtdV9zdGF0dXMgcHBfbnZfc2V0X2hhcmRfbWluX3VjbGtfYnlfZnJl
cShzdHJ1Y3QgcHBfc211ICpwcCwgaW50IG1oeikKIAlyZXR1cm4gUFBfU01VX1JFU1VMVF9PSzsK
IH0KIAorZW51bSBwcF9zbXVfc3RhdHVzIHBwX252X3NldF9wc3RhdGVfaGFuZHNoYWtlX3N1cHBv
cnQoc3RydWN0IHBwX3NtdSAqcHAsCisJCQkJCQkJCQkJCQkJQk9PTEVBTiBwc3RhdGVfaGFuZHNo
YWtlX3N1cHBvcnRlZCkKK3sKKwljb25zdCBzdHJ1Y3QgZGNfY29udGV4dCAqY3R4ID0gcHAtPmRt
OworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5kcml2ZXJfY29udGV4dDsKKwlz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5zbXU7CisKKwlpZiAoIXNtdS0+cHB0X2Z1
bmNzKQorCQlyZXR1cm4gUFBfU01VX1JFU1VMVF9VTlNVUFBPUlRFRDsKKworCWlmIChzbXVfZGlz
cGxheV9kaXNhYmxlX21lbW9yeV9jbG9ja19zd2l0Y2goc211LCAhcHN0YXRlX2hhbmRzaGFrZV9z
dXBwb3J0ZWQpKQorCQlyZXR1cm4gUFBfU01VX1JFU1VMVF9GQUlMOworCisJcmV0dXJuIFBQX1NN
VV9SRVNVTFRfT0s7Cit9CisKIGVudW0gcHBfc211X3N0YXR1cyBwcF9udl9zZXRfdm9sdGFnZV9i
eV9mcmVxKHN0cnVjdCBwcF9zbXUgKnBwLAogCQllbnVtIHBwX3NtdV9udl9jbG9ja19pZCBjbG9j
a19pZCwgaW50IG1oeikKIHsKQEAgLTkxNyw2ICs5MzMsNyBAQCB2b2lkIGRtX3BwX2dldF9mdW5j
cygKIAkJZnVuY3MtPm52X2Z1bmNzLmdldF9tYXhpbXVtX3N1c3RhaW5hYmxlX2Nsb2NrcyA9IHBw
X252X2dldF9tYXhpbXVtX3N1c3RhaW5hYmxlX2Nsb2NrczsKIAkJLyp0b2RvICBjb21wYXJlIGRh
dGEgd2l0aCB3aW5kb3cgZHJpdmVyICovCiAJCWZ1bmNzLT5udl9mdW5jcy5nZXRfdWNsa19kcG1f
c3RhdGVzID0gcHBfbnZfZ2V0X3VjbGtfZHBtX3N0YXRlczsKKwkJZnVuY3MtPm52X2Z1bmNzLnNl
dF9wc3RhdGVfaGFuZHNoYWtlX3N1cHBvcnQgPSBwcF9udl9zZXRfcHN0YXRlX2hhbmRzaGFrZV9z
dXBwb3J0OwogCQlicmVhazsKICNlbmRpZgogCWRlZmF1bHQ6CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAppbmRleCAzM2QyZDc1Li42NDJhMWIxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKQEAg
LTU0OSw2ICs1NDksOCBAQCBzdHJ1Y3Qgc211X2NvbnRleHQKICNkZWZpbmUgV0FURVJNQVJLU19F
WElTVAkoMSA8PCAwKQogI2RlZmluZSBXQVRFUk1BUktTX0xPQURFRAkoMSA8PCAxKQogCXVpbnQz
Ml90IHdhdGVybWFya3NfYml0bWFwOworCXVpbnQzMl90IGhhcmRfbWluX3VjbGtfcmVxX2Zyb21f
ZGFsOworCWJvb2wgZGlzYWJsZV91Y2xrX3N3aXRjaDsKIAogCXVpbnQzMl90IHdvcmtsb2FkX21h
c2s7CiAJdWludDMyX3Qgd29ya2xvYWRfcHJvcml0eVtXT1JLTE9BRF9QT0xJQ1lfTUFYXTsKQEAg
LTYzMiw2ICs2MzQsNyBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7CiAJaW50ICgqZ2V0X3VjbGtf
ZHBtX3N0YXRlcykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICpjbG9ja3NfaW5f
a2h6LCB1aW50MzJfdCAqbnVtX3N0YXRlcyk7CiAJaW50ICgqc2V0X2RlZmF1bHRfb2Rfc2V0dGlu
Z3MpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBib29sIGluaXRpYWxpemUpOwogCWludCAoKnNl
dF9wZXJmb3JtYW5jZV9sZXZlbCkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1kX2Rw
bV9mb3JjZWRfbGV2ZWwgbGV2ZWwpOworCWludCAoKmRpc3BsYXlfZGlzYWJsZV9tZW1vcnlfY2xv
Y2tfc3dpdGNoKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9vbCBkaXNhYmxlX21lbW9yeV9j
bG9ja19zd2l0Y2gpOwogfTsKIAogc3RydWN0IHNtdV9mdW5jcwpAQCAtODg0LDYgKzg4Nyw4IEBA
IHN0cnVjdCBzbXVfZnVuY3MKIAkoKHNtdSktPnBwdF9mdW5jcy0+Z2V0X2Nsb2NrX2J5X3R5cGVf
d2l0aF92b2x0YWdlID8gKHNtdSktPnBwdF9mdW5jcy0+Z2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF92
b2x0YWdlKChzbXUpLCAodHlwZSksIChjbG9ja3MpKSA6IDApCiAjZGVmaW5lIHNtdV9kaXNwbGF5
X2Nsb2NrX3ZvbHRhZ2VfcmVxdWVzdChzbXUsIGNsb2NrX3JlcSkgXAogCSgoc211KS0+ZnVuY3Mt
PmRpc3BsYXlfY2xvY2tfdm9sdGFnZV9yZXF1ZXN0ID8gKHNtdSktPmZ1bmNzLT5kaXNwbGF5X2Ns
b2NrX3ZvbHRhZ2VfcmVxdWVzdCgoc211KSwgKGNsb2NrX3JlcSkpIDogMCkKKyNkZWZpbmUgc211
X2Rpc3BsYXlfZGlzYWJsZV9tZW1vcnlfY2xvY2tfc3dpdGNoKHNtdSwgZGlzYWJsZV9tZW1vcnlf
Y2xvY2tfc3dpdGNoKSBcCisJKChzbXUpLT5wcHRfZnVuY3MtPmRpc3BsYXlfZGlzYWJsZV9tZW1v
cnlfY2xvY2tfc3dpdGNoID8gKHNtdSktPnBwdF9mdW5jcy0+ZGlzcGxheV9kaXNhYmxlX21lbW9y
eV9jbG9ja19zd2l0Y2goKHNtdSksIChkaXNhYmxlX21lbW9yeV9jbG9ja19zd2l0Y2gpKSA6IDAp
CiAjZGVmaW5lIHNtdV9nZXRfZGFsX3Bvd2VyX2xldmVsKHNtdSwgY2xvY2tzKSBcCiAJKChzbXUp
LT5mdW5jcy0+Z2V0X2RhbF9wb3dlcl9sZXZlbCA/IChzbXUpLT5mdW5jcy0+Z2V0X2RhbF9wb3dl
cl9sZXZlbCgoc211KSwgKGNsb2NrcykpIDogMCkKICNkZWZpbmUgc211X2dldF9wZXJmX2xldmVs
KHNtdSwgZGVzaWduYXRpb24sIGxldmVsKSBcCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKaW5kZXggYzg3MzIyOC4uYThjOThjNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMTY1NSw2ICsxNjU1LDMwIEBAIHN0YXRp
YyBpbnQgbmF2aTEwX2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LAogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IG5hdmkxMF9kaXNwbGF5X2Rp
c2FibGVfbWVtb3J5X2Nsb2NrX3N3aXRjaChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCQkJ
CWJvb2wgZGlzYWJsZV9tZW1vcnlfY2xvY2tfc3dpdGNoKQoreworCWludCByZXQgPSAwOworCXN0
cnVjdCBzbXVfMTFfMF9tYXhfc3VzdGFpbmFibGVfY2xvY2tzICptYXhfc3VzdGFpbmFibGVfY2xv
Y2tzID0KKwkJKHN0cnVjdCBzbXVfMTFfMF9tYXhfc3VzdGFpbmFibGVfY2xvY2tzICopCisJCQlz
bXUtPnNtdV90YWJsZS5tYXhfc3VzdGFpbmFibGVfY2xvY2tzOworCXVpbnQzMl90IG1pbl9tZW1v
cnlfY2xvY2sgPSBzbXUtPmhhcmRfbWluX3VjbGtfcmVxX2Zyb21fZGFsOworCXVpbnQzMl90IG1h
eF9tZW1vcnlfY2xvY2sgPSBtYXhfc3VzdGFpbmFibGVfY2xvY2tzLT51Y2xvY2s7CisKKwlpZihz
bXUtPmRpc2FibGVfdWNsa19zd2l0Y2ggPT0gZGlzYWJsZV9tZW1vcnlfY2xvY2tfc3dpdGNoKQor
CQlyZXR1cm4gMDsKKworCWlmKGRpc2FibGVfbWVtb3J5X2Nsb2NrX3N3aXRjaCkKKwkJcmV0ID0g
c211X3NldF9oYXJkX2ZyZXFfcmFuZ2Uoc211LCBTTVVfVUNMSywgbWF4X21lbW9yeV9jbG9jaywg
MCk7CisJZWxzZQorCQlyZXQgPSBzbXVfc2V0X2hhcmRfZnJlcV9yYW5nZShzbXUsIFNNVV9VQ0xL
LCBtaW5fbWVtb3J5X2Nsb2NrLCAwKTsKKworCWlmKCFyZXQpCisJCXNtdS0+ZGlzYWJsZV91Y2xr
X3N3aXRjaCA9IGRpc2FibGVfbWVtb3J5X2Nsb2NrX3N3aXRjaDsKKworCXJldHVybiByZXQ7Cit9
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0g
ewogCS50YWJsZXNfaW5pdCA9IG5hdmkxMF90YWJsZXNfaW5pdCwKIAkuYWxsb2NfZHBtX2NvbnRl
eHQgPSBuYXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQsCkBAIC0xNjkzLDYgKzE3MTcsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAku
c2V0X3BwZmVhdHVyZV9zdGF0dXMgPSBuYXZpMTBfc2V0X3BwZmVhdHVyZV9zdGF0dXMsCiAJLnNl
dF9wZXJmb3JtYW5jZV9sZXZlbCA9IG5hdmkxMF9zZXRfcGVyZm9ybWFuY2VfbGV2ZWwsCiAJLmdl
dF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlID0gbmF2aTEwX2dldF90aGVybWFsX3RlbXBlcmF0
dXJlX3JhbmdlLAorCS5kaXNwbGF5X2Rpc2FibGVfbWVtb3J5X2Nsb2NrX3N3aXRjaCA9IG5hdmkx
MF9kaXNwbGF5X2Rpc2FibGVfbWVtb3J5X2Nsb2NrX3N3aXRjaCwKIH07CiAKIHZvaWQgbmF2aTEw
X3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDc0NWIzNWEuLjIwMmI5ZDYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0xMzQ2LDE2ICsxMzQ2LDIz
IEBAIHNtdV92MTFfMF9kaXNwbGF5X2Nsb2NrX3ZvbHRhZ2VfcmVxdWVzdChzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwKIAkJaWYgKHJldCkKIAkJCWdvdG8gZmFpbGVkOwogCisJCWlmIChjbGtfc2Vs
ZWN0ID09IFNNVV9VQ0xLICYmIHNtdS0+ZGlzYWJsZV91Y2xrX3N3aXRjaCkKKwkJCXJldHVybiAw
OworCiAJCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3NlbGVjdCk7CiAJCWlm
IChjbGtfaWQgPCAwKSB7CiAJCQlyZXQgPSAtRUlOVkFMOwogCQkJZ290byBmYWlsZWQ7CiAJCX0K
IAorCiAJCW11dGV4X2xvY2soJnNtdS0+bXV0ZXgpOwogCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNn
X3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1NldEhhcmRNaW5CeUZyZXEsCiAJCQkoY2xrX2lkIDw8
IDE2KSB8IGNsa19mcmVxKTsKIAkJbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsKKworCQlpZihj
bGtfc2VsZWN0ID09IFNNVV9VQ0xLKQorCQkJc211LT5oYXJkX21pbl91Y2xrX3JlcV9mcm9tX2Rh
bCA9IGNsa19mcmVxOwogCX0KIAogZmFpbGVkOgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
