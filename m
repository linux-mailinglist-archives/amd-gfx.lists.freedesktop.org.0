Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45428C9095
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4186E97B;
	Wed,  2 Oct 2019 18:16:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024CE6E1B1
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG4rq/Rw/9cFV7OtBMt4oCNaR/ivZoy67F3fV/Iq8Po4VAsYl9/vkDtu1a8V8IWqf0PYjm+o6SYa6l7s7YdJmjBlc5LRCbAFI/eh2gqSSz/OlYNuJnij6wFkVtYd7zTnbIk6YocEAE9kW5xLK2zKvLCJVchf6xep0MVYEYSks9CUNGyMA1tMLRApXq9dxab1umzJuiZA8B4ac0O6nWQgOsU2ZgWd2feUjATKeiHBNEgfr608nG78qgQiV2HnpWX7GItUhOc8M01QnJuWPKdPmLWNDsz6PetlBVI6FvMnPjZswyJuXpooV9sdxMPpopckprE0kNd7YC6miinoJ0IRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoxDFUQUXuPF4gN0BOPjNV5XuDMm5fhzI86FKOUd5LU=;
 b=nwFw0szCQaWVv9MIH6QCe85yT83QwPnQlZqpzeR9g+Kx/qqNdxKR5QRMlew3fdj/ul1vcR2iBxSW2u0znewzp0GFDIZUrvL+p2fm7n1uDfiIrhErKXqPOTCq2td8AYkM85UuuEuxvMmYiKw3TXnzTgUexBq64K+T6/xS0WbyIpvHtuZqN1NIjqhtruq9jIeXMpIL9F1VlREXD3cwbWkNp/wkJT5myTmAq7l6saJ6WmVk+HjcpApPQdlUBBVKfJvZdzlRG7s7ClgCLYZvUEWlHSnPCaFAoFS7R1h1dTFiM1uptDdFC1IhHIupxgvDRJWt3u804bQlbZ45tdMFybrMdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 BYAPR12MB2870.namprd12.prod.outlook.com (2603:10b6:a03:12d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:41 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:41 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:40 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/38] drm/amd/display: check phy dpalt lane count config
