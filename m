Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEBD77FB
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 16:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E1B8915F;
	Tue, 15 Oct 2019 14:06:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABC58915F
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 14:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZ97k+M/8+4NbrghQzALmGLJAyq+6IH41dBChCul0MV5nKld4Eoqhlq6n7F0+DKeSHT8MGmK1rmmEjsKbvlfBKmZMGOpnTxOx6PfPSFtjCk4dsasHzS5cs98Xi1pAFiVLQCLGNRqpYfPbbT2NfsDif0V9HgTtatfskWbehGbnK3Vo/0KyKb+d4Agkvql+MGQrr8cIu0KLUBaX7Fyfuy4uKKptLMFrkxtdgqT1OhhDCgcrgYZc6lAfHlRH1G9Gtj0IBhkLjh016jL19xxfnTRNsS7d+g2TOHKKMKfZtN3ihyNOq7wjOJvNsYYmoonN/HsY3h4wR6Vza7iXffaPuhREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZCyq6U/hSa6F5CybmeeNUxSRLqNVhNkS3kbJwPKSBs=;
 b=BS5iBAh29sh5RgFJXGMo86N0pZBV5mrCce46YcdyTblJLaIg2szolwaBQmDaTHhMCQ6BbnlwC7m0gu1KC4vCnJJtTx+Zr+MV37ztX9xbt946nwWhuVon7AeFuttFc5yOZ6qr9sc4SJyWeO7Mm5IVgyuVMJ1lYBZJ4tAyrszEAgzxIEx7x23yYkDjeEyJ/vdbnm5qZAbhWIS3hlk2oCZDz+Vooa5COwg0QRpEqtX56ea6WcqcyPF67lYI6d6FR3kdD9ZAwG3bm8h7NxHpOiWmh424TvSwCOjuLX0nbFvHupq15VpsIJ/2IQdhzAVAF96hVZRqYFJggqHcaobkyT8JlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0199.namprd12.prod.outlook.com (10.172.78.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 14:06:19 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 14:06:19 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: add NULL checks for clock manager pointer
Thread-Topic: [PATCH] drm/amd/display: add NULL checks for clock manager
 pointer
Thread-Index: AQHVgHXFaBnX2x1aBUid4i+i2xDgaadbwn8A
Date: Tue, 15 Oct 2019 14:06:18 +0000
Message-ID: <d53ace80-af4e-7539-7d01-d41a14c5131b@amd.com>
References: <20191011205154.21075-1-alexander.deucher@amd.com>
In-Reply-To: <20191011205154.21075-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTOPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::41) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2b9b1b5-7a69-44d0-8f45-08d75178d9b6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB019994744CB379C1014190548C930@CY4PR1201MB0199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(199004)(189003)(52116002)(14444005)(229853002)(476003)(3846002)(2616005)(76176011)(256004)(36756003)(99286004)(31696002)(478600001)(66066001)(66476007)(66946007)(65806001)(4326008)(6116002)(66556008)(64756008)(66446008)(65956001)(486006)(4001150100001)(25786009)(316002)(54906003)(58126008)(6486002)(110136005)(5660300002)(81156014)(2501003)(81166006)(8676002)(7736002)(31686004)(71200400001)(446003)(26005)(305945005)(102836004)(186003)(6246003)(11346002)(2906002)(8936002)(14454004)(6436002)(386003)(6506007)(53546011)(71190400001)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0199;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0lFwVc+xdHug3Nk9rDNiT46mT/3TlZHGolZ9HwsH4LLQkEOTkg+BOBnE5Jr7Vaiod6THQBdRqAKQJtxoWG4KbscN5CVXz8eFxfM0N1T0ucdroXkGfFgtsBh1v1jl7l+G8thDpJ+ppiVlMDtbDPIhJFri8AIng4cXAb8XHd4dltDexu2PNG2t7qE2mTYH3s6cxnBLIX/AqBKTEC1jXU/9MIyesY5itiXJZTbDphq9tFGbLDxUxjLRQL1Lwl33dpCe6/hBYU+GcgxmcctKNbO949/YI4eAv6qhMv40guY76YHs+dA+V7Q6OCXSdFkfAqQ1GWctpTOUaz+q/e0G+VdifaQAfhppbE+jb6fCQO0OXIFnF3ivbWC1RnS8Xk8XhMycisSaTgM81yH3M+pruLbj3mJt/7ugsSb/ndpP0I4qh/I=
Content-ID: <E16C442259BB6F48A2177767D5452E20@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b9b1b5-7a69-44d0-8f45-08d75178d9b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 14:06:18.8959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87X0YMqGra0Y74JKSxrh31jUAz62V4vUbTdKIMXUeiVVypyo6Qd4rLDkRI0URT2oDd+2WI22QC4glk4KZyAQdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZCyq6U/hSa6F5CybmeeNUxSRLqNVhNkS3kbJwPKSBs=;
 b=GVIRVHaILInr2PUzqGXPUTi7mlEHETJTGyR5E0W19ZEYGQ/1UjtX6oQXZH+OgNqlGvs5JAEU+bYEG+ufwO7uvytEYCn+Fk9MOsAknfC33OyNAU+Mf/HjhaNH1sqvym0e6lFs2taNRD/WuFMiPRHBTSagZg6ME1hTuWE0+9Re/lM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Ahzo <Ahzo@tutanota.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xMSA0OjUxIHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gRnJvbTogQWh6
