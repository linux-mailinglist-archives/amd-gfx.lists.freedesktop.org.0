Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D4BBF8A
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 03:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8357489BD4;
	Tue, 24 Sep 2019 01:02:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1D589BD4
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 01:02:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYUO0vwl+Nh+EjWWsjvbu1jl4K58p0SEshMMtOAEIfMc6frWHUeptQtcrIQnQSvaj7OEXbO3EbCUCtM4/tSCnpspOnD1b4XIyisCDgZdBdJ1YnBatwPCXbdgCZy4afzXWQfUAEDtH4MQ1NygAMKsKYEpRzwx9pe9qQ1WhRJfH77Tx/vKW42x+v9eWeCVYP59mUkZz9Tfe5LxtziJc8Fknd5IYGIQ7IoJtzCYlYd8Z5kvag5dfNbmaBIBQl5TOcCJagkAms2oaJfwOuIDaMiKFOi6V3yZhbGA9JCNP5mxbwN87ZjvcVwTv/EeXK+OEUYqpmRqX5+eil2lrceur6KT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRwdAObJBG3MBNPm0tCV8uHHzqxLgJIb3EDHDTTM58c=;
 b=dMYpW6ckUvjLXTuLUVZHkfGKkqLDhe9rReZpgCrPs95Oa1MMMtgtw+qIa+p+gVFciUPcxgyyr8i4WD77Ly8r8GBlqm/tRAbBzCvfpXIa4f0L0m4ngDCsfETt5UUkDWy7GQ7GlHpRp0FVlNK9GUIdDmsrxIxxHs8te/5YHlKezLTb1aFBbzCHdX1EorlTfn8USR6Q0uuwsPe5/ISnI3LIm/oe/57iHBLomQsb5HkjN+j1HmcrU3QxBG7so+GxYrVXcbu+dV6IfaPq27MRLlMYbT2bg4Az+j7my0Fn4CBYV+zYl+dlIR/MmEu0O5ZRVzIGG4HwX9ixnEGI+56rE1du4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3015.namprd12.prod.outlook.com (20.178.55.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 01:02:22 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 01:02:22 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH 22/22] drm/amdgpu: add comments in ras interrupt callback