Date: Wed, 2 Oct 2019 14:16:09 -0400
Message-ID: <20191002181633.22805-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(428003)(199004)(189003)(36756003)(186003)(26005)(8936002)(11346002)(2616005)(476003)(126002)(446003)(426003)(336012)(14444005)(50226002)(50466002)(16586007)(81166006)(316002)(81156014)(2351001)(8676002)(53416004)(7696005)(305945005)(6916009)(76176011)(51416003)(2906002)(48376002)(70206006)(5660300002)(478600001)(86362001)(47776003)(1076003)(6666004)(486006)(356004)(4326008)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2870; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf21867a-737e-44e0-8993-08d74764acc1
X-MS-TrafficTypeDiagnostic: BYAPR12MB2870:
X-Microsoft-Antispam-PRVS: <BYAPR12MB28709DBD9B19C8275334ABBAF99C0@BYAPR12MB2870.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g00hxdTwNctWr7eYXW93CWahRZhdB53qtqexMuTy9YN/9Gisw9gnDRul3h0iBoPI07z0BivC6FxUp9xuNE0DhgHF+JCWliobb6x6lNjP915TaDhIBtDHlSA86KIpR8t3b+KqtsjHs2Cyq3rx2MGEYtFh/tids55KbDc67FK0owqfMZO0JUYVLF5y4ZcHISzMjWoGG/H5QVsQNr61ozdShuFFQClllPrBe+BZaTWcpwDxRnsdMQDtchfLZVb0EdeLLQv/Fhs/5qwqpqv/3ox29MQJxFjvWCSG096r/7fj1x/RMsqzzRISDqv7G8QrY7GS98NwOMbfOmAvRciwrib319i6LnO3CZOnSOg815eKWs699tL2a5sz1axZUyDG4wKJRCZTdG5x7XYrPxSddphqB5ogHn/rVWb1C9jXgI3OTwI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:41.5820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf21867a-737e-44e0-8993-08d74764acc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2870
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoxDFUQUXuPF4gN0BOPjNV5XuDMm5fhzI86FKOUd5LU=;
 b=Xa8YMiD6KL/WXJki/stfAONDOCoyvFoZoAGo6xdy427ajzRzE9usgnXCnKuZzSWaFAgfkm8ObdXOLB511UkdimJIUwOlgd+PVY7RdIVij6WlPif0GpsN6ifZW/Xy9TZYj19Foy6xXfae27FbOcNnKPkQp7JB3Uzfbk322O7LhYg=
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
Cc: Lewis Huang <Lewis.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpUeXBlLWMgUEhZ
IGNvbmZpZyBpcyBub3QgYWxpZ24gd2l0aCBkcGNkIGxhbmUgY291bnQuCldoZW4gdGhvc2UgdmFs
dWVzIGRpZG4ndCBtYXRjaCwgaXQgY2F1c2UgZHJpdmVyIGRvCmxpbmsgdHJhaW5pbmcgd2l0aCA0
IGxhbmUgYnV0IHBoeSBvbmx5IGNhbiBvdXRwdXQgMiBsYW5lLgpUaGUgbGluayB0cmFpbmlnIGFs
d2F5cyBmYWlsLgoKW0hvd10KMS4gTW9kaWZ5IGdldF9tYXhfbGlua19jYXAgZnVuY3Rpb24uIEFj
Y29yZGluZyBEUEFMVF9EUDQKdG8gdXBkYXRlIG1heCBsYW5lIGNvdW50LgoyLiBBZGQgZHBfbXN0
X3ZlcmlmeV9saW5rX2NhcCB0byBoYW5kbGUgTVNUIGNhc2UgYmVjYXVzZQp3ZSBkaWRuJ3QgY2Fs
bCBkcF9tc3RfdmVyaWZ5X2xpbmtfY2FwIGZvciBNU1QgY2FzZS4KCkNoYW5nZS1JZDogSTI5Njkz
M2YyNGRmZjU1MDMzMGRkMjY5M2QzNDg0NTZkMzEyZDY5MzAKU2lnbmVkLW9mZi1ieTogTGV3aXMg
SHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBXZW5qaW5nIExpdSA8V2Vu
amluZy5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYyAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGlua19kcC5jIHwgMTYgKysrKysrKysrKysrKysrKwogLi4uL2FtZC9kaXNwbGF5L2Rj
L2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5oICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RwLmggIHwgIDMgKysrCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9pbmMvaHcvbGlua19lbmNvZGVyLmggfCAgNCArKysrCiA1IGZpbGVzIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKaW5kZXggNTUyYTMzYWYwMzE5Li42NzQ2MmJk
NzkxNzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
LmMKQEAgLTg3Miw3ICs4NzIsOCBAQCBib29sIGRjX2xpbmtfZGV0ZWN0X2hlbHBlcihzdHJ1Y3Qg
ZGNfbGluayAqbGluaywgZW51bSBkY19kZXRlY3RfcmVhc29uIHJlYXNvbikKIAkJCQkgKiBlbXB0
eSB3aGljaCBsZWFkcyB0byBhbGxvY2F0ZV9tc3RfcGF5bG9hZCgpIGhhcyAiMCIKIAkJCQkgKiBw
Ym5fcGVyX3Nsb3QgdmFsdWUgbGVhZGluZyB0byBleGNlcHRpb24gb24gZGNfZml4cHRfZGl2KCkK
IAkJCQkgKi8KLQkJCQlsaW5rLT52ZXJpZmllZF9saW5rX2NhcCA9IGxpbmstPnJlcG9ydGVkX2xp
bmtfY2FwOworCQkJCWRwX3ZlcmlmeV9tc3RfbGlua19jYXAobGluayk7CisKIAkJCQlpZiAocHJl
dl9zaW5rICE9IE5VTEwpCiAJCQkJCWRjX3NpbmtfcmVsZWFzZShwcmV2X3NpbmspOwogCQkJCXJl
dHVybiBmYWxzZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmtfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmtfZHAuYwppbmRleCA3Yzc4Y2FmN2E2MDIuLjcwMWI3MzkyNjYxNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwpAQCAtMTQwOSw2
ICsxNDA5LDkgQEAgc3RhdGljIHN0cnVjdCBkY19saW5rX3NldHRpbmdzIGdldF9tYXhfbGlua19j
YXAoc3RydWN0IGRjX2xpbmsgKmxpbmspCiAJaWYgKGxpbmstPmxpbmtfZW5jLT5mZWF0dXJlcy5m
bGFncy5iaXRzLklTX0hCUjNfQ0FQQUJMRSkKIAkJbWF4X2xpbmtfY2FwLmxpbmtfcmF0ZSA9IExJ
TktfUkFURV9ISUdIMzsKIAorCWlmIChsaW5rLT5saW5rX2VuYy0+ZnVuY3MtPmdldF9tYXhfbGlu
a19jYXApCisJCWxpbmstPmxpbmtfZW5jLT5mdW5jcy0+Z2V0X21heF9saW5rX2NhcChsaW5rLT5s
aW5rX2VuYywgJm1heF9saW5rX2NhcCk7CisKIAkvKiBMb3dlciBsaW5rIHNldHRpbmdzIGJhc2Vk
IG9uIHNpbmsncyBsaW5rIGNhcCAqLwogCWlmIChsaW5rLT5yZXBvcnRlZF9saW5rX2NhcC5sYW5l
X2NvdW50IDwgbWF4X2xpbmtfY2FwLmxhbmVfY291bnQpCiAJCW1heF9saW5rX2NhcC5sYW5lX2Nv
dW50ID0KQEAgLTE2NzAsNiArMTY3MywxOSBAQCBib29sIGRwX3ZlcmlmeV9saW5rX2NhcF93aXRo
X3JldHJpZXMoCiAJcmV0dXJuIHN1Y2Nlc3M7CiB9CiAKK2Jvb2wgZHBfdmVyaWZ5X21zdF9saW5r
X2NhcCgKKwlzdHJ1Y3QgZGNfbGluayAqbGluaykKK3sKKwlzdHJ1Y3QgZGNfbGlua19zZXR0aW5n
cyBtYXhfbGlua19jYXAgPSB7MH07CisKKwltYXhfbGlua19jYXAgPSBnZXRfbWF4X2xpbmtfY2Fw
KGxpbmspOworCWxpbmstPnZlcmlmaWVkX2xpbmtfY2FwID0gZ2V0X2NvbW1vbl9zdXBwb3J0ZWRf
bGlua19zZXR0aW5ncygKKwkJbGluay0+cmVwb3J0ZWRfbGlua19jYXAsCisJCW1heF9saW5rX2Nh
cCk7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKwogc3RhdGljIHN0cnVjdCBkY19saW5rX3NldHRpbmdz
IGdldF9jb21tb25fc3VwcG9ydGVkX2xpbmtfc2V0dGluZ3MoCiAJCXN0cnVjdCBkY19saW5rX3Nl
dHRpbmdzIGxpbmtfc2V0dGluZ19hLAogCQlzdHJ1Y3QgZGNfbGlua19zZXR0aW5ncyBsaW5rX3Nl
dHRpbmdfYikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9saW5rX2VuY29kZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9saW5rX2VuY29kZXIuaAppbmRleCA4YmY1ZjBmMjMwMWQuLjBjMTIzOTVjZmEz
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2xpbmtfZW5jb2Rlci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9saW5rX2VuY29kZXIuaApAQCAtMzM3LDYgKzMzNyw3IEBAIHN0cnVjdCBkY24xMF9s
aW5rX2VuY19yZWdpc3RlcnMgewogCQl0eXBlIFJEUENTX1RYX0ZJRk9fRVJST1JfTUFTSztcCiAJ
CXR5cGUgUkRQQ1NfRFBBTFRfRElTQUJMRV9UT0dHTEVfTUFTSztcCiAJCXR5cGUgUkRQQ1NfRFBB
TFRfNExBTkVfVE9HR0xFX01BU0s7XAorCQl0eXBlIFJEUENTX1BIWV9EUEFMVF9EUDQ7XAogCQl0
eXBlIFJEUENTX1BIWV9EUEFMVF9ESVNBQkxFO1wKIAkJdHlwZSBSRFBDU19QSFlfRFBBTFRfRElT
QUJMRV9BQ0s7XAogCQl0eXBlIFJEUENTX1BIWV9EUF9NUExMQl9WMkk7XApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RwLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2RjX2xpbmtfZHAuaAppbmRleCAwOGE0ZGYyYzYx
YTguLjk2NzcwNmU3ODk4ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9kY19saW5rX2RwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9kY19saW5rX2RwLmgKQEAgLTQzLDYgKzQzLDkgQEAgYm9vbCBkcF92ZXJpZnlfbGlua19j
YXBfd2l0aF9yZXRyaWVzKAogCXN0cnVjdCBkY19saW5rX3NldHRpbmdzICprbm93bl9saW1pdF9s
aW5rX3NldHRpbmcsCiAJaW50IGF0dGVtcHRzKTsKIAorYm9vbCBkcF92ZXJpZnlfbXN0X2xpbmtf
Y2FwKAorCXN0cnVjdCBkY19saW5rICpsaW5rKTsKKwogYm9vbCBkcF92YWxpZGF0ZV9tb2RlX3Rp
bWluZygKIAlzdHJ1Y3QgZGNfbGluayAqbGluaywKIAljb25zdCBzdHJ1Y3QgZGNfY3J0Y190aW1p
bmcgKnRpbWluZyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2h3L2xpbmtfZW5jb2Rlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9ody9saW5rX2VuY29kZXIuaAppbmRleCBhYmI0ZTQyMzdmYjYuLmIyMTkwOTIxNmZiNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9saW5rX2VuY29k
ZXIuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2xpbmtfZW5j
b2Rlci5oCkBAIC0xODQsNiArMTg0LDEwIEBAIHN0cnVjdCBsaW5rX2VuY29kZXJfZnVuY3Mgewog
CWJvb2wgKCpmZWNfaXNfYWN0aXZlKShzdHJ1Y3QgbGlua19lbmNvZGVyICplbmMpOwogI2VuZGlm
CiAJYm9vbCAoKmlzX2luX2FsdF9tb2RlKSAoc3RydWN0IGxpbmtfZW5jb2RlciAqZW5jKTsKKwor
CXZvaWQgKCpnZXRfbWF4X2xpbmtfY2FwKShzdHJ1Y3QgbGlua19lbmNvZGVyICplbmMsCisJCXN0
cnVjdCBkY19saW5rX3NldHRpbmdzICpsaW5rX3NldHRpbmdzKTsKKwogCWVudW0gc2lnbmFsX3R5
cGUgKCpnZXRfZGlnX21vZGUpKAogCQlzdHJ1Y3QgbGlua19lbmNvZGVyICplbmMpOwogfTsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
