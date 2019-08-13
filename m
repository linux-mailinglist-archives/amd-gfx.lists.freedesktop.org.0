Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51C28AD10
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 05:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0D46E615;
	Tue, 13 Aug 2019 03:14:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680085.outbound.protection.outlook.com [40.107.68.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7666E615
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 03:14:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lqxm/qa2/SK7y7MIClil926Nw/uA+18Qg0XRiu3bICEwWaCWIRQ9V1oIAGGCcZNLGbejTAnc51vAajRkOxSF6uzxQPEc1JuowFQV2pGagmNMcZTE7hKAtu+0oRM3qkkBxLCHSEDDIktnO5y1MXKpn1Ta7LrMC1h3wz8EdReMgpHHvuXTpUL4LLGlXP/WsJjI9rR23aAsedVpJ+PV0ITk0U0lhPMwYv5OLX//7CgALYqhwToDZOwAKo9bu6GPyvMaa6Y+0/+lttHRU1A1Q598n69vJnnF3GdlPtTksi+WYEteVesuE/ob4pB7DhaJGWGvvwvsPAzM32wLHxuVJAaNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGeuOsJwgQaUqmJeQH9kePv6glvYywq9E4V6QPCFsL0=;
 b=ChpDawyMtxeuOqPE4zN2aZ+oTD2ER9L1mFOo3bXcjVzEFlPMoCqVP9iqDbXj2joUx5hmrI/7Nrtle9RpsI1Ss/PrjiHZMVatHTUSkdLMZEWpwn6lCA2f4mjjTg4nHG3Yq7gETcqYV7jtovBBiPx+Bc5rWzf/JMwfgkrblZzQJOK02YVhxq5tCruHl15rX8LJftjsWYrdUhFUhpT2K2l2cbuV70ecQ73oloIo2qU7ptLtsbl8Gi+glLda0KTJ8Fo8g0Js37hAAg7JPQRtFi50r9xcKyVDQX9VydggH2csw1tpwgAglacE8JOt2m34XbUaSwQzLQYQ6ZwQZXKCaKJq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4221.namprd12.prod.outlook.com (52.135.48.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Tue, 13 Aug 2019 03:14:04 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.011; Tue, 13 Aug 2019
 03:14:04 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Gui, Jack" <Jack.Gui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Index: AQHVUOceU1u8nxUzI0ChW76FYWBLIab3QSgQgAAEAoCAASMwYA==
Date: Tue, 13 Aug 2019 03:14:04 +0000
Message-ID: <MN2PR12MB3344D64DEF2B3682528BEE67E4D20@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
 <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>
 <MN2PR12MB33441DEDEEB00F8F321F72BBE4D30@MN2PR12MB3344.namprd12.prod.outlook.com>
 <MN2PR12MB35820DB4E84513D7F47606088BD30@MN2PR12MB3582.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB35820DB4E84513D7F47606088BD30@MN2PR12MB3582.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcdeeb7e-3c61-434d-215c-08d71f9c4bb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4221; 
x-ms-traffictypediagnostic: MN2PR12MB4221:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB422186C0B1C17E164A35EB2FE4D20@MN2PR12MB4221.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(13464003)(189003)(6306002)(6116002)(102836004)(53546011)(25786009)(3846002)(86362001)(55016002)(6506007)(9686003)(256004)(74316002)(7696005)(7736002)(33656002)(26005)(76176011)(53936002)(305945005)(186003)(99286004)(71200400001)(71190400001)(66066001)(14444005)(229853002)(966005)(2501003)(5660300002)(52536014)(446003)(81156014)(110136005)(81166006)(6246003)(8676002)(11346002)(478600001)(6436002)(486006)(66946007)(66476007)(66556008)(64756008)(476003)(76116006)(66446008)(316002)(2906002)(14454004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4221;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g2b1ruzsW5V9KUSrrfg0mWLDHaxXUEZKOEqOJE6C5cvvw01iItDS7MFonMQtsiqECXgOr63hXp3EPIHI/SixRBSlBuv93y/syASXblB+WcgGRgp+oFC8Y3s9pXT3hC++hqsRZGSpIiGbr+lxSqxqdI98xlnHAtfQMIcAa4IUlVmEqnMOrXGpfiPnXrC/GoiYSMjH4cmbVBunQtlQ6ntq5Vo1nfy5Hb9V3ETmN8+VHvIe1vC4aTte968GG2oBJvJD5Fo0Tf6TAhyPQuF7QNHpHOOMfMdBU8kIyDb/ehsaYK0aU02cYBh1U9X26hUwvAIdUuhcn/UrZmi9dvRW4pptLPMaMu+qLK7Wx8h0XI4Q0dWsE3s9Q7cFvyjpWzKE/OXilLU1DZlyLu4OI2bkfVQeRU+2zL3tctRL3nagc9SbrpY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdeeb7e-3c61-434d-215c-08d71f9c4bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 03:14:04.1457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQROiD+AvADzS3zGV9gOOxZFdxGKzc8zfNoMdVWfS60aIwDd79PnERI6039bSdHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGeuOsJwgQaUqmJeQH9kePv6glvYywq9E4V6QPCFsL0=;
 b=rMSy6j8A6MrlaR/S3lioVKimBk1Y8nHfA9zLku2bJalLku8Qs/9UD95E8tk8i/E89oBRmqKdyVm/wjnmirKrP+0nWq2DQSmr8TocqmovvVjFu4FDhgA5i+uhVsvWeQyax5ZNg5H85QJzuF3TRaBZturzt5o7K2jouX2kXh1h/Zw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

T0ssIEkgc2VlLiBUaGF0IHdpbGwgYmUgZmluZS4NCg0KUmVnYXJkcywNCkV2YW4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWksIEphY2sgPEphY2suR3VpQGFtZC5j
b20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAyMDE5IDU6NTEgUE0NCj4gVG86IFF1YW4s
IEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCAyLzJdIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQNCj4gYXJj
dHVydXNfaXNfZHBtX3J1bm5pbmcgZnVuY3Rpb24gZm9yIGFyY3R1cnVzDQo+IA0KPiBIaSBFdmFu
LA0KPiANCj4gQWxsIHN1cHBvcnRlZCBmZWF0dXJlIGNhbiBiZSBzZXQgdGhlcmUsIEFueW9uZSBv
ZiB0aGVzZSBmZWF0dXJlcyBpcyBydW5uaW5nLA0KPiB3ZSBjYW4ganVkZ2UgZHBtIGlzIHJ1bm5p
bmcuDQo+IA0KPiBCUiwNCj4gSmFjayBHdWkNCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KPiBTZW50OiBNb25k
YXksIEF1Z3VzdCAxMiwgMjAxOSA1OjM5IFBNDQo+IFRvOiBHdWksIEphY2sgPEphY2suR3VpQGFt
ZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR3VpLCBKYWNrIDxK
YWNrLkd1aUBhbWQuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDIvMl0gZHJtL2FtZC9wb3dl
cnBsYXk6IGFkZA0KPiBhcmN0dXJ1c19pc19kcG1fcnVubmluZyBmdW5jdGlvbiBmb3IgYXJjdHVy
dXMNCj4gDQo+IFBsZWFzZSBzZXQgRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9NQVNLIHwNCj4gRkVB
VFVSRV9EUE1fR0ZYQ0xLX01BU0sgb25seS4gRm9yIG5vdywgb25seSB0aGVzZSB0d28gYXJlIGVu
YWJsZWQNCj4gb24gYXJjdHVydXMuDQo+IA0KPiBXaXRoIHRoYXQgZml4ZWQsIHRoZSBwYXRjaCBp
cyByZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+IENoZW5nbWluZyBHdWkNCj4g
PiBTZW50OiBNb25kYXksIEF1Z3VzdCAxMiwgMjAxOSA0OjIyIFBNDQo+ID4gVG86IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEd1aSwgSmFjayA8SmFjay5HdWlAYW1kLmNv
bT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kL3Bvd2VycGxheTogYWRkIGFyY3R1
cnVzX2lzX2RwbV9ydW5uaW5nDQo+ID4gZnVuY3Rpb24gZm9yIGFyY3R1cnVzDQo+ID4NCj4gPiBh
ZGQgYXJjdHVydXNfaXNfZHBtX3J1bm5pbmcgZnVuY3Rpb24NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoZW5nbWluZyBHdWkgPEphY2suR3VpQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgMjENCj4gPiArKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1
c19wcHQuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0
LmMNCj4gPiBpbmRleCAwM2NlODcxLi45MTA3YmViIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMNCj4gPiBAQCAtNTEsNiArNTEsMTUg
QEANCj4gPiAgI2RlZmluZSBTTVVfRkVBVFVSRVNfSElHSF9NQVNLICAgICAgIDB4RkZGRkZGRkYw
MDAwMDAwMA0KPiA+ICAjZGVmaW5lIFNNVV9GRUFUVVJFU19ISUdIX1NISUZUICAgICAgMzINCj4g
Pg0KPiA+ICsjZGVmaW5lIFNNQ19EUE1fRkVBVFVSRSAoIFwNCj4gPiArCUZFQVRVUkVfRFBNX1BS
RUZFVENIRVJfTUFTSyB8IFwNCj4gPiArCUZFQVRVUkVfRFBNX0dGWENMS19NQVNLIHwgXA0KPiA+
ICsJRkVBVFVSRV9EUE1fVUNMS19NQVNLIHwgXA0KPiA+ICsJRkVBVFVSRV9EUE1fU09DQ0xLX01B
U0sgfCBcDQo+ID4gKwlGRUFUVVJFX0RQTV9NUDBDTEtfTUFTSyB8IFwNCj4gPiArCUZFQVRVUkVf
RFBNX0ZDTEtfTUFTSyB8IFwNCj4gPiArCUZFQVRVUkVfRFBNX1hHTUlfTUFTSykNCj4gPiArDQo+
ID4gIC8qIHBvc3NpYmxlIGZyZXF1ZW5jeSBkcmlmdCAoMU1oeikgKi8NCj4gPiAgI2RlZmluZSBF
UFNJTE9OCQkJCTENCj4gPg0KPiA+IEBAIC0xODczLDYgKzE4ODIsMTcgQEAgc3RhdGljIHZvaWQg
YXJjdHVydXNfZHVtcF9wcHRhYmxlKHN0cnVjdA0KPiA+IHNtdV9jb250ZXh0ICpzbXUpDQo+ID4N
Cj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBib29sIGFyY3R1cnVzX2lzX2RwbV9ydW5uaW5nKHN0
cnVjdCBzbXVfY29udGV4dCAqc211KSB7DQo+ID4gKwlpbnQgcmV0ID0gMDsNCj4gPiArCXVpbnQz
Ml90IGZlYXR1cmVfbWFza1syXTsNCj4gPiArCXVuc2lnbmVkIGxvbmcgZmVhdHVyZV9lbmFibGVk
Ow0KPiA+ICsJcmV0ID0gc211X2ZlYXR1cmVfZ2V0X2VuYWJsZWRfbWFzayhzbXUsIGZlYXR1cmVf
bWFzaywgMik7DQo+ID4gKwlmZWF0dXJlX2VuYWJsZWQgPSAodW5zaWduZWQgbG9uZykoKHVpbnQ2
NF90KWZlYXR1cmVfbWFza1swXSB8DQo+ID4gKwkJCSAgICgodWludDY0X3QpZmVhdHVyZV9tYXNr
WzFdIDw8IDMyKSk7DQo+ID4gKwlyZXR1cm4gISEoZmVhdHVyZV9lbmFibGVkICYgU01DX0RQTV9G
RUFUVVJFKTsgfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNz
IGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsNCj4gPiAgCS8qIHRyYW5zbGF0ZSBzbXUgaW5kZXggaW50
byBhcmN0dXJ1cyBzcGVjaWZpYyBpbmRleCAqLw0KPiA+ICAJLmdldF9zbXVfbXNnX2luZGV4ID0g
YXJjdHVydXNfZ2V0X3NtdV9tc2dfaW5kZXgsIEBAIC0xOTEwLDYNCj4gPiArMTkzMCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBhcmN0dXJ1c19wcHRfZnVuY3MgPSB7DQo+
ID4gIAkvKiBkZWJ1ZyAoaW50ZXJuYWwgdXNlZCkgKi8NCj4gPiAgCS5kdW1wX3BwdGFibGUgPSBh
cmN0dXJ1c19kdW1wX3BwdGFibGUsDQo+ID4gIAkuZ2V0X3Bvd2VyX2xpbWl0ID0gYXJjdHVydXNf
Z2V0X3Bvd2VyX2xpbWl0LA0KPiA+ICsJLmlzX2RwbV9ydW5uaW5nID0gYXJjdHVydXNfaXNfZHBt
X3J1bm5pbmcsDQo+ID4gIH07DQo+ID4NCj4gPiAgdm9pZCBhcmN0dXJ1c19zZXRfcHB0X2Z1bmNz
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KPiA+IC0tDQo+ID4gMi43LjQNCj4gPg0KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QNCj4gPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
