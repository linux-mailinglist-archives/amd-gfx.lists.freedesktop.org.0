Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B091A350A
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Apr 2020 15:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C5E89FA9;
	Thu,  9 Apr 2020 13:42:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0975E89FA9
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Apr 2020 13:42:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EonMpOjgA6tWd97+czIRQwEtNEAKmf0YrUfaX3oII7+TYyD8LD1oqENrKEtwl+hI0cSeA6TVXKBAyCVZIhOJH2iKI1o5h/OmXvCwwAfmm+qI2KL0glEN/1qUQRmtZy4XWNG5qcLpHRWoKzXH2nmlmoLtY6VXJJu81hcKx14dn2T5vrltqvgP0ZkupIAbCGmB/l0JMmNSkX5ERSweSkbSUtifrJeRDqNDlOWAvRNu/WHhPLrrCddlWOO43cm/UZTa4k1zQbTAzUev70SUVTjOrLQN0YUWVVoWEpmHn2SAeg/hknyxU1Ka5rESB2SaRCHE1Y3DO4VIUv0e8BnWiJuJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoXa5qgjItcl9XrFSzYU0RmiasGpc1pakkeNsTtCTgI=;
 b=EBoWd6U2+IhKRlZ8c6pMiL56pGHFrXsh/YqukdZnVaUV2Dq7Ht+j2Awh9rI9w31ng8iOqWYfx30dv/Xp1yK8AAenWBOmMJjpuIdUclLDpB4eEgYrOKE3TntyWzrvIr49/6Jr91UmrVWQK+5+zd07m4h8zO1vyUKNlbZspMdEJN5sOV1E8CI7Qna7O4zyhCNLjHwM+lC8lVQ4vL9Ywxh8qtOGpshJVVZEMTN09G6q0aEYYRswVuRuPzOgcDSyD2xTJQYZ1uoTO7U3uzl1TimmIyxoM6XmqpV05Oa7wbS03w2fXEgib8b/EV4AXwGip/HSK25GjhKyjWJAUIqzEA5I6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoXa5qgjItcl9XrFSzYU0RmiasGpc1pakkeNsTtCTgI=;
 b=hVd5bjBYeseV0pPqLoGtv/NIDoYlj8smAzscJmltPyRmwFcRHo3gM4/wAd4Ol7XO5BCG+MY8TzXPTls4EgQOl6kMoT7ocuyM5eDp1z2DWU24swQG+tmdVOZbIGe/T9G8BAW8jeUDVoQY3LtslUFerv5PEBJ5YqXKgDtmlZvL/Qc=
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (2603:10b6:208:c9::27)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.16; Thu, 9 Apr
 2020 13:42:46 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::58b5:b730:f260:a425]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::58b5:b730:f260:a425%7]) with mapi id 15.20.2878.017; Thu, 9 Apr 2020
 13:42:46 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>
Subject: RE: [PATCH] drm/amdgpu: restrict debugfs register access under SR-IOV
Thread-Topic: [PATCH] drm/amdgpu: restrict debugfs register access under SR-IOV
Thread-Index: AQHWDjRStbfUmSP+JkSoUB7J4/kP4qhwvAuAgAAQ2XA=
Date: Thu, 9 Apr 2020 13:42:46 +0000
Message-ID: <MN2PR12MB3039936F6AC7DED432B700E0E5C10@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <20200409060126.30038-1-yttao@amd.com>
 <13015ab1-3613-4bed-2a04-a83cbc7b64d4@amd.com>
