Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B373769DEE
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218E489D7F;
	Mon, 15 Jul 2019 21:22:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B65889D63
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCx4QSWiwc9P8RaU2r8wbJZsJLOdmfDAzvI6q8kRvLzgk8Nhgso/oiwwalIEwOo+LQlMyioCihoht/I0mdO/qEZTtQGL6F5Oq0dYI4yi4j8/tvx+XEpbBUFe227Z8leVK//ZKMJYXTivKqji3ktg9I7XmQqUd9KUEiFwK3nnFMNZPE4mvihB+btUmB9cfCz0xepF6GPW4GL6ONIAlDgM+HMickYneKiVfrQUsOfKvEsk3HKzeo20AkPj71KNz/WRSk6vrU8BTWN6rI4UiYv5g0ETmO5VL2yvyT5CLZfCxiibVGepNWjDDM3HlfQk2Z+SdULWHT7dFC9DrWYaZoGsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skMJGY9vknoHVE8wCjC5wnyAzi6gn+c9E3iWCiBdx2s=;
 b=kSy3IQK+gn8RnlB9wa0wqWXHmrpyuisTUJbzFlRS5qTDrK9MU09H75TyQ46h4nkFGG3itt9sAR6hGcdRFkqXjL2kGYEDhP8laySeBjZVwYOM3U6fG5cPn439vOiUOZ43ftvmzXZyWCdYOWQOtmiFy2VizwViKTju852pYQwUvRQZz0xIcnDSWcd2M56QcxmbRdkNhf3o1sXXDX5CwbbhErwu+fcTx/cZ6lH6eFer6lNhkXWd64ooG1CIXhsMma0o4uoEFA7L26hV/Zmv3v0AzAO7KGeMeTBfOGOITEerYo/gTTY04BDXSG1fFxFjsBDKBbHE/CTjo0hQFzatVHpt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0103.namprd12.prod.outlook.com (2603:10b6:0:55::23) by
 CY4PR12MB1926.namprd12.prod.outlook.com (2603:10b6:903:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:22:07 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0103.outlook.office365.com
 (2603:10b6:0:55::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:06 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:44 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 87/87] drm/amd/display: Force uclk to max for every state
Date: Mon, 15 Jul 2019 17:20:49 -0400
Message-ID: <20190715212049.4584-88-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(2351001)(14444005)(486006)(8936002)(126002)(5660300002)(316002)(36756003)(186003)(26005)(86362001)(426003)(4326008)(70586007)(356004)(70206006)(49486002)(1076003)(68736007)(54906003)(50466002)(48376002)(53936002)(478600001)(446003)(11346002)(2616005)(76176011)(6916009)(476003)(2876002)(336012)(50226002)(2906002)(81166006)(2870700001)(51416003)(305945005)(47776003)(8676002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1926; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1701574e-a49e-418f-120e-08d7096a7d71
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1926; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1926:
X-Microsoft-Antispam-PRVS: <CY4PR12MB19260507E89A06AE57177A9682CF0@CY4PR12MB1926.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4dQCDVJM4tHCDB9EuA1kzk2NSQTya2zkBVuRz1ML6sQLtAYbV2RygqCidjyi2oqPMpzfnShdEbMrtiMP1N9aeG88O4Drs7klEgSE/4kY0Riv3yFH1zMkXQziVaYyXmn2Y9fw0D7NPtCPT4CoFiiyzZqxDqMvvb4Cj64rFyOuY7xi3ZKuHNj4kGQvgpFzQ7JzcIX1zHKD7CbfZyVzlItmK0PixDEvwxH9XvaM6FVXQJWjZDIP1gzjigCbArX1xq21HvAyWFjxKybl5LHtxgsszvmIVbxpIHXcetsflkI6W7dhwCuUMcyb5Frskkb1UaecOYOC5eYxZdqW/zxQeF0BBHAOS5KE//RTGXBhc+XjxG7l7F4EHQA8gduJj4Y6jUxJexB5f/rnqJ2FxcNV6PQPNTreOW6OFn/dFfTOkuELZAo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:06.9898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1701574e-a49e-418f-120e-08d7096a7d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skMJGY9vknoHVE8wCjC5wnyAzi6gn+c9E3iWCiBdx2s=;
 b=gpbRFjj8tR7R7wpGCZpbIcxto2cku7lsLQbDBmKlFoBCXfPxFAfaXd/zwfZZJUwr8peuXrJ1iTuNyeQtOb06ubScHmJXTupcFdQdLe6iNSYDVFE9Ss5Nmy02JVa6xr8JNyDQi1SuhGm+u8YSpclD6IPhEURBiIcbfEEIoYJzx9o=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
V29ya2Fyb3VuZCBmb3Igbm93IHRvIGF2b2lkIHVuZGVyZmxvdy4KClRoZSB1Y2xrIHN3aXRjaCB0
aW1lIHNob3VsZCByZWFsbHkgYmUgYnVtcGVkIHVwIHRvIDQwNCwgYnV0IGRvaW5nIHNvCndvdWxk
IGV4cG9zZSBwLXN0YXRlIGhhbmcgaXNzdWVzIGZvciBoaWdoZXIgYmFuZHdpZHRoIGRpc3BsYXkK
Y29uZmlndXJhdGlvbnMuCgpDaGFuZ2UtSWQ6IEk5ODA2MGZjOWM0ZWVlY2UwN2VmNTRlMTNhMTQ0
ZGVmODhhM2MzZDIxClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFz
LmthemxhdXNrYXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9w
cF9zbXUuYyAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyAgfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYwppbmRleCA5ODNh
MWJkNTYyNzIuLjc0Njk3Y2VmNWRmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKQEAgLTkxMiwxMSArOTEy
LDExIEBAIHZvaWQgZG1fcHBfZ2V0X2Z1bmNzKAogCQkvKiB0b2RvIHNldF9wbWVfd2FfZW5hYmxl
IGNhdXNlIDRrQDZvaHogZGlzcGxheSBub3QgbGlnaHQgdXAgKi8KIAkJZnVuY3MtPm52X2Z1bmNz
LnNldF9wbWVfd2FfZW5hYmxlID0gTlVMTDsKIAkJLyogdG9kbyBkZWJ1ZyB3YXJpbmcgbWVzc2Fn
ZSAqLwotCQlmdW5jcy0+bnZfZnVuY3Muc2V0X2hhcmRfbWluX3VjbGtfYnlfZnJlcSA9IE5VTEw7
CisJCWZ1bmNzLT5udl9mdW5jcy5zZXRfaGFyZF9taW5fdWNsa19ieV9mcmVxID0gcHBfbnZfc2V0
X2hhcmRfbWluX3VjbGtfYnlfZnJlcTsKIAkJLyogdG9kbyAgY29tcGFyZSBkYXRhIHdpdGggd2lu
ZG93IGRyaXZlciovCi0JCWZ1bmNzLT5udl9mdW5jcy5nZXRfbWF4aW11bV9zdXN0YWluYWJsZV9j
bG9ja3MgPSBOVUxMOworCQlmdW5jcy0+bnZfZnVuY3MuZ2V0X21heGltdW1fc3VzdGFpbmFibGVf
Y2xvY2tzID0gcHBfbnZfZ2V0X21heGltdW1fc3VzdGFpbmFibGVfY2xvY2tzOwogCQkvKnRvZG8g
IGNvbXBhcmUgZGF0YSB3aXRoIHdpbmRvdyBkcml2ZXIgKi8KLQkJZnVuY3MtPm52X2Z1bmNzLmdl
dF91Y2xrX2RwbV9zdGF0ZXMgPSBOVUxMOworCQlmdW5jcy0+bnZfZnVuY3MuZ2V0X3VjbGtfZHBt
X3N0YXRlcyA9IHBwX252X2dldF91Y2xrX2RwbV9zdGF0ZXM7CiAJCWJyZWFrOwogI2VuZGlmCiAJ
ZGVmYXVsdDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKaW5kZXggMmNmNzg4YTM3MDRlLi40NDUzNzY1MWYwYTEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jCkBAIC0yNzA3LDYgKzI3MDcsOSBAQCBzdGF0aWMgdm9pZCBjYXBfc29jX2Nsb2NrcygK
IAkJCQkJCSYmIG1heF9jbG9ja3MudUNsb2NrSW5LaHogIT0gMCkKIAkJCWJiLT5jbG9ja19saW1p
dHNbaV0uZHJhbV9zcGVlZF9tdHMgPSAobWF4X2Nsb2Nrcy51Q2xvY2tJbktoeiAvIDEwMDApICog
MTY7CiAKKwkJLy8gSEFDSzogRm9yY2UgZXZlcnkgdWNsayB0byBtYXggZm9yIG5vdyB0byAiZGlz
YWJsZSIgdWNsayBzd2l0Y2hpbmcuCisJCWJiLT5jbG9ja19saW1pdHNbaV0uZHJhbV9zcGVlZF9t
dHMgPSAobWF4X2Nsb2Nrcy51Q2xvY2tJbktoeiAvIDEwMDApICogMTY7CisKIAkJaWYgKChiYi0+
Y2xvY2tfbGltaXRzW2ldLmZhYnJpY2Nsa19taHogPiAobWF4X2Nsb2Nrcy5mYWJyaWNDbG9ja0lu
S2h6IC8gMTAwMCkpCiAJCQkJCQkmJiBtYXhfY2xvY2tzLmZhYnJpY0Nsb2NrSW5LaHogIT0gMCkK
IAkJCWJiLT5jbG9ja19saW1pdHNbaV0uZmFicmljY2xrX21oeiA9IChtYXhfY2xvY2tzLmZhYnJp
Y0Nsb2NrSW5LaHogLyAxMDAwKTsKQEAgLTI5MjIsNiArMjkyNSw4IEBAIHN0YXRpYyBib29sIGlu
aXRfc29jX2JvdW5kaW5nX2JveChzdHJ1Y3QgZGMgKmRjLAogCQkJCWxlMzJfdG9fY3B1KGJiLT52
bW1fcGFnZV9zaXplX2J5dGVzKTsKIAkJZGNuMl8wX3NvYy5kcmFtX2Nsb2NrX2NoYW5nZV9sYXRl
bmN5X3VzID0KIAkJCQlmaXhlZDE2X3RvX2RvdWJsZV90b19jcHUoYmItPmRyYW1fY2xvY2tfY2hh
bmdlX2xhdGVuY3lfdXMpOworCQkvLyBIQUNLISEgTG93ZXIgdWNsb2NrIGxhdGVuY3kgc3dpdGNo
IHRpbWUgc28gd2UgZG9uJ3Qgc3dpdGNoCisJCWRjbjJfMF9zb2MuZHJhbV9jbG9ja19jaGFuZ2Vf
bGF0ZW5jeV91cyA9IDEwOwogCQlkY24yXzBfc29jLndyaXRlYmFja19kcmFtX2Nsb2NrX2NoYW5n
ZV9sYXRlbmN5X3VzID0KIAkJCQlmaXhlZDE2X3RvX2RvdWJsZV90b19jcHUoYmItPndyaXRlYmFj
a19kcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5X3VzKTsKIAkJZGNuMl8wX3NvYy5yZXR1cm5fYnVz
X3dpZHRoX2J5dGVzID0KQEAgLTI5NjMsNiArMjk2OCw3IEBAIHN0YXRpYyBib29sIGluaXRfc29j
X2JvdW5kaW5nX2JveChzdHJ1Y3QgZGMgKmRjLAogCQlzdHJ1Y3QgcHBfc211X252X2Nsb2NrX3Rh
YmxlIG1heF9jbG9ja3MgPSB7MH07CiAJCXVuc2lnbmVkIGludCB1Y2xrX3N0YXRlc1s4XSA9IHsw
fTsKIAkJdW5zaWduZWQgaW50IG51bV9zdGF0ZXMgPSAwOworCQlpbnQgaTsKIAkJZW51bSBwcF9z
bXVfc3RhdHVzIHN0YXR1czsKIAkJYm9vbCBjbG9ja19saW1pdHNfYXZhaWxhYmxlID0gZmFsc2U7
CiAJCWJvb2wgdWNsa19zdGF0ZXNfYXZhaWxhYmxlID0gZmFsc2U7CkBAIC0yOTg0LDYgKzI5OTAs
MTAgQEAgc3RhdGljIGJvb2wgaW5pdF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsCiAJ
CQljbG9ja19saW1pdHNfYXZhaWxhYmxlID0gKHN0YXR1cyA9PSBQUF9TTVVfUkVTVUxUX09LKTsK
IAkJfQogCisJCS8vIEhBQ0s6IFVzZSB0aGUgbWF4IHVjbGtfc3RhdGVzIHZhbHVlIGZvciBhbGwg
ZWxlbWVudHMuCisJCWZvciAoaSA9IDA7IGkgPCBudW1fc3RhdGVzOyBpKyspCisJCQl1Y2xrX3N0
YXRlc1tpXSA9IHVjbGtfc3RhdGVzW251bV9zdGF0ZXMgLSAxXTsKKwogCQlpZiAoY2xvY2tfbGlt
aXRzX2F2YWlsYWJsZSAmJiB1Y2xrX3N0YXRlc19hdmFpbGFibGUgJiYgbnVtX3N0YXRlcykKIAkJ
CXVwZGF0ZV9ib3VuZGluZ19ib3goZGMsICZkY24yXzBfc29jLCAmbWF4X2Nsb2NrcywgdWNsa19z
dGF0ZXMsIG51bV9zdGF0ZXMpOwogCQllbHNlIGlmIChjbG9ja19saW1pdHNfYXZhaWxhYmxlKQot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
