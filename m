Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2154A0C0B
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D0889F35;
	Wed, 28 Aug 2019 21:04:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6EF89F19
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEuuWMX6aC+ne8AquhI57b9S0T4jfDdXwgFx36IRdNN6617QtySLCusCScZoDZSasz7YJgcJvAsnBl+hRYyb380P29f3uWTML0HZEanL5Z5YyeBiYXvaC7WcBkq6N/WTajwyOqIMvsmT1YQUBcUywLYZ0ik9KZ+aiSLsEko4Sw2e+4iBkzJYsC5YA8F3HOCxnB0gnRjwNHkmGaSW1sivvQpRBy8M9WgA9TxTIUGGoVHREK5AiFF1NpRET7L+pzMU++MF8gCNlZwNOU/Uf7374zEaNzJH6AvBjeWBj9/BcFGh4WhKcMiqIyRzrUBDPNlFaICGOuDmZpgViD5MvQLduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0woUFPFLuvHzabgm4Dm8JWW/m3PjDsm5S8z3+faP04=;
 b=UmiVeIV60IlSoXxdPhUHQNMpl80szk4hSk3CA3EieMIgh/4wjq3xddOOt5XnDy64h9bKNvzFC/l8BfLKyKqJoHp+0LcV9Ms1VpPrnoTH3SEnUoMaiBfTh5cGrFyFP3q9bTQRFOs94M7IoUAQ84QtxrEPzbbQLZ4e2n6fQ1ZjxjLsA2OhvFkUkew3DVmPHcvix3uU8wGoGztLw43rvWRp1EEHp8zq1/mEnZQdgH7AR5fc3zPaqpNHRCQKxmTf7B2HsdwG2d1+V0Cj6Bl1Q4ZD4Ym4ecLnC1WW+BH5ciCoOE6MUbyvUAt6GwYID2w89eKStyTM0Fz8Nie6NnuHE7qcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:70::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Wed, 28 Aug 2019 21:04:09 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:09 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:03 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/17] drm/amd/display: config to override DSC start slice
 height
