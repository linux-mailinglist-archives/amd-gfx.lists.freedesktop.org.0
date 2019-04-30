Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE110189
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753858929B;
	Tue, 30 Apr 2019 21:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6250789240
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:02 +0000 (UTC)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by BY2PR12MB0647.namprd12.prod.outlook.com (2a01:111:e400:52e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Tue, 30 Apr
 2019 21:10:00 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:00 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:50 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/20] drm/amd/display: If one stream full updates,
 full update all planes
Date: Tue, 30 Apr 2019 17:09:18 -0400
Message-ID: <20190430210938.32335-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(48376002)(8936002)(53416004)(50466002)(72206003)(53936002)(478600001)(70586007)(476003)(1076003)(2616005)(11346002)(486006)(86362001)(47776003)(6666004)(126002)(446003)(81156014)(81166006)(8676002)(5024004)(14444005)(356004)(2351001)(50226002)(68736007)(26005)(305945005)(336012)(15650500001)(186003)(426003)(70206006)(77096007)(4326008)(54906003)(16586007)(6916009)(36756003)(76176011)(51416003)(2906002)(316002)(5660300002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR12MB0647; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 830ab706-94e5-4970-cdd2-08d6cdb034b9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BY2PR12MB0647; 
X-MS-TrafficTypeDiagnostic: BY2PR12MB0647:
X-Microsoft-Antispam-PRVS: <BY2PR12MB0647855F3F71658DF7B2FC55F93A0@BY2PR12MB0647.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mrykbOf2ZI5odlMZrAcrX9aLevnV0SRJcK+JlzhfjO1Asj2UaEhiBin/f/EneiqWOvJdnLdhGnmN0X2SeWnPPvnG8Ta2d4GMWzwO9nTv58tvkHgETYnXSSSBQ8adLnTgv0E90bDgjanRv83aShwL4wFn0ucWczy5vEwHbAIj4M41p4aHNhzXiM1tfth+vjOqeL3hQTbOQwADa8oB1nxmg7A1eFY9v77rPEp7051oRNkzU4Iy5fHQZ4r/qakteXfGQzvakPmmLF/rAkD5hTLoyFB/otonroQbP6n183PYUekQGEJhL+x/XkRzYsoB1F+gQYg7VFuwYrDYbh5DFWJznlZfnaq5nipW4iYIwBHMwKCo3o7UTrQqH7S9xPVwD695m353fDx6J583LuvDWlRbYpidOEbgOMyQRoZsPHHd3Oc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:00.0092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830ab706-94e5-4970-cdd2-08d6cdb034b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR12MB0647
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/Z0k8Ru+ESnnF5KcxkhrMUB2HFh9cnCSSSsvOYISiY=;
 b=FbMxnoePb/iWYKfeEgZMVZabeT46Ld4eaNgb0Y5sTHrjNe2P8KAMRLrXOxW2nJdp3KX/lorY8HMtUqI1s5XyexybSNlbO+j9M2DQSaZZ+Ik2Ly0+2wV27FXHJr+rI0/CSyGM+m8OkI61uHkiPyebwi8vZTsG+QwwVEYgsdGUQws=
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
Cc: David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKW1doeV0KT24gc29t
ZSBjb21wb3NpdG9ycywgd2l0aCB0d28gbW9uaXRvcnMgYXR0YWNoZWQsIFZUIHRlcm1pbmFsCnN3
aXRjaCBjYW4gY2F1c2UgYSBncmFwaGljYWwgaXNzdWUgYnkgdGhlIGZvbGxvd2luZyBtZWFuczoK
ClRoZXJlIGFyZSB0d28gc3RyZWFtcywgb25lIGZvciBlYWNoIG1vbml0b3IuIEVhY2ggc3RyZWFt
IGhhcyBvbmUKcGxhbmUKCmN1cnJlbnQgc3RhdGU6CglNMTpTMS0+UDEKCU0yOlMyLT5QMgoKVGhl
IHVzZXIgY2FsbHMgZm9yIGEgdGVybWluYWwgc3dpdGNoIGFuZCBhIGNvbW1pdCBpcyBtYWRlIHRv
CmNoYW5nZSBib3RoIHBsYW5lcyB0byBsaW5lYXIgc3dpenpsZSBtb2RlLiBJbiBhdG9taWMgY2hl
Y2ssCmEgbmV3IGRjX3N0YXRlIGlzIGNvbnN0cnVjdGVkIHdpdGggbmV3IHBsYW5lcyBvbiBlYWNo
IHN0cmVhbQoKbmV3IHN0YXRlOgoJTTE6UzEtPlAzCglNMjpTMi0+UDQKCkluIGNvbW1pdCB0YWls
LCBlYWNoIHN0cmVhbSBpcyBjb21taXR0ZWQsIG9uZSBhdCBhIHRpbWUuIFRoZSBmaXJzdApzdHJl
YW0gKFMxKSB1cGRhdGVzIHByb3Blcmx5LCB0cmlnZ2VycmluZyBhIGZ1bGwgdXBkYXRlIGFuZCBy
ZXBsYWNpbmcKdGhlIHN0YXRlCgpjdXJyZW50IHN0YXRlOgoJTTE6UzEtPlAzCglNMjpTMi0+UDQK
ClRoZSB1cGRhdGUgZm9yIFMyIGNvbWVzIGluLCBidXQgZGMgZGV0ZWN0cyB0aGF0IHRoZXJlIGlz
IG5vIGRpZmZlcmVuY2UKYmV0d2VlbiB0aGUgc3RyZWFtIGFuZCBwbGFuZSBpbiB0aGUgbmV3IGFu
ZCBjdXJyZW50IHN0YXRlcywgYW5kIHNvCnRyaWdnZXJzIGEgZmFzdCB1cGRhdGUuIFRoZSBmYXN0
IHVwZGF0ZSBkb2VzIG5vdCBwcm9ncmFtIHN3aXp6bGUsCnNvIHRoZSBzZWNvbmQgbW9uaXRvciBp
cyBjb3JydXB0ZWQKCltIb3ddCkFkZCBhIGZsYWcgdG8gZGNfcGxhbmVfc3RhdGUgdGhhdCBmb3Jj
ZXMgZnVsbCB1cGRhdGVzCgpXaGVuIGEgc3RyZWFtIHVuZGVyZ29lcyBhIGZ1bGwgdXBkYXRlLCBz
ZXQgdGhpcyBmbGFnIG9uIGFsbCBjaGFuZ2VkCnBsYW5lcywgdGhlbiBjbGVhciBpdCBvbiB0aGUg
Y3VycmVudCBzdHJlYW0KClN1YnNlcXVlbnQgc3RyZWFtcyB3aWxsIGdldCBmdWxsIHVwZGF0ZXMg
YXMgYSByZXN1bHQKCkNoYW5nZS1JZDogSTIxMWI1ODc3NmJmYzNiODRlZDFjZmEzZWExMWI5OTc1
MTAxYTQ0YTgKU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KQWNr
ZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgpBY2tl
ZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAxOSArKysrKysr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgIHwg
IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCBjZWVhY2Q3MjdmNWEuLmNjMWRjYjQ4NmJi
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC0xNDc2LDYg
KzE0NzYsMTEgQEAgc3RhdGljIGVudW0gc3VyZmFjZV91cGRhdGVfdHlwZSBkZXRfc3VyZmFjZV91
cGRhdGUoY29uc3Qgc3RydWN0IGRjICpkYywKIAkJcmV0dXJuIFVQREFURV9UWVBFX0ZVTEw7CiAJ
fQogCisJaWYgKHUtPnN1cmZhY2UtPmZvcmNlX2Z1bGxfdXBkYXRlKSB7CisJCXVwZGF0ZV9mbGFn
cy0+Yml0cy5mdWxsX3VwZGF0ZSA9IDE7CisJCXJldHVybiBVUERBVEVfVFlQRV9GVUxMOworCX0K
KwogCXR5cGUgPSBnZXRfcGxhbmVfaW5mb191cGRhdGVfdHlwZSh1KTsKIAllbGV2YXRlX3VwZGF0
ZV90eXBlKCZvdmVyYWxsX3R5cGUsIHR5cGUpOwogCkBAIC0xOTExLDYgKzE5MTYsMTQgQEAgdm9p
ZCBkY19jb21taXRfdXBkYXRlc19mb3Jfc3RyZWFtKHN0cnVjdCBkYyAqZGMsCiAJCX0KIAogCQlk
Y19yZXNvdXJjZV9zdGF0ZV9jb3B5X2NvbnN0cnVjdChzdGF0ZSwgY29udGV4dCk7CisKKwkJZm9y
IChpID0gMDsgaSA8IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaSsrKSB7CisJCQlzdHJ1Y3Qg
cGlwZV9jdHggKm5ld19waXBlID0gJmNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV07CisJCQlz
dHJ1Y3QgcGlwZV9jdHggKm9sZF9waXBlID0gJmRjLT5jdXJyZW50X3N0YXRlLT5yZXNfY3R4LnBp
cGVfY3R4W2ldOworCisJCQlpZiAobmV3X3BpcGUtPnBsYW5lX3N0YXRlICYmIG5ld19waXBlLT5w
bGFuZV9zdGF0ZSAhPSBvbGRfcGlwZS0+cGxhbmVfc3RhdGUpCisJCQkJbmV3X3BpcGUtPnBsYW5l
X3N0YXRlLT5mb3JjZV9mdWxsX3VwZGF0ZSA9IHRydWU7CisJCX0KIAl9CiAKIApAQCAtMTk0Nyw2
ICsxOTYwLDEyIEBAIHZvaWQgZGNfY29tbWl0X3VwZGF0ZXNfZm9yX3N0cmVhbShzdHJ1Y3QgZGMg
KmRjLAogCQlkYy0+Y3VycmVudF9zdGF0ZSA9IGNvbnRleHQ7CiAJCWRjX3JlbGVhc2Vfc3RhdGUo
b2xkKTsKIAorCQlmb3IgKGkgPSAwOyBpIDwgZGMtPnJlc19wb29sLT5waXBlX2NvdW50OyBpKysp
IHsKKwkJCXN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHggPSAmY29udGV4dC0+cmVzX2N0eC5waXBl
X2N0eFtpXTsKKworCQkJaWYgKHBpcGVfY3R4LT5wbGFuZV9zdGF0ZSAmJiBwaXBlX2N0eC0+c3Ry
ZWFtID09IHN0cmVhbSkKKwkJCQlwaXBlX2N0eC0+cGxhbmVfc3RhdGUtPmZvcmNlX2Z1bGxfdXBk
YXRlID0gZmFsc2U7CisJCX0KIAl9CiAJLypsZXQncyB1c2UgY3VycmVudF9zdGF0ZSB0byB1cGRh
dGUgd2F0ZXJtYXJrIGV0YyovCiAJaWYgKHVwZGF0ZV90eXBlID49IFVQREFURV9UWVBFX0ZVTEwp
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmluZGV4IGIwZmRmODM4N2U3YS4uNDIyMmZm
ZWQxMWZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtNTczLDYgKzU3Myw5
IEBAIHN0cnVjdCBkY19wbGFuZV9zdGF0ZSB7CiAJc3RydWN0IGRjX3BsYW5lX3N0YXR1cyBzdGF0
dXM7CiAJc3RydWN0IGRjX2NvbnRleHQgKmN0eDsKIAorCS8qIEhBQ0s6IFdvcmthcm91bmQgZm9y
IGZvcmNpbmcgZnVsbCByZXByb2dyYW1taW5nIHVuZGVyIHNvbWUgY29uZGl0aW9ucyAqLworCWJv
b2wgZm9yY2VfZnVsbF91cGRhdGU7CisKIAkvKiBwcml2YXRlIHRvIGRjX3N1cmZhY2UuYyAqLwog
CWVudW0gZGNfaXJxX3NvdXJjZSBpcnFfc291cmNlOwogCXN0cnVjdCBrcmVmIHJlZmNvdW50Owot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
