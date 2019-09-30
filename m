Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6CEC1A55
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 05:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24489F41;
	Mon, 30 Sep 2019 03:26:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710060.outbound.protection.outlook.com [40.107.71.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA94289F41
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 03:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShKdlNRzMDv5+ZhPXVflrZZfCVK74aGl0kKZMV4z+TyEXl8DmicfrTAlyLW6Bm5JojWk3RugAzCRb5PvKc5cYUKdblPW/Z4x8D5JCNLUpqfYzyAtUEa5W0IqNM17yV4ETk+fvRMsGTg2exw/OqQ9YGlZcq+unoJJwu6neHIfyVCiLkUYnigYwZNMCxtD1RZqosz1CZhaceNqH99RQPMnfFIiMeonPOhXFu1/1qVtPHSfMsCCYIDLvpwpgnwYVOd02gCRZwUWHCdcejbtlorzomp3pMAvSrj9Bvl8Q5nkuq6keCZRh6TnYq2LqLUKVWHjGsgiafD88vyEjmUNrND/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltykZ8mU+pq919nuT2YGk40kyDXrypmwwRXWlBmVlqE=;
 b=FxHVJaZaCzkwNhBLHFn/AaAE76t7RFFzrBoAZ+vlkF6RgNKK8C73GXR7djzCEMntVcldBBnK8vFG7UPbKEbP9vCBMCFIFWvstvpBxBm83R+H6rj1/fNhedzwXF9JxuHMjq4n7YIZKO/9KvlEYZ7ykjSUlTxIb7YIVCDN0zPizWxwia0aD9m5CJ3eOz9ePBm4aVl2VLMJjsGFMJ00Uwz9m3fnngtjLtkn65Be3aKLUzigryMqUGC0/zPZeXjyP2cn59sfJd/RW15WP9/MKF251UptBF8o7pHLoUKwnohbzfIzOHkNJH7qwFuL4Uf0Tz92zTMKk87hkEEdbaY1jZPBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3399.namprd12.prod.outlook.com (20.178.196.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.16; Mon, 30 Sep 2019 03:26:06 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa%6]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 03:26:06 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 3/3] drm/amdgpu: reuse code of ras bad page's bo create
Thread-Topic: [PATCH 3/3] drm/amdgpu: reuse code of ras bad page's bo create
Thread-Index: AQHVdz3yqmMa3LfM10atTZkVAxUbHKdDjjZA
Date: Mon, 30 Sep 2019 03:26:06 +0000
Message-ID: <BYAPR12MB280665193C9A39222B345279F1820@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190930031938.10982-1-tao.zhou1@amd.com>
 <20190930031938.10982-3-tao.zhou1@amd.com>
In-Reply-To: <20190930031938.10982-3-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f05d62d4-1dc5-431b-e9c2-08d74555ee2e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3399:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3399D2EB404F835471FD0E19F1820@BYAPR12MB3399.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(189003)(199004)(13464003)(71200400001)(71190400001)(110136005)(53546011)(66066001)(478600001)(25786009)(11346002)(476003)(486006)(52536014)(6246003)(229853002)(6436002)(446003)(9686003)(5660300002)(102836004)(26005)(99286004)(55016002)(6636002)(3846002)(66476007)(74316002)(7736002)(64756008)(66556008)(86362001)(305945005)(76116006)(81166006)(81156014)(8936002)(2501003)(2906002)(7696005)(33656002)(66946007)(6506007)(186003)(8676002)(14454004)(6116002)(316002)(76176011)(14444005)(256004)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3399;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: piKFa8WpP7RByEdtWvpNuiUAoKm08iYSh8csjHjhGm0AOEnMOaEnRWQadR+vQXLL9idIkK/CKXxxmLUAIOku78fi0sRwoGRjbdH2Fm8Dmx1kmSnbcgKZF71ZsfOzCqV8v9EXC0kwwSFD0cUC+QdmthWv1G4DkzJkI3oKmOs+Ws5qPjVy6jzU5htyj+0FwajkQEyJ4uUld7cCg2yNltT7ljvXtYsChFr7fVs9haTH+zKr70rrFIA011USpYOnnbZL0D/CdYQ/wePS1pwMR2yyBFPHt93FkXTS032g7IIvwfiaiX55kK2pyu9MwGT3mJnBCWgKqPKGGvyvteex2TprRhzL6gnrmeWu1jStf/fQxVtaS+iCoOi7p8FZZ+LyNp5B3HrCL81RKs2e5iUWIhu6amp47Yk8p5Bv8T+7XxHNO7M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05d62d4-1dc5-431b-e9c2-08d74555ee2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 03:26:06.5603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sf6lWnZ2CUZ29xObql0PqY83CQyjbDGJRo3fNCW1FEo7Tg8OJkvTS4PLo2Ci/Nj3yZW9g+9E9VumAGn1aZsySQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3399
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltykZ8mU+pq919nuT2YGk40kyDXrypmwwRXWlBmVlqE=;
 b=boi0o1UYCJNI0UrnjpntuDLNTephkcJ6gS6RGHSbycMGVg5dGqqEMd2DdpspbTP8aiTZ3Y2FUXBugQJLR9/3KmvDdnmuj8QFGl2Q29Ayrb7nmHLAOn6SrBOMphi4jLy/BsO3Nc2QrtaoXWCL14jIJYg8F2fMM05t3ubrqv12UJU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ClJlZ2FyZHMsCkd1Y2h1bgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogWmhvdTEs
