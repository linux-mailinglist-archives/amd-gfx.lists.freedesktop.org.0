Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F673195
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AE6E5B2;
	Wed, 24 Jul 2019 14:26:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800057.outbound.protection.outlook.com [40.107.80.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E586F6E5B2
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCKek7QLhDu9sDaum8Qgd1F5EpS+dvvMmnGSv7mn7AnYXH6VRWn7aetRVjbl4wIc3SsaHwBarUM/Kn/jpARhLD4EsazDxagI8bh52ESFM/WKSfmgePORxIa1CsrjozdvkGN0oCS2+DaXckW9c+KZP2dLjkm6TfdjjW8DusGyZpidsVXtqAxwWf4DTN6rYD2CR0h6bVe4D2NwqONm37QAj2vrvC6HNoF3xcAfvadtrmbZHmOPOVAFL5W4fYqPQ4BmTAVraZsfo8QSNpbH+ixmfRpLbBKfDLz2pGbgLud2AzU5IiiPqGwkFFUpd5ftqTHj0in6ID9lugf43F0zg+sqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euE9GZQWZcOYess4c0ahy7oWMEdFyfYu2VmL2MqFcg0=;
 b=LqWycRGGyICPHp37Jf0HIGooGBJIp3dgeW0jVKC4p03z7N8gmZcEIlvA+Le6jhn3Irg5IAQ3qLGcswTyPAznQ38g3UL0G5b/KFVeWfIDwLV9DOvRwnXV1zP3tOKnd1vYbRs1QVbR7pp2W3YKQ/Evpv+Erqs0pWMhhbcFoQFEjW+hyIL6gwZZrIImEU2yFgf8CFl83zd8OfMLA4Jkqpa6MlfOcfmdsc5K4jjduEO54rmTblgBkkARKZfVoj69MnZrc8L97Tn0QvLEnW4ZnXa2C+UGF+HRih1sQ5jEc3IJ2kizMm+uYWPgupgzkXZHHifjBrcF/XbTWoVw4JtD8kn+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1691.namprd12.prod.outlook.com (10.172.36.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 14:26:00 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Wed, 24 Jul
 2019 14:26:00 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Thread-Topic: [PATCH v3 2/3] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Thread-Index: AQHVQim8yRlZIDp48EOeLSwDuOT6jKbZ0xMA
Date: Wed, 24 Jul 2019 14:26:00 +0000
Message-ID: <5333d382-2c00-5896-49d1-5c521b85432c@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-3-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1563977442-4809-3-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0238.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::34) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5aac18a-9580-4957-d0fa-08d71042d99f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1691; 
x-ms-traffictypediagnostic: DM5PR12MB1691:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR12MB16911EE09AF0EEC08012CB6883C60@DM5PR12MB1691.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(189003)(199004)(99286004)(386003)(14444005)(256004)(476003)(8936002)(186003)(102836004)(65956001)(5660300002)(11346002)(46003)(446003)(2616005)(66946007)(66556008)(65806001)(64756008)(66446008)(36756003)(71200400001)(71190400001)(229853002)(2906002)(66476007)(6506007)(4326008)(68736007)(486006)(76176011)(2501003)(31686004)(52116002)(305945005)(6486002)(6306002)(58126008)(86362001)(6246003)(6512007)(14454004)(6436002)(81156014)(6116002)(53936002)(81166006)(64126003)(31696002)(54906003)(65826007)(316002)(25786009)(7736002)(8676002)(478600001)(966005)(110136005)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1691;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: que2D5YmWJeoC/jPUN92ip0cNNiRB/zyN2x2GIKrZTTcYsO06ldYp9C9dqdbgdokKxJALH8rM5ipcsXihmt1+kjC61FCe8giKy0X7N9kv3Sj/CYVqUwizmjkI2Vd76lKwYrMFn3EhuP6YVJ2EfFCGTOYnOCdWlax3+PPt21p7lLKeYzodn0hTAWznvtBlZkB/mTvohq6O151tIrR+eOxqCL1B4blaJ0WsE8DJfATTjYv7vkaaHBxfl1R/hqz6X2eWXQmFjJnNZ64EtGVpA30rJvmU7MSW/dW8t3F0jgTjW7sSQxAUe1yKL/+ncJ6ECOecUaDmivjBWyZxWgnN365Yyt7xJ4c7mEOzPcaZtfDmQRWrZAiYhBwWAaePDBoZ11YAxHTSlTqMKGUf8M4qShYXrUdR5HYaGWI0HGDnIjujjg=
Content-ID: <6F5512815FF81E4CAEA0F10CBE32566E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aac18a-9580-4957-d0fa-08d71042d99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:26:00.3021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euE9GZQWZcOYess4c0ahy7oWMEdFyfYu2VmL2MqFcg0=;
 b=qy/UgEQNGtn0XR6z47j9RnWHyl4kxlOjihtP6eOnKJaWOjZ7uWatXVtoZ0eS0XMsQzabMw7QsHc/FPN+jkdNavlrZkhiH+DtF0/BSXR8RJJvRGK3EKKYSQ6vsdGXll5ZDPxAWGbj2hzHqOlir6uU2d0sKlgR1xr8wMt8MpfONak=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjQuMDcuMTkgdW0gMTY6MTAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToNCj4gTW92ZSB0
aGUgbG9naWMgdG8gY2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGluDQo+IGFt
ZGdwdV9ib19kb19jcmVhdGUgaW50byBzdGFuZGFsb25lIGhlbHBlciBzbyBpdCBjYW4gYmUgcmV1
c2VkDQo+IGluIG90aGVyIGZ1bmN0aW9ucy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdy
b2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDYzICsrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuaCB8ICAyICsNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDI3IGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5jDQo+IGluZGV4IDk4OWI3YjUuLjY0YzQ1YmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMNCj4gQEAgLTQxMyw2ICs0MTMsNDEgQEAgc3RhdGlj
IGJvb2wgYW1kZ3B1X2JvX3ZhbGlkYXRlX3NpemUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
DQo+ICAgCXJldHVybiBmYWxzZTsNCj4gICB9DQo+ICAgDQo+ICt2b2lkIGFtZGdwdV9ib192YWxp
ZGF0ZV91c3djKHU2NCAqYm9fZmxhZ3MpDQoNCkJldHRlciByZXR1cm4gYm9vbCBoZXJlIGluc3Rl
YWQgb2YgbW9kaWZ5aW5nIHRoZSBmbGFnLg0KDQpDaHJpc3RpYW4uDQoNCj4gK3sNCj4gKwl1NjQg
ZmxhZ3MgPSAqYm9fZmxhZ3M7DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfWDg2XzMyDQo+ICsJLyog
WFhYOiBXcml0ZS1jb21iaW5lZCBDUFUgbWFwcGluZ3Mgb2YgR1RUIHNlZW0gYnJva2VuIG9uIDMy
LWJpdA0KPiArCSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNn
aT9pZD04NDYyNw0KPiArCSAqLw0KPiArCWZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVf
R1RUX1VTV0M7DQo+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19YODYpICYmICFkZWZpbmVkKENPTkZJ
R19YODZfUEFUKQ0KPiArCS8qIERvbid0IHRyeSB0byBlbmFibGUgd3JpdGUtY29tYmluaW5nIHdo
ZW4gaXQgY2FuJ3Qgd29yaywgb3IgdGhpbmdzDQo+ICsJICogbWF5IGJlIHNsb3cNCj4gKwkgKiBT
ZWUgaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9ODg3NTgNCj4g
KwkgKi8NCj4gKw0KPiArI2lmbmRlZiBDT05GSUdfQ09NUElMRV9URVNUDQo+ICsjd2FybmluZyBQ
bGVhc2UgZW5hYmxlIENPTkZJR19NVFJSIGFuZCBDT05GSUdfWDg2X1BBVCBmb3IgYmV0dGVyIHBl
cmZvcm1hbmNlIFwNCj4gKwkgdGhhbmtzIHRvIHdyaXRlLWNvbWJpbmluZw0KPiArI2VuZGlmDQo+
ICsNCj4gKwlpZiAoZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MpDQo+ICsJ
CURSTV9JTkZPX09OQ0UoIlBsZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5kIENPTkZJR19YODZf
UEFUIGZvciAiDQo+ICsJCQkgICAgICAiYmV0dGVyIHBlcmZvcm1hbmNlIHRoYW5rcyB0byB3cml0
ZS1jb21iaW5pbmdcbiIpOw0KPiArCWZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVfR1RU
X1VTV0M7DQo+ICsjZWxzZQ0KPiArCS8qIEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3Qgc3Vw
cG9ydCBXQyBtZW1vcnksDQo+ICsJICogbWFzayBvdXQgdGhlIFdDIGZsYWcgZnJvbSB0aGUgQk8N
Cj4gKwkgKi8NCj4gKwlpZiAoIWRybV9hcmNoX2Nhbl93Y19tZW1vcnkoKSkNCj4gKwkJZmxhZ3Mg
Jj0gfkFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsNCj4gKyNlbmRpZg0KPiArDQo+ICsJ
KmJvX2ZsYWdzID0gZmxhZ3M7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50IGFtZGdwdV9ib19k
b19jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQkJICAgICAgIHN0cnVj
dCBhbWRncHVfYm9fcGFyYW0gKmJwLA0KPiAgIAkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICoq
Ym9fcHRyKQ0KPiBAQCAtNDY2LDMzICs1MDEsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19kb19j
cmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgDQo+ICAgCWJvLT5mbGFncyA9
IGJwLT5mbGFnczsNCj4gICANCj4gLSNpZmRlZiBDT05GSUdfWDg2XzMyDQo+IC0JLyogWFhYOiBX
cml0ZS1jb21iaW5lZCBDUFUgbWFwcGluZ3Mgb2YgR1RUIHNlZW0gYnJva2VuIG9uIDMyLWJpdA0K
PiAtCSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04
NDYyNw0KPiAtCSAqLw0KPiAtCWJvLT5mbGFncyAmPSB+QU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dU
VF9VU1dDOw0KPiAtI2VsaWYgZGVmaW5lZChDT05GSUdfWDg2KSAmJiAhZGVmaW5lZChDT05GSUdf
WDg2X1BBVCkNCj4gLQkvKiBEb24ndCB0cnkgdG8gZW5hYmxlIHdyaXRlLWNvbWJpbmluZyB3aGVu
IGl0IGNhbid0IHdvcmssIG9yIHRoaW5ncw0KPiAtCSAqIG1heSBiZSBzbG93DQo+IC0JICogU2Vl
IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTg4NzU4DQo+IC0J
ICovDQo+IC0NCj4gLSNpZm5kZWYgQ09ORklHX0NPTVBJTEVfVEVTVA0KPiAtI3dhcm5pbmcgUGxl
YXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yIGJldHRlciBwZXJm
b3JtYW5jZSBcDQo+IC0JIHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmcNCj4gLSNlbmRpZg0KPiAt
DQo+IC0JaWYgKGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQykNCj4g
LQkJRFJNX0lORk9fT05DRSgiUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4
Nl9QQVQgZm9yICINCj4gLQkJCSAgICAgICJiZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbmtzIHRvIHdy
aXRlLWNvbWJpbmluZ1xuIik7DQo+IC0JYm8tPmZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9D
UFVfR1RUX1VTV0M7DQo+IC0jZWxzZQ0KPiAtCS8qIEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG9u
J3Qgc3VwcG9ydCBXQyBtZW1vcnksDQo+IC0JICogbWFzayBvdXQgdGhlIFdDIGZsYWcgZnJvbSB0
aGUgQk8NCj4gLQkgKi8NCj4gLQlpZiAoIWRybV9hcmNoX2Nhbl93Y19tZW1vcnkoKSkNCj4gLQkJ
Ym8tPmZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7DQo+IC0jZW5kaWYN
Cj4gKwlhbWRncHVfYm9fdmFsaWRhdGVfdXN3YygmYm8tPmZsYWdzKTsNCj4gICANCj4gICAJYm8t
PnRiby5iZGV2ID0gJmFkZXYtPm1tYW4uYmRldjsNCj4gICAJaWYgKGJwLT5kb21haW4gJiAoQU1E
R1BVX0dFTV9ET01BSU5fR1dTIHwgQU1ER1BVX0dFTV9ET01BSU5fT0EgfA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oDQo+IGluZGV4IGQ2MDU5M2MuLjA3ODMy
ZTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgN
Cj4gQEAgLTMwOCw1ICszMDgsNyBAQCB2b2lkIGFtZGdwdV9zYV9ib19kdW1wX2RlYnVnX2luZm8o
c3RydWN0IGFtZGdwdV9zYV9tYW5hZ2VyICpzYV9tYW5hZ2VyLA0KPiAgIAkJCQkJIHN0cnVjdCBz
ZXFfZmlsZSAqbSk7DQo+ICAgI2VuZGlmDQo+ICAgDQo+ICt2b2lkIGFtZGdwdV9ib192YWxpZGF0
ZV91c3djKHU2NCAqYm9fZmxhZ3MpOw0KPiArDQo+ICAgDQo+ICAgI2VuZGlmDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