Thread-Topic: [PATCH 22/22] drm/amdgpu: add comments in ras interrupt callback
Thread-Index: AQHVcgSAPyT5tpm+rUm8w0cYYZlIB6c6Ayeg
Date: Tue, 24 Sep 2019 01:02:21 +0000
Message-ID: <BYAPR12MB280699334A8A1225BEA415CEF1840@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190923114557.29292-1-tao.zhou1@amd.com>
In-Reply-To: <20190923114557.29292-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32720a97-da9e-40c1-c72b-08d7408adb19
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3015; 
x-ms-traffictypediagnostic: BYAPR12MB3015:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB301557D8AFC1D2BA786E21BFF1840@BYAPR12MB3015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(13464003)(199004)(189003)(256004)(71190400001)(53546011)(71200400001)(11346002)(6506007)(6636002)(446003)(305945005)(7696005)(8676002)(81166006)(81156014)(7736002)(186003)(86362001)(66066001)(66946007)(486006)(2906002)(66446008)(66476007)(66556008)(64756008)(476003)(6246003)(110136005)(52536014)(102836004)(26005)(76176011)(5660300002)(2501003)(478600001)(74316002)(6436002)(9686003)(3846002)(76116006)(6116002)(25786009)(33656002)(99286004)(316002)(55016002)(14444005)(8936002)(229853002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3015;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RjEtesA6MRsJrQRiN6hB7QivROgZwMG7cwDu3UiI0lPh6prjckM3/OSpTzUmDk5zRiTrPOzh31elVHMIjfLNoc9D9CciiO5PZHWJYcQgIpEtFgDo1+OpGV8j6kgGg8aAEAgc/BwoA+KVp78z6QOth7CBZsgbQ8KlTs6etq2kIXwCnlHiTVetZl0toS/N6Q5pio7cENd676qKDVvuPvId+S0bTl5+PE6JoTeA9pZcfc/xayeL4vDmtmAEqIbZ9pwz6AMZD1BbEs2daSzL9tjM1VYBUE8RxKEje4bO8A0HzKlyfI6KJgi6VcPKsh1moT9QCll8xiFe32cY7ydEZIBV0GGPB/knJYz2xpYXh1bOV+Q9qeP7Jk8VibSfEJcTQfeJ0P7d1F31OxLlelFyV0LykQ7tc26FmtBvC5RJCynKptU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32720a97-da9e-40c1-c72b-08d7408adb19
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 01:02:22.0339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2ifhBmG5iPkSCdfs/xHZ75jfSi12dHo0YSkgOXR7bYlLTn4RBAByueNyG5mHADTOwyBQQfGE3lMpIqxke9mxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRwdAObJBG3MBNPm0tCV8uHHzqxLgJIb3EDHDTTM58c=;
 b=voNcVdAHh7Jz3SV7sAw9hNIRRIt9YnmlVBxNjZeh/PTDcBF/HDIg3B+6wISli7edjK44+oKGDDWaQAruKSd5rt5rjrDkYBjxIq9UkZN+cDAKlzkMxqg1b3cHDhRdrQ1nsdFfktvYWh9k85fuvO4wjxcsyRmv+9hCz9zM5fPu+2E=
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

U2VyaWVzIGlzOiBSZXZpZXdlZC1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+
DQoNClJlZ2FyZHMsDQpHdWNodW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPiANClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVy
IDIzLCAyMDE5IDc6NDYgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hl
biwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcu
WmhhbmdAYW1kLmNvbT47IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1k
LmNvbT4NCkNjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRD
SCAyMi8yMl0gZHJtL2FtZGdwdTogYWRkIGNvbW1lbnRzIGluIHJhcyBpbnRlcnJ1cHQgY2FsbGJh
Y2sNCg0KYWRkIGNvbW1lbnRzIHRvIGNsYXJpZnkgd2h5IGNoZWNraW5nIEdGWCBJUCBCTE9DSyBm
b3IgZWFjaCByYXMgaW50ZXJydXB0IGNhbGxiYWNrDQoNClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91
IDx0YW8uemhvdTFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nZnguYyB8IDcgKysrKysrLSAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5jIHwgNCArKysrICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAg
fCA0ICsrKysNCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYw0KaW5kZXggMWI3YTAy
Mjk5NmY2Li42ODQ5NWYwZTQzNTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZnguYw0KQEAgLTYzNiw3ICs2MzYsMTIgQEAgaW50IGFtZGdwdV9nZnhfcHJvY2Vzc19yYXNf
ZGF0YV9jYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJCXZvaWQgKmVycl9kYXRhLA0K
IAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpDQogew0KLQkvKiBUT0RPIHVlIHdpbGwg
dHJpZ2dlciBhbiBpbnRlcnJ1cHQuICovDQorCS8qIFRPRE8gdWUgd2lsbCB0cmlnZ2VyIGFuIGlu
dGVycnVwdC4NCisJICoNCisJICogV2hlbiDigJxGdWxsIFJBU+KAnSBpcyBlbmFibGVkLCB0aGUg
cGVyLUlQIGludGVycnVwdCBzb3VyY2VzIHNob3VsZA0KKwkgKiBiZSBkaXNhYmxlZCBhbmQgdGhl
IGRyaXZlciBzaG91bGQgb25seSBsb29rIGZvciB0aGUgYWdncmVnYXRlZA0KKwkgKiBpbnRlcnJ1
cHQgdmlhIHN5bmMgZmxvb2QNCisJICovDQogCWlmICghYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQo
YWRldiwgQU1ER1BVX1JBU19CTE9DS19fR0ZYKSkgew0KIAkJa2dkMmtmZF9zZXRfc3JhbV9lY2Nf
ZmxhZyhhZGV2LT5rZmQuZGV2KTsNCiAJCWlmIChhZGV2LT5nZnguZnVuY3MtPnF1ZXJ5X3Jhc19l
cnJvcl9jb3VudCkNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdW1jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMNCmluZGV4
IDc3NDRkZTE0OTk0OS4uZDRmYjljZjI3ZTIxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdW1jLmMNCkBAIC05NSw2ICs5NSwxMCBAQCBpbnQgYW1kZ3B1X3VtY19wcm9jZXNz
X3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCAgew0KIAlzdHJ1Y3QgcmFz
X2Vycl9kYXRhICplcnJfZGF0YSA9IChzdHJ1Y3QgcmFzX2Vycl9kYXRhICopcmFzX2Vycm9yX3N0
YXR1czsNCiANCisJLyogV2hlbiDigJxGdWxsIFJBU+KAnSBpcyBlbmFibGVkLCB0aGUgcGVyLUlQ
IGludGVycnVwdCBzb3VyY2VzIHNob3VsZA0KKwkgKiBiZSBkaXNhYmxlZCBhbmQgdGhlIGRyaXZl
ciBzaG91bGQgb25seSBsb29rIGZvciB0aGUgYWdncmVnYXRlZA0KKwkgKiBpbnRlcnJ1cHQgdmlh
IHN5bmMgZmxvb2QNCisJICovDQogCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBB
TURHUFVfUkFTX0JMT0NLX19HRlgpKQ0KIAkJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsNCiAN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jDQppbmRleCA5OGZkMWU1NDg0ZDAu
Ljk2NTgxYjViMGE4YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjRfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0K
QEAgLTE5MzAsNiArMTkzMCwxMCBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX3Jhc19k
YXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCAgew0KIAlpbnQgaW5zdGFuY2U7DQog
DQorCS8qIFdoZW4g4oCcRnVsbCBSQVPigJ0gaXMgZW5hYmxlZCwgdGhlIHBlci1JUCBpbnRlcnJ1
cHQgc291cmNlcyBzaG91bGQNCisJICogYmUgZGlzYWJsZWQgYW5kIHRoZSBkcml2ZXIgc2hvdWxk
IG9ubHkgbG9vayBmb3IgdGhlIGFnZ3JlZ2F0ZWQNCisJICogaW50ZXJydXB0IHZpYSBzeW5jIGZs
b29kDQorCSAqLw0KIAlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JB
U19CTE9DS19fR0ZYKSkNCiAJCWdvdG8gb3V0Ow0KIA0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