IFRhbyA8VGFvLlpob3UxQGFtZC5jb20+IApTZW50OiBNb25kYXksIFNlcHRlbWJlciAzMCwgMjAx
OSAxMToyMCBBTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEdyb2R6b3Zza3ks
IEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IENoZW4sIEd1Y2h1biA8R3VjaHVu
LkNoZW5AYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+CkNj
OiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDMvM10gZHJt
L2FtZGdwdTogcmV1c2UgY29kZSBvZiByYXMgYmFkIHBhZ2UncyBibyBjcmVhdGUKCmltcGxlbWVu
dCByYXNfY3JlYXRlX2JhZF9wYWdlc19ibyB0byBzaW1wbGlmeSByYXMgY29kZQoKU2lnbmVkLW9m
Zi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDcyICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggZDFiYWZhOTJjYTkxLi5mZTNhNTdl
NTY3YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTE0MzAs
NDEgKzE0MzAsNTMgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2xvYWRfYmFkX3BhZ2VzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLS8qIGNhbGxlZCBpbiBn
cHUgcmVjb3ZlcnkvaW5pdCAqLwotaW50IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCitzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2NyZWF0ZV9i
YWRfcGFnZXNfYm8oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CisJLyogTm90ZTogdGhl
IGNhbGxlciBzaG91bGQgZ3VhcmFudGVlIGNvbiBhbmQgZGF0YSBhcmUgbm90IE5VTEwgKi8KIAlz
dHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKLQlz
dHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7CisJc3RydWN0IHJhc19lcnJfaGFuZGxl
cl9kYXRhICpkYXRhID0gY29uLT5laF9kYXRhOwogCXVpbnQ2NF90IGJwOwotCXN0cnVjdCBhbWRn
cHVfYm8gKmJvID0gTlVMTDsKLQlpbnQgaSwgcmV0ID0gMDsKLQotCWlmICghY29uIHx8ICFjb24t
PmVoX2RhdGEpCi0JCXJldHVybiAwOworCXN0cnVjdCBhbWRncHVfYm8gKmJvOworCWludCBpOwog
Ci0JbXV0ZXhfbG9jaygmY29uLT5yZWNvdmVyeV9sb2NrKTsKLQlkYXRhID0gY29uLT5laF9kYXRh
OwotCWlmICghZGF0YSkKLQkJZ290byBvdXQ7Ci0JLyogcmVzZXJ2ZSB2cmFtIGF0IGRyaXZlciBw
b3N0IHN0YWdlLiAqLwogCWZvciAoaSA9IGRhdGEtPmxhc3RfcmVzZXJ2ZWQ7IGkgPCBkYXRhLT5j
b3VudDsgaSsrKSB7CisJCWJvID0gTlVMTDsKIAkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJlZF9w
YWdlOwogCi0JCS8qIFRoZXJlIGFyZSB0d28gY2FzZXMgb2YgcmVzZXJ2ZSBlcnJvciBzaG91bGQg
YmUgaWdub3JlZDoKKwkJLyogVGhlcmUgYXJlIHRocmVlIGNhc2VzIG9mIHJlc2VydmUgZXJyb3Ig
c2hvdWxkIGJlIGlnbm9yZWQ6CiAJCSAqIDEpIGEgcmFzIGJhZCBwYWdlIGhhcyBiZWVuIGFsbG9j
YXRlZCAodXNlZCBieSBzb21lb25lKTsKIAkJICogMikgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4g
cmVzZXJ2ZWQgKGR1cGxpY2F0ZSBlcnJvciBpbmplY3Rpb24KIAkJICogICAgZm9yIG9uZSBwYWdl
KTsKKwkJICogMykgYm8gaW5mbyBpc24ndCBsb3N0IGluIGdwdSByZXNldAogCQkgKi8KIAkJaWYg
KGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IEFNREdQVV9HUFVfUEFHRV9T
SElGVCwKIAkJCQkJICAgICAgIEFNREdQVV9HUFVfUEFHRV9TSVpFLAogCQkJCQkgICAgICAgQU1E
R1BVX0dFTV9ET01BSU5fVlJBTSwKIAkJCQkJICAgICAgICZibywgTlVMTCkpCi0JCQlEUk1fV0FS
TigiUkFTIFdBUk46IHJlc2VydmUgdnJhbSBmb3IgcmV0aXJlZCBwYWdlICVsbHggZmFpbFxuIiwg
YnApOwotCi0JCWRhdGEtPmJwc19ib1tpXSA9IGJvOworCQkJRFJNX05PVEUoIlJBUyBOT1RFOiBy
ZXNlcnZlIHZyYW0gZm9yIHJldGlyZWQgcGFnZSAweCVsbHggZmFpbFxuIiwgYnApOworCQllbHNl
CisJCQlkYXRhLT5icHNfYm9baV0gPSBibzsKW0d1Y2h1bl1UaGUgImVsc2UiIHNob3VsZCBub3Qg
bmVlZGVkPyBPdGhlcndpc2UsIGlmIGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0IGFsd2F5cyBz
dWNjZWVkcywgd2UgZG9uJ3QgY2F0Y2ggYSBjaGFuY2UgdG8gdXBkYXRlIGJwc19iby4KSXMgdGhh
dCB0cnVlPwogCQlkYXRhLT5sYXN0X3Jlc2VydmVkID0gaSArIDE7Ci0JCWJvID0gTlVMTDsKIAl9
Cit9CisKKy8qIGNhbGxlZCBpbiBncHUgcmVjb3ZlcnkvaW5pdCAqLworaW50IGFtZGdwdV9yYXNf
cmVzZXJ2ZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsKKwlzdHJ1Y3Qg
YW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKKwlzdHJ1Y3Qg
cmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7CisJaW50IHJldCA9IDA7CisKKwlpZiAoIWNvbiB8
fCAhY29uLT5laF9kYXRhKQorCQlyZXR1cm4gMDsKKworCW11dGV4X2xvY2soJmNvbi0+cmVjb3Zl
cnlfbG9jayk7CisJZGF0YSA9IGNvbi0+ZWhfZGF0YTsKKwlpZiAoIWRhdGEpCisJCWdvdG8gb3V0
OworCisJLyogcmVzZXJ2ZSB2cmFtIGF0IGRyaXZlciBwb3N0IHN0YWdlLiAqLworCWFtZGdwdV9y
YXNfY3JlYXRlX2JhZF9wYWdlc19ibyhhZGV2KTsKIAogCS8qIGNvbnRpbnVlIHRvIHNhdmUgYmFk
IHBhZ2VzIHRvIGVlcHJvbSBldmVuIHJlZXNydmVfdnJhbSBmYWlscyAqLwogCXJldCA9IGFtZGdw
dV9yYXNfc2F2ZV9iYWRfcGFnZXMoYWRldik7IEBAIC0xNTgzLDkgKzE1OTUsNiBAQCB2b2lkIGFt
ZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7CiAJ
c3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7CiAJ
c3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICpkYXRhOwotCXVpbnQ2NF90IGJwOwotCXN0cnVj
dCBhbWRncHVfYm8gKmJvID0gTlVMTDsKLQlpbnQgaTsKIAogCWlmICghY29uIHx8ICFjb24tPmVo
X2RhdGEpCiAJCXJldHVybjsKQEAgLTE2MDAsMjYgKzE2MDksNyBAQCB2b2lkIGFtZGdwdV9yYXNf
cmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJZGF0YSA9IGNvbi0+
ZWhfZGF0YTsKIAkvKiBmb3JjZSB0byByZXNlcnZlIGFsbCByZXRpcmVkIHBhZ2UgYWdhaW4gKi8K
IAlkYXRhLT5sYXN0X3Jlc2VydmVkID0gMDsKLQotCWZvciAoaSA9IGRhdGEtPmxhc3RfcmVzZXJ2
ZWQ7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7Ci0JCWJwID0gZGF0YS0+YnBzW2ldLnJldGlyZWRf
cGFnZTsKLQotCQkvKiBUaGVyZSBhcmUgdGhyZWUgY2FzZXMgb2YgcmVzZXJ2ZSBlcnJvciBzaG91
bGQgYmUgaWdub3JlZDoKLQkJICogMSkgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gYWxsb2NhdGVk
ICh1c2VkIGJ5IHNvbWVvbmUpOwotCQkgKiAyKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiByZXNl
cnZlZCAoZHVwbGljYXRlIGVycm9yIGluamVjdGlvbgotCQkgKiAgICBmb3Igb25lIHBhZ2UpOwot
CQkgKiAzKSBibyBpbmZvIGlzbid0IGxvc3QgaW4gZ3B1IHJlc2V0Ci0JCSAqLwotCQlpZiAoYW1k
Z3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgQU1ER1BVX0dQVV9QQUdFX1NISUZU
LAotCQkJCQkgICAgICAgQU1ER1BVX0dQVV9QQUdFX1NJWkUsCi0JCQkJCSAgICAgICBBTURHUFVf
R0VNX0RPTUFJTl9WUkFNLAotCQkJCQkgICAgICAgJmJvLCBOVUxMKSkKLQkJCURSTV9OT1RFKCJS
QVMgTk9URTogcmVjcmVhdGUgYm8gZm9yIHJldGlyZWQgcGFnZSAweCVsbHggZmFpbFxuIiwgYnAp
OwotCQllbHNlCi0JCQlkYXRhLT5icHNfYm9baV0gPSBibzsKLQkJZGF0YS0+bGFzdF9yZXNlcnZl
ZCA9IGkgKyAxOwotCQlibyA9IE5VTEw7Ci0JfQorCWFtZGdwdV9yYXNfY3JlYXRlX2JhZF9wYWdl
c19ibyhhZGV2KTsKIH0KIC8qIHJlY292ZXJ5IGVuZCAqLwogCi0tCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
