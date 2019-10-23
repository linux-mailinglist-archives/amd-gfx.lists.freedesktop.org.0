Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE37E1319
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Oct 2019 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60036E972;
	Wed, 23 Oct 2019 07:27:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146FA6E972
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 07:27:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGIt3i+HE4DuZ6VgOYHJoK7HnjOBqLmxaQ7VAO9Sy2vbf2jIyC4KDLM0c8NECxV0DYKCIViPD0lFN1vgjWeyYtz5W1vrN0IzetFkS60aF12FY/dXujHSYdh8FY9L327ylFjXmwFUM4SE1z3dpqOY8f+ZrzJfg+8MoG/eud0UdT3e760V03PJ/r6jdaALMS/EsAGPQyvk5hz6rgGxwz86pEgPp84DDdOb15kwaDMpqB0OeO20M89c4WtNV3gRpULCO1EEGvGZYFrr4LAWfckFeInVP3wadL7riph9T3vOzsEPJhD0dgDgl8nYgDqwJMCR5IM4KA/XpXnVrG9GIxR3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr8B3QC2rLMJJDT/5jnIwcCcyMmSdE5ZxJcIDrYv988=;
 b=Ah9aBYGpKE9X9UetwROxJzJgdg7AT7/yzgnvFbFfVbCDb82amyXsiHZF8SASrrAf8lXTVEKKpJMzA6XcFIM90nbkyNpp21pSwswzZZZLqlAC+/D4uvbZgV7ekjU4dBI6GlYLLkh+DjX0/XL5dM8N2clrinDldx3LbcHEnn8ZOK8d6Z/xq0DuLnkWbHwX8/RkTXebeGz9K1nmF3cdL9JeBakHt8gTYc9nzC7u7X2N4ENwk4deVnJLDKc8oAJIdzLz3T460hZnxpbB0CB0WmAOP1cPlIqEPuObBb3WTmjGj5Mf/gSN6MfkSxuG4EcmS/LEucKbX77uPyDYPjFGyGx7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.238.203) by
 MN2PR12MB4079.namprd12.prod.outlook.com (52.135.49.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Wed, 23 Oct 2019 07:27:32 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::282d:ad6c:e8da:3b34]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::282d:ad6c:e8da:3b34%4]) with mapi id 15.20.2387.019; Wed, 23 Oct 2019
 07:27:31 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "Gong, Curry" <Curry.Gong@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix SDMA hang when performing VKexample test