Date: Wed, 28 Aug 2019 17:03:43 -0400
Message-ID: <20190828210354.21464-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(6666004)(356004)(86362001)(47776003)(36756003)(2351001)(70586007)(53936002)(70206006)(1076003)(53416004)(316002)(186003)(81156014)(2616005)(478600001)(8676002)(336012)(6916009)(486006)(476003)(126002)(8936002)(11346002)(446003)(426003)(305945005)(51416003)(7696005)(26005)(76176011)(4326008)(16586007)(81166006)(2906002)(48376002)(50226002)(5660300002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 873644e3-616d-4482-5ed6-08d72bfb454f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27193F03FF8098F814DE2104F9A30@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dWxaL2iSNQ0kRhWJRkkrEMcI4gA/2/NrfLBi17+k6CZHtS5BeN5tSb8rKM1UNFLkoY1yvXDvXrDcMuwgHhaGeZ17mGcc5TUVAPiNYcFdExQUo2S5O47VmcrO8IgC5Szlo1OAYD3phoQgqYJr1vjTM6O4mQhlhU5pYRUaUcKYU0VgPwHiAo3ioN72yE55y9Su5aAW3UnDfq7fR/ZmvjRJ7eF6e6+9wiikOxNLgh5YJ7luHYE3tmk51wzSZ0I2RZjUeVuwlT79T5y2xM5yL/y3jdeOIDKOojFb6pyIsrQSjLTnwVHw/XWvkUzvDfiD92nSnhGCEw/r4+E+i4/CIqVxJaXeTB9Q2JgfeynZzJ8SiLOha3w6jn4wqC/7zkPz3obSgJZfryx0nydMw7aLxktZtl9Q8NgSLvfoP+xgSLirb/s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:09.4028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 873644e3-616d-4482-5ed6-08d72bfb454f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0woUFPFLuvHzabgm4Dm8JWW/m3PjDsm5S8z3+faP04=;
 b=SoDcXDXHBw8AoSH0J/ah1S2xu1XPO1c1tV8liVinAauSsTSECLGUseHqAJx0tqOKlY4aI6Etaz78PkQ/1jV/C8xb48EvH7yncSr8DjNiNYKQ9tLUmkWI/5QOz6feDQNfeovrSRUJDb5vZnST4GXkIYIG5v8QIpLCF9cdOloh0MY=
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
Cc: Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KSXQncyBz
b21ldGltZXMgdXNlZnVsIHRvIGhhdmUgdGhpcyBvcHRpb24gd2hlbiBkZWJ1Z2dpbmcKCltob3dd
CkFkZCBhIGNvbmZpZyBmbGFnLiBJZiB0aGUgZmxhZyBpcyBub3Qgc2V0LCB1c2UgZHJpdmVyIGRl
ZmF1bHQgcG9saWN5LgpJZiB0aGUgZmxhZyBpcyBzZXQsIHVzZSB0aGUgdmFsdWUgZnJvbSB0aGUg
ZmxhZyBhcyB0aGUgc3RhcnRpbmcgRFNDIHNsaWNlCmhlaWdodC4KClNpZ25lZC1vZmYtYnk6IE5p
a29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBM
ZXVuZyA8TWFydGluLkxldW5nQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8
Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGMuaCAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RzYy9kY19kc2MuYyB8IDE0ICsrKysrKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5o
CmluZGV4IDQyYjZhNmU0MWMwYi4uM2QzMmU5MDE0ZjE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGMuaApAQCAtMzQ3LDYgKzM0Nyw3IEBAIHN0cnVjdCBkY19kZWJ1Z19vcHRpb25zIHsK
IAlib29sIGRpc2FibGVfaHVicF9wb3dlcl9nYXRlOwogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RD
X0RTQ19TVVBQT1JUCiAJYm9vbCBkaXNhYmxlX2RzY19wb3dlcl9nYXRlOworCWludCBkc2NfbWlu
X3NsaWNlX2hlaWdodF9vdmVycmlkZTsKICNlbmRpZgogCWJvb2wgZGlzYWJsZV9wcGxpYl93bV9y
YW5nZTsKIAllbnVtIHdtX3JlcG9ydF9tb2RlIHBwbGliX3dtX3JlcG9ydF9tb2RlOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNjLmMKaW5kZXggNTk5NWJjZGZlZDU0
Li45MjllYmQ0Y2ZiOGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kc2MvZGNfZHNjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9k
Y19kc2MuYwpAQCAtNTEyLDYgKzUxMiw3IEBAIHN0YXRpYyBib29sIHNldHVwX2RzY19jb25maWco
CiAJCWNvbnN0IHN0cnVjdCBkc2NfZW5jX2NhcHMgKmRzY19lbmNfY2FwcywKIAkJaW50IHRhcmdl
dF9iYW5kd2lkdGhfa2JwcywKIAkJY29uc3Qgc3RydWN0IGRjX2NydGNfdGltaW5nICp0aW1pbmcs
CisJCWludCBtaW5fc2xpY2VfaGVpZ2h0X292ZXJyaWRlLAogCQlzdHJ1Y3QgZGNfZHNjX2NvbmZp
ZyAqZHNjX2NmZykKIHsKIAlzdHJ1Y3QgZHNjX2VuY19jYXBzIGRzY19jb21tb25fY2FwczsKQEAg
LTY4MCw3ICs2ODEsMTAgQEAgc3RhdGljIGJvb2wgc2V0dXBfZHNjX2NvbmZpZygKIAogCS8vIFNs
aWNlIGhlaWdodCAoaS5lLiBudW1iZXIgb2Ygc2xpY2VzIHBlciBjb2x1bW4pOiBzdGFydCB3aXRo
IHBvbGljeSBhbmQgcGljayB0aGUgZmlyc3Qgb25lIHRoYXQgaGVpZ2h0IGlzIGRpdmlzaWJsZSBi
eS4KIAkvLyBGb3IgNDoyOjAgbWFrZSBzdXJlIHRoZSBzbGljZSBoZWlnaHQgaXMgZGl2aXNpYmxl
IGJ5IDIgYXMgd2VsbC4KLQlzbGljZV9oZWlnaHQgPSBtaW4oZHNjX3BvbGljeS5taW5fc2ljZV9o
ZWlnaHQsIHBpY19oZWlnaHQpOworCWlmIChtaW5fc2xpY2VfaGVpZ2h0X292ZXJyaWRlID09IDAp
CisJCXNsaWNlX2hlaWdodCA9IG1pbihkc2NfcG9saWN5Lm1pbl9zaWNlX2hlaWdodCwgcGljX2hl
aWdodCk7CisJZWxzZQorCQlzbGljZV9oZWlnaHQgPSBtaW4obWluX3NsaWNlX2hlaWdodF9vdmVy
cmlkZSwgcGljX2hlaWdodCk7CiAKIAl3aGlsZSAoc2xpY2VfaGVpZ2h0IDwgcGljX2hlaWdodCAm
JiAocGljX2hlaWdodCAlIHNsaWNlX2hlaWdodCAhPSAwIHx8CiAJCSh0aW1pbmctPnBpeGVsX2Vu
Y29kaW5nID09IFBJWEVMX0VOQ09ESU5HX1lDQkNSNDIwICYmIHNsaWNlX2hlaWdodCAlIDIgIT0g
MCkpKQpAQCAtODIwLDEwICs4MjQsOCBAQCBib29sIGRjX2RzY19jb21wdXRlX2JhbmR3aWR0aF9y
YW5nZSgKIAkJCXRpbWluZy0+cGl4ZWxfZW5jb2RpbmcsICZkc2NfY29tbW9uX2NhcHMpOwogCiAJ
aWYgKGlzX2RzY19wb3NzaWJsZSkKLQkJaXNfZHNjX3Bvc3NpYmxlID0gc2V0dXBfZHNjX2NvbmZp
Zyhkc2Nfc2lua19jYXBzLAotCQkJCSZkc2NfZW5jX2NhcHMsCi0JCQkJMCwKLQkJCQl0aW1pbmcs
ICZjb25maWcpOworCQlpc19kc2NfcG9zc2libGUgPSBzZXR1cF9kc2NfY29uZmlnKGRzY19zaW5r
X2NhcHMsICZkc2NfZW5jX2NhcHMsIDAsIHRpbWluZywKKwkJCQkJZGMtPmRlYnVnLmRzY19taW5f
c2xpY2VfaGVpZ2h0X292ZXJyaWRlLCAmY29uZmlnKTsKIAogCWlmIChpc19kc2NfcG9zc2libGUp
CiAJCWdldF9kc2NfYmFuZHdpZHRoX3JhbmdlKG1pbl9icHAsIG1heF9icHAsICZkc2NfY29tbW9u
X2NhcHMsIHRpbWluZywgcmFuZ2UpOwpAQCAtODQ1LDcgKzg0Nyw3IEBAIGJvb2wgZGNfZHNjX2Nv
bXB1dGVfY29uZmlnKAogCWlzX2RzY19wb3NzaWJsZSA9IHNldHVwX2RzY19jb25maWcoZHNjX3Np
bmtfY2FwcywKIAkJCSZkc2NfZW5jX2NhcHMsCiAJCQl0YXJnZXRfYmFuZHdpZHRoX2ticHMsCi0J
CQl0aW1pbmcsIGRzY19jZmcpOworCQkJdGltaW5nLCBkYy0+ZGVidWcuZHNjX21pbl9zbGljZV9o
ZWlnaHRfb3ZlcnJpZGUsIGRzY19jZmcpOwogCXJldHVybiBpc19kc2NfcG9zc2libGU7CiB9CiAj
ZW5kaWYgLyogQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQgKi8KLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
