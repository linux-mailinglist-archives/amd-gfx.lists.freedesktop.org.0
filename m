Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9245B69D9D
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB6189BC0;
	Mon, 15 Jul 2019 21:21:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6AC89BC0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dngapYUS1lIeQht9ghtM97rqx3kfJ3XqeXaOtVgW2CPwDtCeHHzWzQU+E+vUWDWTux2IcoBiGxf7t6UZfVGqR/CoF/0MeztVZLvJn/ctpPpLiJ9p+OrwTzvHTAQs6oXYSNDiLe6WSZtoSAruIo8rHDnC+ySR2HfeW0Uj37TF8rhuEXajoVVcpvA9vnoqb6jS6Y1EPSGTjlxr8zxPQQULU3mc4Kz4cgCIFpLjVyAldemQjGKupaQIvEGxJ10iSIVSAtxMfFvy6/rxH9Zb6guQzf5q7x6fgEQACNi+F5Dd803xFOr84w5CL4gZaBKvocUilap5VvlFQd8nq/MqM8B3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYiAi80qHN5j3vmHNMdOr31FQs+mEq+GjQOmTznDkoU=;
 b=GlQvRUq+6Px+gzTJw73L0DLCYBxsdKWNzJydE02OUvU8Z9Me82uKwq24CgrE3lrRguciV0CUEt/eH4i659qX+n9G2JFlDrea7qAfZb/fO3uy18L3JummAzVPc01Sivom2thDQdIbd5uJCxs5FLrvTMo7+V1Ey4GASZ6kS/h98vjkXH4zKkodCvhUKy5sEeIXecyDqj5YcDY5kIZtkWzCx1KB3vYRPzgw0mx6OV60NYw0II77Jz9eRmrxb4jkWKD0wwfhnnLp9IDvNNuQD5EhLANQqgFg9cJ8ymvfHod88ZQYoR32CQCuv9Tv7fo1saMiQZC+62TpObulUOCvYaHKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by BYAPR12MB3093.namprd12.prod.outlook.com (2603:10b6:a03:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:18 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:17 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:07 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/87] drm/amd/display: Update drm_dsc to reflect native 4.2.0
 DSC spec
Date: Mon, 15 Jul 2019 17:19:33 -0400
Message-ID: <20190715212049.4584-12-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(2980300002)(428003)(189003)(199004)(126002)(6666004)(486006)(356004)(86362001)(49486002)(2906002)(476003)(2616005)(8936002)(316002)(11346002)(47776003)(51416003)(54906003)(446003)(36756003)(336012)(48376002)(50226002)(53936002)(2870700001)(478600001)(426003)(2876002)(70586007)(5660300002)(26005)(50466002)(70206006)(186003)(6916009)(1076003)(2351001)(305945005)(76176011)(68736007)(8676002)(4326008)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3093; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35e2053f-ae74-4490-5435-08d7096a601f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB3093; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3093:
X-Microsoft-Antispam-PRVS: <BYAPR12MB30932099AF17BDC82C64C00882CF0@BYAPR12MB3093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: X/TCU9iDtO3s1ErP1tAsxMVNorWC9RXfScEzAfBDkFKtOCpw66TFeaRC2Tkv737RTjHj4yoQTM0olYqOHwXlGU7niBbOqGWyhAL+8WD04YpfAfyp86FzTi0ZpuKOk4vRUBNZRjo2tW8iF43yn8PYzttCG1vtlwSpTrDoR3o6d/LCorcJpQT2UPlBnj186PWfl5dkNtARlwZtAee7qCKSVH30/IeQiwy7Cszw9lng8F4iYHBKefLUk2oDNneNTnFSbsZ+X31d/FkNFHe0cNK5QZgkJISZNWtvTPZIYE+6ztKJzwOtzRiz/cff5upYjnlH3ATKxTK7tBv9VnzqFl98OXjj+nVI3zgol0GmCuLHh/1bDX5CGVhf9pnBb80vsIiME597xcEjqwTzjY0JPafuP66HtGOErtfRGxh0zuBmZRg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:17.8142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e2053f-ae74-4490-5435-08d7096a601f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYiAi80qHN5j3vmHNMdOr31FQs+mEq+GjQOmTznDkoU=;
 b=QQ5Ty+vM7wph9ok0YMKOgT5vDD/4pIv4/FG6zAHQWMNEWnC0jrC2WIDubcs6PeNALt4SbBAB5KWG5QCkiQpy2omUAEVsdYd6McHZBBUD6LzWJ/nBc8x64AwjGnW+/znuCH6lxzIeL6DsENQwVjBw97rChhNupc+sl0dGBJko4PY=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKW1doeV0KU29tZSBw
