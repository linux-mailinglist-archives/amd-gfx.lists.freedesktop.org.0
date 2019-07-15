Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89469DE3
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C9189D6C;
	Mon, 15 Jul 2019 21:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C67E89CF8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:57 +0000 (UTC)
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by CH2PR12MB3927.namprd12.prod.outlook.com (2603:10b6:610:2d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Mon, 15 Jul
 2019 21:21:56 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:55 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:36 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 67/87] drm/amd/display: use min disp and dpp clk debug option
 for dcn2
Date: Mon, 15 Jul 2019 17:20:29 -0400
Message-ID: <20190715212049.4584-68-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(54906003)(2870700001)(316002)(68736007)(1076003)(6666004)(356004)(86362001)(4326008)(49486002)(48376002)(478600001)(5660300002)(36756003)(50466002)(26005)(6916009)(70586007)(51416003)(14444005)(186003)(2616005)(126002)(8936002)(486006)(81166006)(11346002)(81156014)(2906002)(426003)(8676002)(76176011)(446003)(476003)(50226002)(336012)(2351001)(47776003)(2876002)(305945005)(53936002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3927; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e131c60-55d3-4e7f-15a5-08d7096a76e1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3927; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3927:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3927DC32303495FD365581C782CF0@CH2PR12MB3927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pRSliVe7PEWO4PUI33JmS1tDZNo7lT7d0bVtMAE5GMiQ8+SiNooJA6BOMrnt8xXb/d5BlOKQ+03cMlhD+htnkzzO8mcHQCpmzfuFN0LCednD+NfwGyV/I/UjREZIuG6tF1qKOQ+1jJHwYtxD27wiSiB872Lj3PqQoJKSRUSUYAV69SRj4ZuI0x5mLJQUBz15YAvba1K7hSGRNZ8SbBBh5fcVddfhgxUlZJjCVkiSkyOLpvhSayybnjKmPzS/cVxrQ5fBF5uoM9tIQrchFNVtF/kz6ry9r0LUSgiKm+r/8efBrKKM4g4nb2GHtA7DJSfWWxM3dR4sZI/ZwyX11BmGJa/mEOlgeoUTrQEPSBSjVKnUkdvWLJVfaCbcp+BnoTihz7gDKxwV8wvcExHM1hUwvC3Bbwt1wD1nI+/FwKVdK1g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:55.9818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e131c60-55d3-4e7f-15a5-08d7096a76e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8yR+R4yIsRz9kCdGYo8rZs7Pcjnv6GhXq+uUkN1e8c=;
 b=zW03jdJhSQd28q7V0NCowFyFU7Rd7Y31HHD8S0jjlde/KMGTIudfx93hlpelHt91ojIblm3I40QHhQ9s3YDu8bIQN7VMkbdMC5j9onpd4ZQ+dbZC9Joj9gR+3EIW3xgGDCioStwGuP0a6vOVKQ7dzHgeAC64eape+RWR8yJAokA=
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
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClRo
aXMgYWxsb3dzIHRvIHNldCBhIG1pbmltdW0gZGlzcGxheSBhbmQgZHBwIGNsb2NrIG9uIGRjbjIr
IEhXCmJ5IGFkanVzdGluZyBjbG9ja3MgdXNlZCBmb3IgZG1sIGNhbGN1bGF0aW9ucy4KClNpZ25l
ZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGMuaCAgICAgICAgICAgICAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCA4ICsrKystLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kYy5oCmluZGV4IDU4NGZhYmY1YTlhMS4uNDg5ZjYyNDBmMmVkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzQ0LDYgKzM0NCw3IEBAIHN0cnVjdCBkY19kZWJ1
Z19vcHRpb25zIHsKIAlib29sIGRpc2FibGVfcHBsaWJfd21fcmFuZ2U7CiAJZW51bSB3bV9yZXBv
cnRfbW9kZSBwcGxpYl93bV9yZXBvcnRfbW9kZTsKIAl1bnNpZ25lZCBpbnQgbWluX2Rpc3BfY2xr
X2toejsKKwl1bnNpZ25lZCBpbnQgbWluX2RwcF9jbGtfa2h6OwogCWludCBzcl9leGl0X3RpbWVf
ZHBtMF9uczsKIAlpbnQgc3JfZW50ZXJfcGx1c19leGl0X3RpbWVfZHBtMF9uczsKIAlpbnQgc3Jf
ZXhpdF90aW1lX25zOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCAxNTg3NDNiMTY1ZTguLjU1NzFiOGJmYzk0MiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMKQEAgLTIxNjgsMTAgKzIxNjgsNiBAQCBib29sIGRjbjIwX2Zhc3RfdmFsaWRh
dGVfYncoCiAJCX0KIAkJaWYgKGZvcmNlX3NwbGl0ICYmIGNvbnRleHQtPmJ3X2N0eC5kbWwudmJh
Lk5vT2ZEUFBbdmxldmVsXVtjb250ZXh0LT5id19jdHguZG1sLnZiYS5tYXhNcGNDb21iXVtwaXBl
X2lkeF0gPT0gMSkKIAkJCWNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLlJlcXVpcmVkRFBQQ0xLW3Zs
ZXZlbF1bY29udGV4dC0+YndfY3R4LmRtbC52YmEubWF4TXBjQ29tYl1bcGlwZV9pZHhdIC89IDI7
Ci0JCWlmIChkYy0+Y29uZmlnLmZvcmNlZF9jbG9ja3MgPT0gdHJ1ZSkgewotCQkJY29udGV4dC0+
YndfY3R4LmRtbC52YmEuUmVxdWlyZWREUFBDTEtbdmxldmVsXVtjb250ZXh0LT5id19jdHguZG1s
LnZiYS5tYXhNcGNDb21iXVtwaXBlX2lkeF0gPQotCQkJCQljb250ZXh0LT5id19jdHguZG1sLnNv
Yy5jbG9ja19saW1pdHNbMF0uZHBwY2xrX21oejsKLQkJfQogCQlpZiAoIXBpcGUtPnRvcF9waXBl
ICYmICFwaXBlLT5wbGFuZV9zdGF0ZSAmJiBjb250ZXh0LT5id19jdHguZG1sLnZiYS5PRE1Db21i
aW5lRW5hYmxlZFtwaXBlX2lkeF0pIHsKIAkJCWhzcGxpdF9waXBlID0gZmluZF9pZGxlX3NlY29u
ZGFyeV9waXBlKCZjb250ZXh0LT5yZXNfY3R4LCBkYy0+cmVzX3Bvb2wsIHBpcGUpOwogCQkJQVNT
RVJUKGhzcGxpdF9waXBlKTsKQEAgLTIyOTEsNiArMjI4NywxMCBAQCB2b2lkIGRjbjIwX2NhbGN1
bGF0ZV93bSgKIAkJCQlwaXBlc1twaXBlX2NudF0uY2xrc19jZmcuZGlzcGNsa19taHogPSBjb250
ZXh0LT5id19jdHguZG1sLnNvYy5jbG9ja19saW1pdHNbMF0uZGlzcGNsa19taHo7CiAJCQkJcGlw
ZXNbcGlwZV9jbnRdLmNsa3NfY2ZnLmRwcGNsa19taHogPSBjb250ZXh0LT5id19jdHguZG1sLnNv
Yy5jbG9ja19saW1pdHNbMF0uZHBwY2xrX21oejsKIAkJCX0KKwkJCWlmIChkYy0+ZGVidWcubWlu
X2Rpc3BfY2xrX2toeiA+IHBpcGVzW3BpcGVfY250XS5jbGtzX2NmZy5kaXNwY2xrX21oeiAqIDEw
MDApCisJCQkJcGlwZXNbcGlwZV9jbnRdLmNsa3NfY2ZnLmRpc3BjbGtfbWh6ID0gZGMtPmRlYnVn
Lm1pbl9kaXNwX2Nsa19raHogLyAxMDAwLjA7CisJCQlpZiAoZGMtPmRlYnVnLm1pbl9kcHBfY2xr
X2toeiA+IHBpcGVzW3BpcGVfY250XS5jbGtzX2NmZy5kcHBjbGtfbWh6ICogMTAwMCkKKwkJCQlw
aXBlc1twaXBlX2NudF0uY2xrc19jZmcuZHBwY2xrX21oeiA9IGRjLT5kZWJ1Zy5taW5fZHBwX2Ns
a19raHogLyAxMDAwLjA7CiAKIAkJCXBpcGVfY250Kys7CiAJCX0KLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