byA8QWh6b0B0dXRhbm90YS5jb20+DQo+IA0KPiBUaGlzIGZpeGVzIGtlcm5lbCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2VzIG9uIHNodXRkb3duOg0KPiBSSVA6IDAwMTA6YnVpbGRfYXVkaW9fb3V0
cHV0LmlzcmEuMCsweDk3LzB4MTEwIFthbWRncHVdDQo+IFJJUDogMDAxMDplbmFibGVfbGlua19k
cCsweDE4Ni8weDMwMCBbYW1kZ3B1XQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWh6byA8QWh6b0B0
dXRhbm90YS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPg0KDQpIYXJyeQ0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGluay5jICAgICAgICAgICAgICAgfCAyICstDQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyB8IDUg
KysrLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsu
Yw0KPiBpbmRleCAxNTJjNTY0YTgzNDQuLjhiNThjZmEzZTk4ZSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYw0KPiBAQCAtMTUxMCw3ICsx
NTEwLDcgQEAgc3RhdGljIGVudW0gZGNfc3RhdHVzIGVuYWJsZV9saW5rX2RwKA0KPiAgDQo+ICAJ
cGlwZV9jdHgtPnN0cmVhbV9yZXMucGl4X2Nsa19wYXJhbXMucmVxdWVzdGVkX3N5bV9jbGsgPQ0K
PiAgCQkJbGlua19zZXR0aW5ncy5saW5rX3JhdGUgKiBMSU5LX1JBVEVfUkVGX0ZSRVFfSU5fS0ha
Ow0KPiAtCWlmICghYXBwbHlfc2VhbWxlc3NfYm9vdF9vcHRpbWl6YXRpb24pDQo+ICsJaWYgKHN0
YXRlLT5jbGtfbWdyICYmICFhcHBseV9zZWFtbGVzc19ib290X29wdGltaXphdGlvbikNCj4gIAkJ
c3RhdGUtPmNsa19tZ3ItPmZ1bmNzLT51cGRhdGVfY2xvY2tzKHN0YXRlLT5jbGtfbWdyLCBzdGF0
ZSwgZmFsc2UpOw0KPiAgDQo+ICAJZHBfZW5hYmxlX2xpbmtfcGh5KA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2Vy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1
ZW5jZXIuYw0KPiBpbmRleCBmOGMxYjRmMWI5ODcuLjhkOGZhMTBiNWQ4NiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVu
Y2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2Ux
MTBfaHdfc2VxdWVuY2VyLmMNCj4gQEAgLTExNjEsOCArMTE2MSw5IEBAIHN0YXRpYyB2b2lkIGJ1
aWxkX2F1ZGlvX291dHB1dCgNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiAtCWlmIChwaXBlX2N0eC0+
c3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUIHx8DQo+IC0JCQlwaXBl
X2N0eC0+c3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUX01TVCkgew0K
PiArCWlmIChzdGF0ZS0+Y2xrX21nciAmJg0KPiArCQkocGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFs
ID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVCB8fA0KPiArCQkJcGlwZV9jdHgtPnN0cmVhbS0+
c2lnbmFsID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVF9NU1QpKSB7DQo+ICAJCWF1ZGlvX291
dHB1dC0+cGxsX2luZm8uZHBfZHRvX3NvdXJjZV9jbG9ja19pbl9raHogPQ0KPiAgCQkJCXN0YXRl
LT5jbGtfbWdyLT5mdW5jcy0+Z2V0X2RwX3JlZl9jbGtfZnJlcXVlbmN5KA0KPiAgCQkJCQkJc3Rh
dGUtPmNsa19tZ3IpOw0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
