Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694EC10171
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC15B89219;
	Tue, 30 Apr 2019 21:09:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34476891FF
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:46 +0000 (UTC)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by DM5PR12MB2374.namprd12.prod.outlook.com (2603:10b6:4:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 21:09:44 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:43 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:42 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/20] DC Patches 30 Apr 2019
Date: Tue, 30 Apr 2019 17:08:58 -0400
Message-ID: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(50226002)(77096007)(16586007)(50466002)(186003)(2351001)(48376002)(68736007)(36756003)(126002)(305945005)(53416004)(2906002)(316002)(47776003)(6916009)(486006)(476003)(8936002)(2616005)(14444005)(4326008)(81166006)(7696005)(26005)(81156014)(51416003)(8676002)(86362001)(336012)(53936002)(70586007)(72206003)(1076003)(426003)(478600001)(5660300002)(356004)(6666004)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2374; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e395485d-98ce-47f2-cd20-08d6cdb02af3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB2374; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2374:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2374C03C234DE1179FEF09B4F93A0@DM5PR12MB2374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FGOwOCpiXQMqLO9fF5s6MxhoYq6SyMFn3CZydbZBUtpAwoamg4Cfl19V+zC8KlKVwqHgky7oJBd54qfbIXVQjSIpTy5ZJhvZYDetd1eOwRAvnxVwCScO4rfimFvTIbzD51SKxSnlcTdtgq+uG5NsQHqET67YaRX402Vvvva7/SLp1Z+qDrF+rTwSvEjm87ukFz0S3Oh5DouhEMB8S6Lr8PX83k/OYj2wM/uSUyAR9pEgcZF+7bkW/Y0yer3+Dvn6/vwdjAIVrBEM9dV518+V4RhBaPrScjXXJT2S5A2mOOcG/uPXw4jhSghb2kJ+wmIZ/rfv+ZWpYKoYZJpcfZJ1ONA4f7diNu7JVSm2gAU++Bf8x1LQUXTTafqIXP2JmFCCOBEIH5PSxFkWwtm49izi82A/HSRFpu4B0yOhBFVBgp8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:43.6129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e395485d-98ce-47f2-cd20-08d6cdb02af3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2374
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcFC4xvS5JSTRU7Gb/o/oSJld1vuwuippjPlMgBJgyo=;
 b=DCECwzXYHOrQy0VAHlKsQMjZJ1yFPQ18FfCIZU6ydfrcPHAG6d72KrFBZMyn3ynlY7x6/NFCO4JtusN+p0EQZCSbRbGwwhmkACAZuoKS+TgkF+Z3FMkTdgquWc+VN+1A/iS6V11NBKipGrNyy53wSvVIirzcmBO3blXmZRXP/90=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3VtbWFyeSBvZiBDaGFuZ2VzCipDdXJzb3IgZml4ZXMKKlNldCBjbG9ja3Mgc3BsaXQgcmVmYWN0