In-Reply-To: <13015ab1-3613-4bed-2a04-a83cbc7b64d4@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 30f74d44-c031-4370-6007-08d7dc8be33d
x-ms-traffictypediagnostic: MN2PR12MB3792:|MN2PR12MB3792:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3792600B6D111AB873A8D44FE5C10@MN2PR12MB3792.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0368E78B5B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3039.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(71200400001)(478600001)(110136005)(81156014)(8676002)(316002)(6636002)(8936002)(2906002)(86362001)(26005)(186003)(7696005)(33656002)(53546011)(66446008)(5660300002)(64756008)(66556008)(66476007)(66946007)(9686003)(30864003)(76116006)(52536014)(81166007)(4326008)(55016002)(6506007);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+pdiDDvFof7E6NbJ7yZxVtXMvaqH5NPsHIGAjVXHaUVDLL5ALSkvm0B0WMjDZAyFH9N7kkRiK/U5CFAkN3iHYTzTgnsdRRkoCCkGhCpwMgpKewQO40JMEHPa6z7N0uAgbsl3k7AqAbVoBeXrCL9EcXV7Rc4FFpi64XPus4nuoQwzVGA8wUMeR84FP5/w/ppipTo2v72YUgbY7kwoFIBWJ1xjlzqmoYcP2xG04su4HX0GYMzXWRMxniaelpPXMBCHQGpUy8ZhCpec9Si9Xmmj1F7yOVYfrHoCGC8VvW4chOcDO3kcdrzeT86U8MAEXWpx4NQ9JfZBSHkhapi7Gvs0BioQrhu8h9EstdyyJI20ndi+evys+5/J1TRsGejLeaeLiNbJ2aMQXH3OtxmrYP8/sPCU3kvvQwkP6dbO4EX22tSIAIeBZgLzkoHSm9xpbuh
x-ms-exchange-antispam-messagedata: FJiHlQCxXv7yoVsYaG1FNbHWVgNJ9DC3TlWOVkRNk1q1Pe++ciFoVJcmK7KQcI+aq8/LGeAJ/5cfhp17VNsPikRfVMEow4LubNDD0IjG98DknFOhccBPdSii3RyY0BwbcFUftX9yLcQ3JZlffM8Xvw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f74d44-c031-4370-6007-08d7dc8be33d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2020 13:42:46.5580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MX45Y5EwjqxhhZKX4gupPFjlSHymjsIFgKE1cUb9u/k3zkyD8qq0UEVyC42nSZeY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgIENocmlzdGlhbg0KDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIHJldmlldy4gSSB3aWxsIHN1
Ym1pdCBvbmUgbmV3IHBhdGNoIGFjY29yZGluZyB0byB5b3VyIHN1Z2dlc3Rpb24uDQoNCg0KQmVz
dCBSZWdhcmRzDQpZaW50aWFuIFRhbw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IA0KU2VudDogMjAy
MOW5tDTmnIg55pelIDIwOjQyDQpUbzogVGFvLCBZaW50aWFuIDxZaW50aWFuLlRhb0BhbWQuY29t
PjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgRGVuZywg
RW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmVzdHJpY3QgZGVidWdmcyBy
ZWdpc3RlciBhY2Nlc3MgdW5kZXIgU1ItSU9WDQoNCkFtIDA5LjA0LjIwIHVtIDA4OjAxIHNjaHJp
ZWIgWWludGlhbiBUYW86DQo+IFVuZGVyIGJhcmUgbWV0YWwsIHRoZXJlIGlzIG5vIG1vcmUgZWxz
ZSB0byB0YWtlIGNhcmUgb2YgdGhlIEdQVSANCj4gcmVnaXN0ZXIgYWNjZXNzIHRocm91Z2ggTU1J
Ty4NCj4gVW5kZXIgVmlydHVhbGl6YXRpb24sIHRvIGFjY2VzcyBHUFUgcmVnaXN0ZXIgaXMgaW1w
bGVtZW50ZWQgdGhyb3VnaCANCj4gS0lRIGR1cmluZyBydW4tdGltZSBkdWUgdG8gd29ybGQtc3dp
dGNoLg0KPg0KPiBUaGVyZWZvcmUsIHVuZGVyIFNSLUlPViB1c2VyIGNhbiBvbmx5IGFjY2VzcyBk
ZWJ1Z2ZzIHRvIHIvdyBHUFUgDQo+IHJlZ2lzdGVycyB3aGVuIG1lZXRzIGFsbCB0aHJlZSBjb25k
aXRpb25zIGJlbG93Lg0KPiAtIGFtZGdwdV9ncHVfcmVjb3Zlcnk9MA0KPiAtIFREUiBoYXBwZW5l
ZA0KPiAtIGluX2dwdV9yZXNldD0wDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlpbnRpYW4gVGFvIDx5
dHRhb0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGVidWdmcy5jIHwgODMgKysrKysrKysrKysrKysrKysrKystDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jICAgICB8ICA3ICstDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYyAgICB8IDIzICsrKysrKw0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmggICAgfCAgNyArKw0KPiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMTE0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIA0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMNCj4gaW5kZXggYzBmOWE2
NTFkYzA2Li40Zjk3ODBhYWJmNWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RlYnVnZnMuYw0KPiBAQCAtMTUyLDExICsxNTIsMTcgQEAgc3RhdGljIGludCAg
YW1kZ3B1X2RlYnVnZnNfcHJvY2Vzc19yZWdfb3AoYm9vbCByZWFkLCBzdHJ1Y3QgZmlsZSAqZiwN
Cj4gICAJaWYgKHIgPCAwKQ0KPiAgIAkJcmV0dXJuIHI7DQo+ICAgDQo+ICsJaWYgKCFhbWRncHVf
dmlydF9jYW5fYWNjZXNzX2RlYnVnZnMoYWRldikpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiAr
CWVsc2UNCj4gKwkJYW1kZ3B1X3ZpcnRfZW5hYmxlX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpOw0KPiAr
DQoNCkl0IHdvdWxkIGJlIGJldHRlciB0byBtZXJnZSB0aGVzZSB0d28gZnVuY3Rpb25zIHRvZ2V0
aGVyLg0KDQpFLmcuIHRoYXQgYW1kZ3B1X3ZpcnRfZW5hYmxlX2FjY2Vzc19kZWJ1Z2ZzKCkgcmV0
dXJucyBhbiBlcnJvciBpZiB3ZSBjYW4ndCBhbGxvdyB0aGlzLg0KDQpBbmQgLUVJTlZBTCBpcyBt
YXliZSBub3QgdGhlIHJpZ2h0IHRoaW5nIGhlcmUsIHNpbmNlIHRoaXMgaXMgbm90IGNhdXNlZCBi
eSBhbiBpbnZhbGlkIHZhbHVlLg0KDQpNYXliZSB1c2UgLUVQRVJNIGluc3RlYWQuDQoNClJlZ2Fy
ZHMsDQpDaHJpc3RpYW4uDQoNCj4gICAJaWYgKHVzZV9iYW5rKSB7DQo+ICAgCQlpZiAoKHNoX2Jh
bmsgIT0gMHhGRkZGRkZGRiAmJiBzaF9iYW5rID49IGFkZXYtPmdmeC5jb25maWcubWF4X3NoX3Bl
cl9zZSkgfHwNCj4gICAJCSAgICAoc2VfYmFuayAhPSAweEZGRkZGRkZGICYmIHNlX2JhbmsgPj0g
YWRldi0+Z2Z4LmNvbmZpZy5tYXhfc2hhZGVyX2VuZ2luZXMpKSB7DQo+ICAgCQkJcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeShhZGV2LT5kZGV2LT5kZXYpOw0KPiAgIAkJCXBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKGFkZXYtPmRkZXYtPmRldik7DQo+ICsJCQlhbWRncHVfdmlydF9kaXNhYmxl
X2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpOw0KPiAgIAkJCXJldHVybiAtRUlOVkFMOw0KPiAgIAkJfQ0K
PiAgIAkJbXV0ZXhfbG9jaygmYWRldi0+Z3JibV9pZHhfbXV0ZXgpOw0KPiBAQCAtMjA3LDYgKzIx
Myw3IEBAIHN0YXRpYyBpbnQgIGFtZGdwdV9kZWJ1Z2ZzX3Byb2Nlc3NfcmVnX29wKGJvb2wgcmVh
ZCwgc3RydWN0IGZpbGUgKmYsDQo+ICAgCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koYWRldi0+
ZGRldi0+ZGV2KTsNCj4gICAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYWRldi0+ZGRldi0+
ZGV2KTsNCj4gICANCj4gKwlhbWRncHVfdmlydF9kaXNhYmxlX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYp
Ow0KPiAgIAlyZXR1cm4gcmVzdWx0Ow0KPiAgIH0NCj4gICANCj4gQEAgLTI1NSw2ICsyNjIsMTEg
QEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2RlYnVnZnNfcmVnc19wY2llX3JlYWQoc3RydWN0IGZp
bGUgKmYsIGNoYXIgX191c2VyICpidWYsDQo+ICAgCWlmIChyIDwgMCkNCj4gICAJCXJldHVybiBy
Ow0KPiAgIA0KPiArCWlmICghYW1kZ3B1X3ZpcnRfY2FuX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpKQ0K
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwllbHNlDQo+ICsJCWFtZGdwdV92aXJ0X2VuYWJsZV9h
Y2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gKw0KPiAgIAl3aGlsZSAoc2l6ZSkgew0KPiAgIAkJdWlu
dDMyX3QgdmFsdWU7DQo+ICAgDQo+IEBAIC0yNjMsNiArMjc1LDcgQEAgc3RhdGljIHNzaXplX3Qg
YW1kZ3B1X2RlYnVnZnNfcmVnc19wY2llX3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2Vy
ICpidWYsDQo+ICAgCQlpZiAocikgew0KPiAgIAkJCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3ko
YWRldi0+ZGRldi0+ZGV2KTsNCj4gICAJCQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChhZGV2
LT5kZGV2LT5kZXYpOw0KPiArCQkJYW1kZ3B1X3ZpcnRfZGlzYWJsZV9hY2Nlc3NfZGVidWdmcyhh
ZGV2KTsNCj4gICAJCQlyZXR1cm4gcjsNCj4gICAJCX0NCj4gICANCj4gQEAgLTI3NSw2ICsyODgs
NyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfZGVidWdmc19yZWdzX3BjaWVfcmVhZChzdHJ1Y3Qg
ZmlsZSAqZiwgY2hhciBfX3VzZXIgKmJ1ZiwNCj4gICAJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVz
eShhZGV2LT5kZGV2LT5kZXYpOw0KPiAgIAlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChhZGV2
LT5kZGV2LT5kZXYpOw0KPiAgIA0KPiArCWFtZGdwdV92aXJ0X2Rpc2FibGVfYWNjZXNzX2RlYnVn
ZnMoYWRldik7DQo+ICAgCXJldHVybiByZXN1bHQ7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtMzA0LDYg
KzMxOCwxMSBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfZGVidWdmc19yZWdzX3BjaWVfd3JpdGUo
c3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyDQo+ICAgCWlmIChyIDwgMCkNCj4gICAJ
CXJldHVybiByOw0KPiAgIA0KPiArCWlmICghYW1kZ3B1X3ZpcnRfY2FuX2FjY2Vzc19kZWJ1Z2Zz
KGFkZXYpKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwllbHNlDQo+ICsJCWFtZGdwdV92aXJ0
X2VuYWJsZV9hY2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gKw0KPiAgIAl3aGlsZSAoc2l6ZSkgew0K
PiAgIAkJdWludDMyX3QgdmFsdWU7DQo+ICAgDQo+IEBAIC0zMTEsNiArMzMwLDcgQEAgc3RhdGlj
IHNzaXplX3QgYW1kZ3B1X2RlYnVnZnNfcmVnc19wY2llX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBj
b25zdCBjaGFyIF9fdXNlcg0KPiAgIAkJaWYgKHIpIHsNCj4gICAJCQlwbV9ydW50aW1lX21hcmtf
bGFzdF9idXN5KGFkZXYtPmRkZXYtPmRldik7DQo+ICAgCQkJcG1fcnVudGltZV9wdXRfYXV0b3N1
c3BlbmQoYWRldi0+ZGRldi0+ZGV2KTsNCj4gKwkJCWFtZGdwdV92aXJ0X2Rpc2FibGVfYWNjZXNz
X2RlYnVnZnMoYWRldik7DQo+ICAgCQkJcmV0dXJuIHI7DQo+ICAgCQl9DQo+ICAgDQo+IEBAIC0z
MjUsNiArMzQ1LDcgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2RlYnVnZnNfcmVnc19wY2llX3dy
aXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXNlcg0KPiAgIAlwbV9ydW50aW1lX21h
cmtfbGFzdF9idXN5KGFkZXYtPmRkZXYtPmRldik7DQo+ICAgCXBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKGFkZXYtPmRkZXYtPmRldik7DQo+ICAgDQo+ICsJYW1kZ3B1X3ZpcnRfZGlzYWJsZV9h
Y2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gICAJcmV0dXJuIHJlc3VsdDsNCj4gICB9DQo+ICAgDQo+
IEBAIC0zNTQsNiArMzc1LDExIEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3Nf
ZGlkdF9yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLA0KPiAgIAlpZiAociA8
IDApDQo+ICAgCQlyZXR1cm4gcjsNCj4gICANCj4gKwlpZiAoIWFtZGdwdV92aXJ0X2Nhbl9hY2Nl
c3NfZGVidWdmcyhhZGV2KSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJZWxzZQ0KPiArCQlh
bWRncHVfdmlydF9lbmFibGVfYWNjZXNzX2RlYnVnZnMoYWRldik7DQo+ICsNCj4gICAJd2hpbGUg
KHNpemUpIHsNCj4gICAJCXVpbnQzMl90IHZhbHVlOw0KPiAgIA0KPiBAQCAtMzYyLDYgKzM4OCw3
IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3NfZGlkdF9yZWFkKHN0cnVjdCBm
aWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLA0KPiAgIAkJaWYgKHIpIHsNCj4gICAJCQlwbV9ydW50
aW1lX21hcmtfbGFzdF9idXN5KGFkZXYtPmRkZXYtPmRldik7DQo+ICAgCQkJcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoYWRldi0+ZGRldi0+ZGV2KTsNCj4gKwkJCWFtZGdwdV92aXJ0X2Rpc2Fi
bGVfYWNjZXNzX2RlYnVnZnMoYWRldik7DQo+ICAgCQkJcmV0dXJuIHI7DQo+ICAgCQl9DQo+ICAg
DQo+IEBAIC0zNzQsNiArNDAxLDcgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2RlYnVnZnNfcmVn
c19kaWR0X3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2VyICpidWYsDQo+ICAgCXBtX3J1
bnRpbWVfbWFya19sYXN0X2J1c3koYWRldi0+ZGRldi0+ZGV2KTsNCj4gICAJcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoYWRldi0+ZGRldi0+ZGV2KTsNCj4gICANCj4gKwlhbWRncHVfdmlydF9k
aXNhYmxlX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpOw0KPiAgIAlyZXR1cm4gcmVzdWx0Ow0KPiAgIH0N
Cj4gICANCj4gQEAgLTQwMyw2ICs0MzEsMTEgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2RlYnVn
ZnNfcmVnc19kaWR0X3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXNlcg0KPiAg
IAlpZiAociA8IDApDQo+ICAgCQlyZXR1cm4gcjsNCj4gICANCj4gKwlpZiAoIWFtZGdwdV92aXJ0
X2Nhbl9hY2Nlc3NfZGVidWdmcyhhZGV2KSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJZWxz
ZQ0KPiArCQlhbWRncHVfdmlydF9lbmFibGVfYWNjZXNzX2RlYnVnZnMoYWRldik7DQo+ICsNCj4g
ICAJd2hpbGUgKHNpemUpIHsNCj4gICAJCXVpbnQzMl90IHZhbHVlOw0KPiAgIA0KPiBAQCAtNDEw
LDYgKzQ0Myw3IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3NfZGlkdF93cml0
ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXINCj4gICAJCWlmIChyKSB7DQo+ICAg
CQkJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShhZGV2LT5kZGV2LT5kZXYpOw0KPiAgIAkJCXBt
X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGFkZXYtPmRkZXYtPmRldik7DQo+ICsJCQlhbWRncHVf
dmlydF9kaXNhYmxlX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpOw0KPiAgIAkJCXJldHVybiByOw0KPiAg
IAkJfQ0KPiAgIA0KPiBAQCAtNDI0LDYgKzQ1OCw3IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9k
ZWJ1Z2ZzX3JlZ3NfZGlkdF93cml0ZShzdHJ1Y3QgZmlsZSAqZiwgY29uc3QgY2hhciBfX3VzZXIN
Cj4gICAJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShhZGV2LT5kZGV2LT5kZXYpOw0KPiAgIAlw
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChhZGV2LT5kZGV2LT5kZXYpOw0KPiAgIA0KPiArCWFt
ZGdwdV92aXJ0X2Rpc2FibGVfYWNjZXNzX2RlYnVnZnMoYWRldik7DQo+ICAgCXJldHVybiByZXN1
bHQ7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtNDUzLDYgKzQ4OCwxMSBAQCBzdGF0aWMgc3NpemVfdCBh
bWRncHVfZGVidWdmc19yZWdzX3NtY19yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAq
YnVmLA0KPiAgIAlpZiAociA8IDApDQo+ICAgCQlyZXR1cm4gcjsNCj4gICANCj4gKwlpZiAoIWFt
ZGdwdV92aXJ0X2Nhbl9hY2Nlc3NfZGVidWdmcyhhZGV2KSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7
DQo+ICsJZWxzZQ0KPiArCQlhbWRncHVfdmlydF9lbmFibGVfYWNjZXNzX2RlYnVnZnMoYWRldik7
DQo+ICsNCj4gICAJd2hpbGUgKHNpemUpIHsNCj4gICAJCXVpbnQzMl90IHZhbHVlOw0KPiAgIA0K
PiBAQCAtNDYxLDYgKzUwMSw3IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3Nf
c21jX3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2VyICpidWYsDQo+ICAgCQlpZiAocikg
ew0KPiAgIAkJCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koYWRldi0+ZGRldi0+ZGV2KTsNCj4g
ICAJCQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChhZGV2LT5kZGV2LT5kZXYpOw0KPiArCQkJ
YW1kZ3B1X3ZpcnRfZGlzYWJsZV9hY2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gICAJCQlyZXR1cm4g
cjsNCj4gICAJCX0NCj4gICANCj4gQEAgLTQ3Myw2ICs1MTQsNyBAQCBzdGF0aWMgc3NpemVfdCBh
bWRncHVfZGVidWdmc19yZWdzX3NtY19yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAq
YnVmLA0KPiAgIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGFkZXYtPmRkZXYtPmRldik7DQo+
ICAgCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGFkZXYtPmRkZXYtPmRldik7DQo+ICAgDQo+
ICsJYW1kZ3B1X3ZpcnRfZGlzYWJsZV9hY2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gICAJcmV0dXJu
IHJlc3VsdDsNCj4gICB9DQo+ICAgDQo+IEBAIC01MDIsNiArNTQ0LDExIEBAIHN0YXRpYyBzc2l6
ZV90IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3Nfc21jX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBj
aGFyIF9fdXNlciAqDQo+ICAgCWlmIChyIDwgMCkNCj4gICAJCXJldHVybiByOw0KPiAgIA0KPiAr
CWlmICghYW1kZ3B1X3ZpcnRfY2FuX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpKQ0KPiArCQlyZXR1cm4g
LUVJTlZBTDsNCj4gKwllbHNlDQo+ICsJCWFtZGdwdV92aXJ0X2VuYWJsZV9hY2Nlc3NfZGVidWdm
cyhhZGV2KTsNCj4gKw0KPiAgIAl3aGlsZSAoc2l6ZSkgew0KPiAgIAkJdWludDMyX3QgdmFsdWU7
DQo+ICAgDQo+IEBAIC01MDksNiArNTU2LDcgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2RlYnVn
ZnNfcmVnc19zbWNfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyICoNCj4g
ICAJCWlmIChyKSB7DQo+ICAgCQkJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShhZGV2LT5kZGV2
LT5kZXYpOw0KPiAgIAkJCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGFkZXYtPmRkZXYtPmRl
dik7DQo+ICsJCQlhbWRncHVfdmlydF9kaXNhYmxlX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpOw0KPiAg
IAkJCXJldHVybiByOw0KPiAgIAkJfQ0KPiAgIA0KPiBAQCAtNTIzLDYgKzU3MSw3IEBAIHN0YXRp
YyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3Nfc21jX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBj
b25zdCBjaGFyIF9fdXNlciAqDQo+ICAgCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koYWRldi0+
ZGRldi0+ZGV2KTsNCj4gICAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYWRldi0+ZGRldi0+
ZGV2KTsNCj4gICANCj4gKwlhbWRncHVfdmlydF9kaXNhYmxlX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYp
Ow0KPiAgIAlyZXR1cm4gcmVzdWx0Ow0KPiAgIH0NCj4gICANCj4gQEAgLTY1MSwxNiArNzAwLDI1
IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3NlbnNvcl9yZWFkKHN0cnVjdCBmaWxl
ICpmLCBjaGFyIF9fdXNlciAqYnVmLA0KPiAgIAlpZiAociA8IDApDQo+ICAgCQlyZXR1cm4gcjsN
Cj4gICANCj4gKwlpZiAoIWFtZGdwdV92aXJ0X2Nhbl9hY2Nlc3NfZGVidWdmcyhhZGV2KSkNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJZWxzZQ0KPiArCQlhbWRncHVfdmlydF9lbmFibGVfYWNj
ZXNzX2RlYnVnZnMoYWRldik7DQo+ICsNCj4gICAJciA9IGFtZGdwdV9kcG1fcmVhZF9zZW5zb3Io
YWRldiwgaWR4LCAmdmFsdWVzWzBdLCAmdmFsdWVzaXplKTsNCj4gICANCj4gICAJcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeShhZGV2LT5kZGV2LT5kZXYpOw0KPiAgIAlwbV9ydW50aW1lX3B1dF9h
dXRvc3VzcGVuZChhZGV2LT5kZGV2LT5kZXYpOw0KPiAgIA0KPiAtCWlmIChyKQ0KPiArCWlmIChy
KSB7DQo+ICsJCWFtZGdwdV92aXJ0X2Rpc2FibGVfYWNjZXNzX2RlYnVnZnMoYWRldik7DQo+ICAg
CQlyZXR1cm4gcjsNCj4gKwl9DQo+ICAgDQo+IC0JaWYgKHNpemUgPiB2YWx1ZXNpemUpDQo+ICsJ
aWYgKHNpemUgPiB2YWx1ZXNpemUpIHsNCj4gKwkJYW1kZ3B1X3ZpcnRfZGlzYWJsZV9hY2Nlc3Nf
ZGVidWdmcyhhZGV2KTsNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gICANCj4gICAJ
b3V0c2l6ZSA9IDA7DQo+ICAgCXggPSAwOw0KPiBAQCAtNjczLDYgKzczMSw3IEBAIHN0YXRpYyBz
c2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX3NlbnNvcl9yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9f
dXNlciAqYnVmLA0KPiAgIAkJfQ0KPiAgIAl9DQo+ICAgDQo+ICsJYW1kZ3B1X3ZpcnRfZGlzYWJs
ZV9hY2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gICAJcmV0dXJuICFyID8gb3V0c2l6ZSA6IHI7DQo+
ICAgfQ0KPiAgIA0KPiBAQCAtNzIwLDYgKzc3OSwxMSBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVf
ZGVidWdmc193YXZlX3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2VyICpidWYsDQo+ICAg
CWlmIChyIDwgMCkNCj4gICAJCXJldHVybiByOw0KPiAgIA0KPiArCWlmICghYW1kZ3B1X3ZpcnRf
Y2FuX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwllbHNl
DQo+ICsJCWFtZGdwdV92aXJ0X2VuYWJsZV9hY2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gKw0KPiAg
IAkvKiBzd2l0Y2ggdG8gdGhlIHNwZWNpZmljIHNlL3NoL2N1ICovDQo+ICAgCW11dGV4X2xvY2so
JmFkZXYtPmdyYm1faWR4X211dGV4KTsNCj4gICAJYW1kZ3B1X2dmeF9zZWxlY3Rfc2Vfc2goYWRl
diwgc2UsIHNoLCBjdSk7IEBAIC03MzQsMTYgKzc5OCwyMCBAQCANCj4gc3RhdGljIHNzaXplX3Qg
YW1kZ3B1X2RlYnVnZnNfd2F2ZV9yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAqYnVm
LA0KPiAgIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGFkZXYtPmRkZXYtPmRldik7DQo+ICAg
CXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGFkZXYtPmRkZXYtPmRldik7DQo+ICAgDQo+IC0J
aWYgKCF4KQ0KPiArCWlmICgheCkgew0KPiArCQlhbWRncHVfdmlydF9kaXNhYmxlX2FjY2Vzc19k
ZWJ1Z2ZzKGFkZXYpOw0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAgIA0KPiAgIAl3
aGlsZSAoc2l6ZSAmJiAob2Zmc2V0IDwgeCAqIDQpKSB7DQo+ICAgCQl1aW50MzJfdCB2YWx1ZTsN
Cj4gICANCj4gICAJCXZhbHVlID0gZGF0YVtvZmZzZXQgPj4gMl07DQo+ICAgCQlyID0gcHV0X3Vz
ZXIodmFsdWUsICh1aW50MzJfdCAqKWJ1Zik7DQo+IC0JCWlmIChyKQ0KPiArCQlpZiAocikgew0K
PiArCQkJYW1kZ3B1X3ZpcnRfZGlzYWJsZV9hY2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gICAJCQly
ZXR1cm4gcjsNCj4gKwkJfQ0KPiAgIA0KPiAgIAkJcmVzdWx0ICs9IDQ7DQo+ICAgCQlidWYgKz0g
NDsNCj4gQEAgLTc1MSw2ICs4MTksNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfZGVidWdmc193
YXZlX3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2VyICpidWYsDQo+ICAgCQlzaXplIC09
IDQ7DQo+ICAgCX0NCj4gICANCj4gKwlhbWRncHVfdmlydF9kaXNhYmxlX2FjY2Vzc19kZWJ1Z2Zz
KGFkZXYpOw0KPiAgIAlyZXR1cm4gcmVzdWx0Ow0KPiAgIH0NCj4gICANCj4gQEAgLTgwNSw2ICs4
NzQsMTEgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2RlYnVnZnNfZ3ByX3JlYWQoc3RydWN0IGZp
bGUgKmYsIGNoYXIgX191c2VyICpidWYsDQo+ICAgCWlmIChyIDwgMCkNCj4gICAJCXJldHVybiBy
Ow0KPiAgIA0KPiArCWlmICghYW1kZ3B1X3ZpcnRfY2FuX2FjY2Vzc19kZWJ1Z2ZzKGFkZXYpKQ0K
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwllbHNlDQo+ICsJCWFtZGdwdV92aXJ0X2VuYWJsZV9h
Y2Nlc3NfZGVidWdmcyhhZGV2KTsNCj4gKw0KPiAgIAkvKiBzd2l0Y2ggdG8gdGhlIHNwZWNpZmlj
IHNlL3NoL2N1ICovDQo+ICAgCW11dGV4X2xvY2soJmFkZXYtPmdyYm1faWR4X211dGV4KTsNCj4g
ICAJYW1kZ3B1X2dmeF9zZWxlY3Rfc2Vfc2goYWRldiwgc2UsIHNoLCBjdSk7IEBAIC04NDAsNiAr
OTE0LDcgQEAgDQo+IHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX2dwcl9yZWFkKHN0cnVj
dCBmaWxlICpmLCBjaGFyIF9fdXNlciANCj4gKmJ1ZiwNCj4gICANCj4gICBlcnI6DQo+ICAgCWtm
cmVlKGRhdGEpOw0KPiArCWFtZGdwdV92aXJ0X2Rpc2FibGVfYWNjZXNzX2RlYnVnZnMoYWRldik7
DQo+ICAgCXJldHVybiByZXN1bHQ7DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiBpbmRleCAyYjk5ZjU5NTIzNzUuLjk5M2I3NWRkZTVk
MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiBAQCAt
MzMsNiArMzMsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1f
c2NoZWRfam9iICpzX2pvYikNCj4gICAJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gdG9fYW1k
Z3B1X3Jpbmcoc19qb2ItPnNjaGVkKTsNCj4gICAJc3RydWN0IGFtZGdwdV9qb2IgKmpvYiA9IHRv
X2FtZGdwdV9qb2Ioc19qb2IpOw0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyB0aTsNCj4g
KwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7DQo+ICAgDQo+ICAgCW1l
bXNldCgmdGksIDAsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbykpOw0KPiAgIA0KPiBA
QCAtNDksMTAgKzUwLDEyIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0
IGRybV9zY2hlZF9qb2IgKnNfam9iKQ0KPiAgIAlEUk1fRVJST1IoIlByb2Nlc3MgaW5mb3JtYXRp
b246IHByb2Nlc3MgJXMgcGlkICVkIHRocmVhZCAlcyBwaWQgJWRcbiIsDQo+ICAgCQkgIHRpLnBy
b2Nlc3NfbmFtZSwgdGkudGdpZCwgdGkudGFza19uYW1lLCB0aS5waWQpOw0KPiAgIA0KPiAtCWlm
IChhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNvdmVyX2dwdShyaW5nLT5hZGV2KSkNCj4gKwlpZiAo
YW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRldikpIHsNCj4gICAJCWFt
ZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIocmluZy0+YWRldiwgam9iKTsNCj4gLQllbHNlDQo+ICsJ
fSBlbHNlIHsNCj4gICAJCWRybV9zY2hlZF9zdXNwZW5kX3RpbWVvdXQoJnJpbmctPnNjaGVkKTsN
Cj4gKwkJYWRldi0+dmlydC50ZHJfZGVidWcgPSB0cnVlOw0KPiArCX0NCj4gICB9DQo+ICAgDQo+
ICAgaW50IGFtZGdwdV9qb2JfYWxsb2Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2ln
bmVkIG51bV9pYnMsIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZpcnQuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmly
dC5jDQo+IGluZGV4IDRkMDZjNzkwNjViZi4uZDBkZmU5OWViYzc1IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMNCj4gQEAgLTMzNCwzICszMzQsMjYgQEAg
dm9pZCBhbWRncHVfZGV0ZWN0X3ZpcnR1YWxpemF0aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPiAgIAkJCWFkZXYtPnZpcnQuY2FwcyB8PSBBTURHUFVfUEFTU1RIUk9VR0hfTU9ERTsN
Cj4gICAJfQ0KPiAgIH0NCj4gKw0KPiArYm9vbCBhbWRncHVfdmlydF9jYW5fYWNjZXNzX2RlYnVn
ZnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsNCj4gKwlpZiAoIWFtZGdwdV9zcmlvdl92
ZihhZGV2KSkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gKwlpZiAoYW1kZ3B1X3NyaW92X2lz
X2RlYnVnKGFkZXYpKQ0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKw0KPiArCXJldHVybiBmYWxzZTsN
Cj4gK30NCj4gKw0KPiArdm9pZCBhbWRncHVfdmlydF9lbmFibGVfYWNjZXNzX2RlYnVnZnMoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsNCj4gKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYp
KQ0KPiArCQlhZGV2LT52aXJ0LmNhcHMgJj0gfkFNREdQVV9TUklPVl9DQVBTX1JVTlRJTUU7IH0N
Cj4gKw0KPiArdm9pZCBhbWRncHVfdmlydF9kaXNhYmxlX2FjY2Vzc19kZWJ1Z2ZzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KSB7DQo+ICsJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkNCj4g
KwkJYWRldi0+dmlydC5jYXBzIHw9IEFNREdQVV9TUklPVl9DQVBTX1JVTlRJTUU7IH0NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmggDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuaA0KPiBpbmRleCBmNmFlM2M2
NTYzMDQuLmEwMTc0MmI3YmYxMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZpcnQuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmlydC5oDQo+IEBAIC0yNjUsNiArMjY1LDcgQEAgc3RydWN0IGFtZGdwdV92aXJ0IHsN
Cj4gICAJdWludDMyX3QgZ2ltX2ZlYXR1cmU7DQo+ICAgCXVpbnQzMl90IHJlZ19hY2Nlc3NfbW9k
ZTsNCj4gICAJaW50IHJlcV9pbml0X2RhdGFfdmVyOw0KPiArCWJvb2wgdGRyX2RlYnVnOw0KPiAg
IH07DQo+ICAgDQo+ICAgI2RlZmluZSBhbWRncHVfc3Jpb3ZfZW5hYmxlZChhZGV2KSBcIEBAIC0y
OTYsNiArMjk3LDggQEAgc3RhdGljIA0KPiBpbmxpbmUgYm9vbCBpc192aXJ0dWFsX21hY2hpbmUo
dm9pZCkNCj4gICANCj4gICAjZGVmaW5lIGFtZGdwdV9zcmlvdl9pc19wcF9vbmVfdmYoYWRldikg
XA0KPiAgIAkoKGFkZXYpLT52aXJ0LmdpbV9mZWF0dXJlICYgQU1ER0lNX0ZFQVRVUkVfUFBfT05F
X1ZGKQ0KPiArI2RlZmluZSBhbWRncHVfc3Jpb3ZfaXNfZGVidWcoYWRldikgXA0KPiArCSgoIWFk
ZXYtPmluX2dwdV9yZXNldCkgJiYgYWRldi0+dmlydC50ZHJfZGVidWcpDQo+ICAgDQo+ICAgYm9v
bCBhbWRncHVfdmlydF9tbWlvX2Jsb2NrZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0K
PiAgIHZvaWQgYW1kZ3B1X3ZpcnRfaW5pdF9zZXR0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsgQEAgLTMxNCw0IA0KPiArMzE3LDggQEAgaW50IGFtZGdwdV92aXJ0X2Z3X3Jlc2VydmVf
Z2V0X2NoZWNrc3VtKHZvaWQgKm9iaiwgdW5zaWduZWQgbG9uZyBvYmpfc2l6ZSwNCj4gICAJCQkJ
CXVuc2lnbmVkIGludCBjaGtzdW0pOw0KPiAgIHZvaWQgYW1kZ3B1X3ZpcnRfaW5pdF9kYXRhX2V4
Y2hhbmdlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gICB2b2lkIGFtZGdwdV9kZXRl
Y3RfdmlydHVhbGl6YXRpb24oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiArDQo+ICti
b29sIGFtZGdwdV92aXJ0X2Nhbl9hY2Nlc3NfZGVidWdmcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7IHZvaWQgDQo+ICthbWRncHVfdmlydF9lbmFibGVfYWNjZXNzX2RlYnVnZnMoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOyB2b2lkIA0KPiArYW1kZ3B1X3ZpcnRfZGlzYWJsZV9hY2Nl
c3NfZGVidWdmcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAgI2VuZGlmDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