YXJ0cyBvZiB0aGUgRFNDIHNwZWMgcmVsYXRpbmcgdG8gNC4yLjAgd2VyZSBub3QgcmVmbGVjdGVk
IGluCmRybV9kc2NfY29tcHV0ZV9yY19wYXJhbWV0ZXJzLCBjYXVzaW5nIHVuZXhwZWN0ZWQgY29u
ZmlnIGZhaWx1cmVzCgpbSG93XQpBZGQgbnNsX2JwZ19vZmZzZXQgYW5kIHJic19taW4gY29tcHV0
YXRpb24KClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IE5pa29sYSBDb3JuaWogPE5pa29sYS5Db3JuaWpAYW1kLmNvbT4KQWNr
ZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RzYy9kcm1fZHNjX2RjLmMgICB8IDczICsrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZHJtX2RzY19kYy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kcm1fZHNjX2RjLmMKaW5kZXggNjcwODk3
NjU3ODBiLi4wNGM2Mjk1ZjI5NmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kc2MvZHJtX2RzY19kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kc2MvZHJtX2RzY19kYy5jCkBAIC0xNSw2ICsxNSw3IEBACiAjZGVmaW5lIEVSQU5HRQkJ
CS0xCiAjZGVmaW5lIERSTV9ERUJVR19LTVMobXNnKQkvKiBub3RoaW5nICovCiAjZGVmaW5lIGNw
dV90b19iZTE2KF9feCkgbGl0dGxlX3RvX2JpZyhfX3gpCisjZGVmaW5lIE1BWCh4LCB5KQkJKCh4
KSA+ICh5KSA/ICh4KSA6ICh5KSkKIAogc3RhdGljIHVuc2lnbmVkIHNob3J0IGxpdHRsZV90b19i
aWcoaW50IGRhdGEpCiB7CkBAIC0yMzIsNiArMjMzLDM4IEBAIHZvaWQgZHJtX2RzY19wcHNfcGF5
bG9hZF9wYWNrKHN0cnVjdCBkcm1fZHNjX3BpY3R1cmVfcGFyYW1ldGVyX3NldCAqcHBzX3BheWxv
YWQsCiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kc2NfcHBzX3BheWxvYWRfcGFjayk7CiAKK3N0YXRp
YyBpbnQgY29tcHV0ZV9vZmZzZXQoc3RydWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZywgaW50
IHBpeGVsc19wZXJfZ3JvdXAsCisJCQkJaW50IGdyb3Vwc19wZXJfbGluZSwgaW50IGdycGNudCkK
K3sKKwlpbnQgb2Zmc2V0ID0gMDsKKwlpbnQgZ3JwY250X2lkID0gRElWX1JPVU5EX1VQKHZkc2Nf
Y2ZnLT5pbml0aWFsX3htaXRfZGVsYXksIHBpeGVsc19wZXJfZ3JvdXApOworCisJaWYgKGdycGNu
dCA8PSBncnBjbnRfaWQpCisJCW9mZnNldCA9IERJVl9ST1VORF9VUChncnBjbnQgKiBwaXhlbHNf
cGVyX2dyb3VwICogdmRzY19jZmctPmJpdHNfcGVyX3BpeGVsLCAxNik7CisJZWxzZQorCQlvZmZz
ZXQgPSBESVZfUk9VTkRfVVAoZ3JwY250X2lkICogcGl4ZWxzX3Blcl9ncm91cCAqIHZkc2NfY2Zn
LT5iaXRzX3Blcl9waXhlbCwgMTYpCisJCQktICgoKGdycGNudCAtIGdycGNudF9pZCkgKiB2ZHNj
X2NmZy0+c2xpY2VfYnBnX29mZnNldCkgPj4gMTEpOworCisJaWYgKGdycGNudCA8PSBncm91cHNf
cGVyX2xpbmUpCisJCW9mZnNldCArPSBncnBjbnQgKiB2ZHNjX2NmZy0+Zmlyc3RfbGluZV9icGdf
b2Zmc2V0OworCWVsc2UKKwkJb2Zmc2V0ICs9IGdyb3Vwc19wZXJfbGluZSAqIHZkc2NfY2ZnLT5m
aXJzdF9saW5lX2JwZ19vZmZzZXQKKwkJCS0gKCgoZ3JwY250IC0gZ3JvdXBzX3Blcl9saW5lKSAq
IHZkc2NfY2ZnLT5uZmxfYnBnX29mZnNldCkgPj4gMTEpOworCisJaWYgKHZkc2NfY2ZnLT5uYXRp
dmVfNDIwKSB7CisJCWlmIChncnBjbnQgPD0gZ3JvdXBzX3Blcl9saW5lKQorCQkJb2Zmc2V0IC09
IChncnBjbnQgKiB2ZHNjX2NmZy0+bnNsX2JwZ19vZmZzZXQpID4+IDExOworCQllbHNlIGlmIChn
cnBjbnQgPD0gMiAqIGdyb3Vwc19wZXJfbGluZSkKKwkJCW9mZnNldCArPSAoZ3JwY250IC0gZ3Jv
dXBzX3Blcl9saW5lKSAqIHZkc2NfY2ZnLT5zZWNvbmRfbGluZV9icGdfb2Zmc2V0CisJCQkJLSAo
KGdyb3Vwc19wZXJfbGluZSAqIHZkc2NfY2ZnLT5uc2xfYnBnX29mZnNldCkgPj4gMTEpOworCQll
bHNlCisJCQlvZmZzZXQgKz0gKGdycGNudCAtIGdyb3Vwc19wZXJfbGluZSkgKiB2ZHNjX2NmZy0+
c2Vjb25kX2xpbmVfYnBnX29mZnNldAorCQkJCS0gKCgoZ3JwY250IC0gZ3JvdXBzX3Blcl9saW5l
KSAqIHZkc2NfY2ZnLT5uc2xfYnBnX29mZnNldCkgPj4gMTEpOworCX0KKworCXJldHVybiBvZmZz
ZXQ7Cit9CisKIC8qKgogICogZHJtX2RzY19jb21wdXRlX3JjX3BhcmFtZXRlcnMoKSAtIFdyaXRl
IHJhdGUgY29udHJvbAogICogcGFyYW1ldGVycyB0byB0aGUgZHNjIGNvbmZpZ3VyYXRpb24gZGVm
aW5lZCBpbgpAQCAtMjUxLDYgKzI4NCw3IEBAIGludCBkcm1fZHNjX2NvbXB1dGVfcmNfcGFyYW1l
dGVycyhzdHJ1Y3QgZHJtX2RzY19jb25maWcgKnZkc2NfY2ZnKQogCXVuc2lnbmVkIGxvbmcgaHJk
X2RlbGF5ID0gMDsKIAl1bnNpZ25lZCBsb25nIGZpbmFsX3NjYWxlID0gMDsKIAl1bnNpZ25lZCBs
b25nIHJic19taW4gPSAwOworCXVuc2lnbmVkIGxvbmcgbWF4X29mZnNldCA9IDA7CiAKIAlpZiAo
dmRzY19jZmctPm5hdGl2ZV80MjAgfHwgdmRzY19jZmctPm5hdGl2ZV80MjIpIHsKIAkJLyogTnVt
YmVyIG9mIGdyb3VwcyB1c2VkIHRvIGNvZGUgZWFjaCBsaW5lIG9mIGEgc2xpY2UgKi8KQEAgLTMy
OSw2ICszNjMsMTcgQEAgaW50IGRybV9kc2NfY29tcHV0ZV9yY19wYXJhbWV0ZXJzKHN0cnVjdCBk
cm1fZHNjX2NvbmZpZyAqdmRzY19jZmcpCiAJCXJldHVybiAtRVJBTkdFOwogCX0KIAorCWlmICh2
ZHNjX2NmZy0+c2xpY2VfaGVpZ2h0ID4gMikKKwkJdmRzY19jZmctPm5zbF9icGdfb2Zmc2V0ID0g
RElWX1JPVU5EX1VQKCh2ZHNjX2NmZy0+c2Vjb25kX2xpbmVfYnBnX29mZnNldCA8PCAxMSksCisJ
CQkJCQkJKHZkc2NfY2ZnLT5zbGljZV9oZWlnaHQgLSAxKSk7CisJZWxzZQorCQl2ZHNjX2NmZy0+
bnNsX2JwZ19vZmZzZXQgPSAwOworCisJaWYgKHZkc2NfY2ZnLT5uc2xfYnBnX29mZnNldCA+IDY1
NTM1KSB7CisJCURSTV9ERUJVR19LTVMoIk5zbEJwZ09mZnNldCBpcyB0b28gbGFyZ2UgZm9yIHRo
aXMgc2xpY2UgaGVpZ2h0XG4iKTsKKwkJcmV0dXJuIC1FUkFOR0U7CisJfQorCiAJLyogTnVtYmVy
IG9mIGdyb3VwcyB1c2VkIHRvIGNvZGUgdGhlIGVudGlyZSBzbGljZSAqLwogCWdyb3Vwc190b3Rh
bCA9IGdyb3Vwc19wZXJfbGluZSAqIHZkc2NfY2ZnLT5zbGljZV9oZWlnaHQ7CiAKQEAgLTM0OCw2
ICszOTMsNyBAQCBpbnQgZHJtX2RzY19jb21wdXRlX3JjX3BhcmFtZXRlcnMoc3RydWN0IGRybV9k
c2NfY29uZmlnICp2ZHNjX2NmZykKIAkJdmRzY19jZmctPnNjYWxlX2luY3JlbWVudF9pbnRlcnZh
bCA9CiAJCQkJKHZkc2NfY2ZnLT5maW5hbF9vZmZzZXQgKiAoMSA8PCAxMSkpIC8KIAkJCQkoKHZk
c2NfY2ZnLT5uZmxfYnBnX29mZnNldCArCisJCQkJdmRzY19jZmctPm5zbF9icGdfb2Zmc2V0ICsK
IAkJCQl2ZHNjX2NmZy0+c2xpY2VfYnBnX29mZnNldCkgKgogCQkJCShmaW5hbF9zY2FsZSAtIDkp
KTsKIAl9IGVsc2UgewpAQCAtMzY4LDEwICs0MTQsMjkgQEAgaW50IGRybV9kc2NfY29tcHV0ZV9y
Y19wYXJhbWV0ZXJzKHN0cnVjdCBkcm1fZHNjX2NvbmZpZyAqdmRzY19jZmcpCiAJICogYml0cy9w
aXhlbCAoYnBwKSByYXRlIHRoYXQgaXMgdXNlZCBieSB0aGUgZW5jb2RlciwKIAkgKiBpbiBzdGVw
cyBvZiAxLzE2IG9mIGEgYml0IHBlciBwaXhlbAogCSAqLwotCXJic19taW4gPSB2ZHNjX2NmZy0+
cmNfbW9kZWxfc2l6ZSAtIHZkc2NfY2ZnLT5pbml0aWFsX29mZnNldCArCi0JCURJVl9ST1VORF9V
UCh2ZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5ICoKLQkJCSAgICAgdmRzY19jZmctPmJpdHNf
cGVyX3BpeGVsLCAxNikgKwotCQlncm91cHNfcGVyX2xpbmUgKiB2ZHNjX2NmZy0+Zmlyc3RfbGlu
ZV9icGdfb2Zmc2V0OworCWlmICh2ZHNjX2NmZy0+ZHNjX3ZlcnNpb25fbWlub3IgPT0gMiAmJiAo
dmRzY19jZmctPm5hdGl2ZV80MjAgfHwgdmRzY19jZmctPm5hdGl2ZV80MjIpKSB7CisKKwkJbWF4
X29mZnNldCA9IGNvbXB1dGVfb2Zmc2V0KHZkc2NfY2ZnLCBEU0NfUkNfUElYRUxTX1BFUl9HUk9V
UCwgZ3JvdXBzX3Blcl9saW5lLAorCQkJCQlESVZfUk9VTkRfVVAodmRzY19jZmctPmluaXRpYWxf
eG1pdF9kZWxheSwKKwkJCQkJCURTQ19SQ19QSVhFTFNfUEVSX0dST1VQKSk7CisKKwkJbWF4X29m
ZnNldCA9IE1BWChtYXhfb2Zmc2V0LAorCQkJCWNvbXB1dGVfb2Zmc2V0KHZkc2NfY2ZnLCBEU0Nf
UkNfUElYRUxTX1BFUl9HUk9VUCwgZ3JvdXBzX3Blcl9saW5lLAorCQkJCQlESVZfUk9VTkRfVVAo
dmRzY19jZmctPmluaXRpYWxfeG1pdF9kZWxheSwKKwkJCQkJCWdyb3Vwc19wZXJfbGluZSkpKTsK
KworCQltYXhfb2Zmc2V0ID0gTUFYKG1heF9vZmZzZXQsCisJCQkJY29tcHV0ZV9vZmZzZXQodmRz
Y19jZmcsIERTQ19SQ19QSVhFTFNfUEVSX0dST1VQLCBncm91cHNfcGVyX2xpbmUsCisJCQkJCURJ
Vl9ST1VORF9VUCh2ZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5LAorCQkJCQkJZ3JvdXBzX3Bl
cl9saW5lICogMikpKTsKKworCQlyYnNfbWluID0gdmRzY19jZmctPnJjX21vZGVsX3NpemUgLSB2
ZHNjX2NmZy0+aW5pdGlhbF9vZmZzZXQgKyBtYXhfb2Zmc2V0OworCX0gZWxzZSB7CisJCXJic19t
aW4gPSB2ZHNjX2NmZy0+cmNfbW9kZWxfc2l6ZSAtIHZkc2NfY2ZnLT5pbml0aWFsX29mZnNldCAr
CisJCQlESVZfUk9VTkRfVVAodmRzY19jZmctPmluaXRpYWxfeG1pdF9kZWxheSAqCisJCQkJICAg
ICB2ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwsIDE2KSArCisJCQlncm91cHNfcGVyX2xpbmUgKiB2
ZHNjX2NmZy0+Zmlyc3RfbGluZV9icGdfb2Zmc2V0OworCX0KIAogCWhyZF9kZWxheSA9IERJVl9S
T1VORF9VUCgocmJzX21pbiAqIDE2KSwgdmRzY19jZmctPmJpdHNfcGVyX3BpeGVsKTsKIAl2ZHNj
X2NmZy0+cmNfYml0cyA9IChocmRfZGVsYXkgKiB2ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwpIC8g
MTY7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