b3IKKlJlZmFjdG9yIHdhdGVybWFyayBwcm9ncmFtaW5nCgpBbnRob255IEtvbyAoMSk6CiAgZHJt
L2FtZC9kaXNwbGF5OiBmaXggbXVsdGkgZGlzcGxheSBzZWFtbGVzcyBib290IGNhc2UKCkFyaWMg
Q3lyICgyKToKICBkcm0vYW1kL2Rpc3BsYXk6IDMuMi4yOAogIGRybS9hbWQvZGlzcGxheTogMy4y
LjI5CgpDaGFybGVuZSBMaXUgKDMpOgogIGRybS9hbWQvZGlzcGxheTogYWRkIFNXX1VTRV9JMkNf
UkVHIHJlcXVlc3QuCiAgZHJtL2FtZC9kaXNwbGF5OiBjb2xvciBzcGFjZSB5Y2JjcjcwOSBzdXBw
b3J0CiAgZHJtL2FtZC9kaXNwbGF5OiByZXNldCByZXRpbWVyL3JlZHJpdmVyIGJlbG93IDM0ME1o
egoKQ2hyaXMgUGFyayAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBTdXBwb3J0IEFWSSBJbmZvRnJh
bWUgVjMgYW5kIFY0CiAgZHJtL2FtZC9kaXNwbGF5OiBEZWZpbmUgQnl0ZSAxNCBvbiBBVkkgSW5m
b0ZyYW1lCgpEbXl0cm8gTGFrdHl1c2hraW4gKDMpOgogIGRybS9hbWQvZGlzcGxheTogbW92ZSBz
aWduYWwgdHlwZSBvdXQgb2Ygb3RnIGRsZyBwYXJhbXMKICBkcm0vYW1kL2Rpc3BsYXk6IHN0b3Ag
ZXh0ZXJuYWwgYWNjZXNzIHRvIGludGVybmFsIG9wdGMgc3luYyBwYXJhbXMKICBkcm0vYW1kL2Rp
c3BsYXk6IGZpeCBhY3F1aXJlX2ZpcnN0X3NwbGl0X3BpcGUgZnVuY3Rpb24KCkVyaWMgWWFuZyAo
Mik6CiAgZHJtL2FtZC9kaXNwbGF5OiBTZXQgZGlzcGNsayBhbmQgZHByZWZjbG9jayBkaXJlY3Rs
eQogIGRybS9hbWQvZGlzcGxheTogbW92ZSBiYWNrIHZiaW9zIGNtZCB0YWJsZSBmb3Igc2V0IGRw
cmVmY2xrCgpKdW4gTGVpICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBzdXBwb3J0IGZvciBk
aXNjb25uZWN0ZWQgZURQIHBhbmVscwoKTGVvIChIYW5naG9uZykgTWEgKDEpOgogIGRybS9hbWQv
ZGlzcGxheTogRXhwb3NlIHNlbmQgaW1tZWRpYXRlIHNkcCBtZXNzYWdlIGludGVyZmFjZQoKTmlj
aG9sYXMgS2F6bGF1c2thcyAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBGaWxsIHByZXNjYWxlX3Bh
cmFtcy0+c2NhbGUgZm9yIFJHQjU2NQogIGRybS9hbWQvZGlzcGxheTogRGlzYWJsZSBjdXJzb3Ig
d2hlbiBvZmZzY3JlZW4gaW4gbmVnYXRpdmUgZGlyZWN0aW9uCgpSb21hbiBMaSAoMSk6CiAgZHJt
L2FtZC9kaXNwbGF5OiBGaWxsIHBsYW5lIGF0dHJzIG9ubHkgZm9yIHZhbGlkIHB4bCBmb3JtYXQK
ClNhbXNvbiBUYW0gKDEpOgogIGRybS9hbWQvZGlzcGxheTogYmxvY2sgcGFzc2l2ZSBkb25nbGUg
RURJRCBFbXVsYXRpb24gZm9yIFVTQi1DIHBvcnRzCgpZb25ncWlhbmcgU3VuICgxKToKICBkcm0v
YW1kL2Rpc3BsYXk6IFJlZmFjdG9yIHByb2dyYW0gd2F0ZXJtYXJrLgoKIC4uLi9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAxNiArLQogLi4uL2RybS9hbWQvZGlz
cGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAgICB8ICAyNSArLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2h3X3NlcXVlbmNlci5jIHwgIDI5ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAgMjggKy0KIC4uLi9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyB8ICA3OSArKy0tCiAuLi4vZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jICAgfCAgNTEgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY19oZWxwZXIuYyAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjX2h3X3R5cGVzLmggIHwgICAxICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfY2xrX21nci5jICB8ICA3OCArKystCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2Nsa19tZ3IuaCAgfCAgMjMgKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9pMmNfaHcuYyAgIHwgICA3ICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2kyY19ody5oICAgfCAgIDMgKwogLi4uL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
c3RyZWFtX2VuY29kZXIuYyAgIHwgICAxICsKIC4uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBf
aHdfc2VxdWVuY2VyLmMgICB8ICAgOCArCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTEx
MF9yZXNvdXJjZS5jICAgfCAgIDUgKwogLi4uL2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dlbmVy
YXRvci5jICAgICAgIHwgICA1ICsKIC4uLi9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0
b3IuaCAgICAgICB8ICAgNSArCiAuLi4vZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9y
X3YuYyAgICAgfCAgIDUgKwogLi4uL2RjL2RjZTEyMC9kY2UxMjBfdGltaW5nX2dlbmVyYXRvci5j
ICAgICAgIHwgICA3ICstCiAuLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4MF90aW1pbmdfZ2VuZXJh
dG9yLmMgfCAgIDcgKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY2xrX21n
ci5jICB8ICA3OCArKystCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YmJ1
Yi5jICAgfCA0MjggKysrKysrKysrLS0tLS0tLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjEwL2RjbjEwX2h1YmJ1Yi5oICAgfCAgMTYgKwogLi4uL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX2h3X3NlcXVlbmNlci5jIHwgIDM5ICstCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfbGlua19lbmNvZGVyLmMgfCAgIDIgKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfb3B0Yy5jIHwgIDQ3ICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9vcHRjLmggfCAgMTcgKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfcmVzb3VyY2UuYyB8ICAzNyArLQogLi4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfc3RyZWFt
X2VuY29kZXIuYyAgIHwgMTA3ICsrKystCiAuLi4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJl
YW1fZW5jb2Rlci5oICAgfCAgMjIgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rt
X3BwX3NtdS5oICAgIHwgICAyICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcv
Y2xrX21nci5oICAgfCAgIDggKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2xpbmtf
ZW5jb2Rlci5oICB8ICAgMSArCiAuLi4vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L3N0cmVhbV9lbmNv
ZGVyLmggICAgfCAgIDcgKy0KIC4uLi9hbWQvZGlzcGxheS9kYy9pbmMvaHcvdGltaW5nX2dlbmVy
YXRvci5oICB8ICAyMyArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3X3NlcXVl
bmNlci5oIHwgICA1ICsKIC4uLi9hbWQvZGlzcGxheS9pbmNsdWRlL2Jpb3NfcGFyc2VyX3R5cGVz
LmggICB8ICAgMyArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kYWxfYXNpY19p
ZC5oIHwgICAzICstCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvc2V0X21vZGVfdHlwZXMu
aCAgfCAgIDUgKy0KIDQxIGZpbGVzIGNoYW5nZWQsIDg2MiBpbnNlcnRpb25zKCspLCAzNzggZGVs
ZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