Thread-Topic: [PATCH] drm/amdgpu: Fix SDMA hang when performing VKexample test
Thread-Index: AQHViW5U7cDNCLlViEKPCyHMHg1iBadn07ZA
Date: Wed, 23 Oct 2019 07:27:31 +0000
Message-ID: <MN2PR12MB38383E45EABE40D241A877DBF06B0@MN2PR12MB3838.namprd12.prod.outlook.com>
References: <1571813487-31589-1-git-send-email-curry.gong@amd.com>
In-Reply-To: <1571813487-31589-1-git-send-email-curry.gong@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 158f7b30-0875-4392-d0a1-08d7578a7794
x-ms-traffictypediagnostic: MN2PR12MB4079:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4079518AF6D92DF79DFE42C8F06B0@MN2PR12MB4079.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(199004)(189003)(13464003)(76116006)(86362001)(74316002)(66066001)(66946007)(446003)(486006)(99286004)(2906002)(186003)(102836004)(14454004)(26005)(81166006)(81156014)(64756008)(66476007)(66556008)(8936002)(66446008)(7736002)(305945005)(8676002)(11346002)(476003)(229853002)(3846002)(6436002)(6116002)(6306002)(9686003)(25786009)(53546011)(33656002)(110136005)(55016002)(256004)(316002)(52536014)(71190400001)(71200400001)(478600001)(2501003)(5660300002)(76176011)(7696005)(6506007)(966005)(4326008)(6246003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4079;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WIwIaxCfOsedHDqieoAlBk0OJfyQjouZsAVDMBW7LYAcR8lTeYW+cuwyYkxyhRNQ/jEpypC8HoFaSeC/boFvXaISt8bHjuvQfxXnwRbn6MobhXOM9VdSKDJLnQl0Y/qog526RNlE6RgR1yUhgbGJgmo7FtTnrbzY511f964MOx4YlEjE/bINLZc6Lx8CBDTAbg5NQV8bPBE71FSXPw4ukkx51ISrrwjaGRvV+Mg1ZaMgA6ZXkYjTwuRbBtwFfcpsn8jRYqkVSVnDxRmFBiNYT1iWjFHOIncJEWyogV5x8BYVaLSEizvqx7RMQNj31fsdLyqbWmkliKpGf+lKu7gMxkI/zCehgthoCpBtKcBGm/tjbrCm6QC+uO9ce2uXY7yhPtzFvUTE74K2ZJaxCJPLJvLpU+zhIlKXSO2TzBwrQpvOdnKx6fglG6/lp531Duy23pWB6/VsgFFWQZZ1KcdJ18vr3QQYQ4YRnIBKafVeq8U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158f7b30-0875-4392-d0a1-08d7578a7794
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 07:27:31.7890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UgT1hiAq/mgkK6iObl6g45+T3KxkY0cHCnj6+43pvR9VFcW/2zuQjaWvFDYjmp+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr8B3QC2rLMJJDT/5jnIwcCcyMmSdE5ZxJcIDrYv988=;
 b=Kg/HaOzqHLBDY8PhEJ9oZnsg55jduArixmUIHm0ud+7nn9sxEwFIKCh1pmX+TD9qbx1ddfZIs+H1A9O9jMyCNCU7LMU6PTt2EDkrynIhZoQxYGzKXpqYY+vjL+3t9V1+kL/q1m8lc8joD6XzNA8z3ktCylrTO0mFjwidBZQbNK8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Gong, Curry" <Curry.Gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+DQoNCkJSLA0KQWFyb24g
TGl1DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1k
LWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIGNoZW4NCj4g
Z29uZw0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjMsIDIwMTkgMjo1MSBQTQ0KPiBUbzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEdvbmcsIEN1cnJ5IDxDdXJyeS5H
b25nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogRml4IFNETUEgaGFu
ZyB3aGVuIHBlcmZvcm1pbmcgVktleGFtcGxlDQo+IHRlc3QNCj4gDQo+IFZLZXhhbXBsZSB0ZXN0
IGhhbmcgZHVyaW5nIE9jY2x1c2lvbi9TRE1BL1ZhcmlhIHJ1bnMuDQo+IENsZWFyIFhOQUNLX1dB
VEVSTUsgaW4gcmVnIFNETUEwX1VUQ0wxX1dBVEVSTUsgdG8gZml4IHRoaXMgaXNzdWUuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBjaGVuIGdvbmcgPGN1cnJ5LmdvbmdAYW1kLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDEgKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3Y0XzAuYw0KPiBpbmRleCA2M2EzNzkyLi40NWJkNTM4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiBAQCAtMjU0LDYgKzI1NCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbg0KPiBnb2xkZW5fc2V0dGluZ3Nfc2RtYV80
XzNbXSA9IHsNCj4gIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKFNETUEwLCAwLA0KPiBtbVNETUEw
X1JMQzBfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLA0KPiAgCVNP
QzE1X1JFR19HT0xERU5fVkFMVUUoU0RNQTAsIDAsDQo+IG1tU0RNQTBfUkxDMV9SQl9XUFRSX1BP
TExfQ05UTCwgMHhmZmZmZmZmNywgMHgwMDQwMzAwMCksDQo+ICAJU09DMTVfUkVHX0dPTERFTl9W
QUxVRShTRE1BMCwgMCwgbW1TRE1BMF9VVENMMV9QQUdFLA0KPiAweDAwMDAwM2ZmLCAweDAwMDAw
M2MwKSwNCj4gKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKFNETUEwLCAwLA0KPiBtbVNETUEwX1VU
Q0wxX1dBVEVSTUssIDB4ZmMwMDAwMDAsIDB4MDAwMDAwMDApDQo+ICB9Ow0KPiANCj4gIHN0YXRp
YyB1MzIgc2RtYV92NF8wX2dldF9yZWdfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LA0KPiAtLQ0KPiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
