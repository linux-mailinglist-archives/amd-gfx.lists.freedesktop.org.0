Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289AD87250
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 08:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726C96ED03;
	Fri,  9 Aug 2019 06:41:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AD86ED00
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 06:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TclYuWZCvR86gCFKOhlWXZndppTMdwmLnAY4PcNQqCD9rRAxgOJh6+TqzxOBA08uIqvgU0GRQ4FA4YR3VbtyECItwKjFqQ0ZJ/d26/kxlgYudF0po8zLEwQ5ES3iBiGxcxO2D+liWZQQJcUXypJaqlwFLE5n6Zo1lN96ab/BS6yZkJ6ZpHkTaJq4s8HCzPYmQma2LAXRZDGu/azP3VtPMYis8voGbTU81MnV8feUnU2KXzQQw7ujr2QWeTTx4lts+dKlSEWKbzKJ4/OoIZ4nMb54sFkgpPGxzmgtn0nlrz2V7BVIvsCFi3+syOO4rAtT10b1/23lSCRS0V3ss3RxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Zq+COHPQI7egb/T/xJWMbhX73ENJHr56RGhWe02iO4=;
 b=I5o38GU5ePiX213Utal6zJ+QCdiwSNDVl0AuXOtmwgw2nHAVJk0smN6zRg+37D9ZE+cMxhuGXrfOmAmQHX2fnGUPVQ5PeSnwTEj5a4e0A2VTkXcNoTQuv6rOd9ecvJ6ATgZtwr5XHwNCumFcEZd+WtdWsiQx+TVTXNILgFrsmpaqnEgyBUrgI39FDOXo1a7Yt+gU472JtwjxQjUZnaQBACS46bVNhk6LYSBM4Jm64pTERXiSWhOFI5e0z8ojKO13izT/pVOMCWlnQzVqOR9Jooj0Hnx06QXKyXZ8EmmIP5RYAPShjxXbawEBrFKUQgOnl/tEQzkYgvmcHana3h/VuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1131.namprd12.prod.outlook.com (10.168.236.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 06:41:30 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 06:41:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Thread-Topic: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Thread-Index: AQHVTmrqtTK1lnuuzEaFLTdt6KCIWKbyXheA
Date: Fri, 9 Aug 2019 06:41:30 +0000
Message-ID: <fb018011-ec77-19d7-0639-ca67abb597dc@amd.com>
References: <20190809042731.30491-1-tao.zhou1@amd.com>
In-Reply-To: <20190809042731.30491-1-tao.zhou1@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::29) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83effdab-28f1-4aee-0746-08d71c949c3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1131; 
x-ms-traffictypediagnostic: DM5PR12MB1131:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB113114E062AD657954D81AE383D60@DM5PR12MB1131.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(486006)(476003)(8676002)(6246003)(53936002)(66946007)(478600001)(305945005)(36756003)(186003)(64126003)(46003)(110136005)(66476007)(11346002)(446003)(316002)(64756008)(66556008)(25786009)(58126008)(7736002)(2616005)(256004)(14444005)(8936002)(71200400001)(71190400001)(66446008)(6512007)(31686004)(81166006)(86362001)(52116002)(6436002)(6486002)(31696002)(76176011)(6116002)(2906002)(6636002)(99286004)(81156014)(229853002)(65826007)(14454004)(5660300002)(102836004)(2501003)(386003)(65956001)(6506007)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1131;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mWGACm/CnkcBGr+OvRC9Ody/E9jogVuu8R9mCSlWNenKM+NpADH9Hq9FZrl6ONbS6hFmVJwFa80iGSzL++IFX8Rmqcn5OPCwhq+Ncf1CqKBG5Svg6dvdkokh4yechScr9em+N6OEyoY5qU9XCgs8klPQHHc0LtGWOmHCwmfG0KcnXj5DuQSVn8TRpid7oXQUkP1nN6DbBjbBqwqvE9Jej8Hf+nGLIeFpxQFbY0sGK1KN80BYhScdS5GfpkzvlZqpU133aWE2ctJLevcdTChnz+Zs0DynOXj9WsoPvwyS3Gu1J2Xnp0F41FaQ4LojkRWX3ibm5WCc7Jtsjet/A5XJMvB21l4vmuxxGOfmuF7Sln71GZu9s6fd8bkbfO1pYx0WfUbMHn0HvPCk0tpz0M95vTCfb4TKhP+da3B2Z1oL4KU=
Content-ID: <EC87080C7F37764280FA4A70F04DAA8D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83effdab-28f1-4aee-0746-08d71c949c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 06:41:30.2035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Biw5oOfL1WmARwBMsLazMsPD6fuOXlVCVI7KKuO7CfcFz7nfVlEkqUs8+zSGosZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Zq+COHPQI7egb/T/xJWMbhX73ENJHr56RGhWe02iO4=;
 b=LS07YGKxi7c7ITrkgo6ocAvehbjznbRgFUZ2afHb1NWBa/GDKB765Iop/LgbtMvyl74BJ9HHYhNkPUvdduqIiwFtdA7B7TBICwawnAu/Gsp53sSzjZKdJkDPT77Ml8M/0B1bjudcDDsCHGilunh4Ay6nABHgU1M+LU8jz4x7B6k=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDkuMDguMTkgdW0gMDY6Mjcgc2NocmllYiBUYW8gWmhvdToNCj4gaW1wbGVtZW50IDY0IGJp
dHMgb3BlcmF0aW9ucyB2aWEgMzIgYml0cyBpbnRlcmZhY2UNCj4NCj4gU2lnbmVkLW9mZi1ieTog
VGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdW1jLmggfCAgOSArKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jICAgfCAxMCArKysrKy0tLS0tDQo+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQo+IGluZGV4IDllZmRkNjYyNzllNS4uYTYxN2Rj
YzlkMjU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQo+
IEBAIC0yMSw2ICsyMSwxNSBAQA0KPiAgICNpZm5kZWYgX19BTURHUFVfVU1DX0hfXw0KPiAgICNk
ZWZpbmUgX19BTURHUFVfVU1DX0hfXw0KPiAgIA0KPiArLyogaW1wbGVtZW50IDY0IGJpdHMgUkVH
IG9wZXJhdGlvbnMgdmlhIDMyIGJpdHMgaW50ZXJmYWNlICovDQo+ICsjZGVmaW5lIFJSRUc2NF9V
TUMocmVnKQkoUlJFRzMyKHJlZykgfCBcDQo+ICsJCQkJKCh1aW50NjRfdClSUkVHMzIoKHJlZykg
KyAxKSA8PCAzMikpDQo+ICsjZGVmaW5lIFdSRUc2NF9VTUMocmVnLCB2KQlcDQoNCk1heWJlIGNh
bGwgdGhpcyBXUkVHX0xPX0hJIGFuZCBSUkVHX0xPX0hJIHRvIGV4cGxpY2l0bHkgbm90ZSB3aGF0
IHRoZXkgDQphcmUgZG9pbmcuIFRoaXMgd2F5IHdlIGNhbiBwcm9iYWJseSBrZWVwIHRoZW0gaW4g
YW1kZ3B1LmggYXMgd2VsbC4NCg0KPiArCWRvIHsJXA0KPiArCQlXUkVHMzIoKHJlZyksICh1aW50
MzJfdCkoKHYpICYgMHhmZmZmZmZmZikpOwlcDQo+ICsJCVdSRUczMigocmVnKSArIDEsICh1aW50
MzJfdCkoKHYpID4+IDMyKSk7CVwNCg0KSSB0aGluayBJIG5vdyB1bmRlcnN0YW5kIHdoeSB5b3Ug
d2FudGVkIHRvIGhhdmUgdGhpcyBtYWNyby4NCg0KV2UgaGF2ZSBleHBsaWNpdCBsb3dlcl8zMl9i
aXRzKCkgYW5kIHVwcGVyXzMyX2JpdHMoKSBmdW5jdGlvbnMgdG8gYXZvaWQgDQp0aGUgbWFza2lu
ZyBhbmQgc2hpZnRpbmcgYW5kIG1ha2UgdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4NCg0KRm9yIGV4
YW1wbGUgc2VlIHRoZSBVVkQgY29kZToNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9MT1cs
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG93ZXJf
MzJfYml0cyhhZGV2LT52Y24uZ3B1X2FkZHIpKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JB
Ul9ISUdILA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVwcGVyXzMyX2JpdHMoYWRldi0+dmNuLmdwdV9hZGRyKSk7DQoNCkkgc3VnZ2VzdCB0byB1c2Ug
dGhvc2UgaW4geW91ciBtYWNybyBoZXJlIGFzIHdlbGwsIGFwYXJ0IGZyb20gdGhhdCB0aGUgDQpw
YXRjaCBsb29rcyBnb29kIHRvIG1lLg0KDQpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRoaXMs
DQpDaHJpc3RpYW4uDQoNCj4gKwl9IHdoaWxlICgwKQ0KPiArDQo+ICAgLyoNCj4gICAgKiB2b2lk
ICgqZnVuYykoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCByYXNfZXJyX2RhdGEg
KmVycl9kYXRhLA0KPiAgICAqCQkJCXVpbnQzMl90IHVtY19yZWdfb2Zmc2V0LCB1aW50MzJfdCBj
aGFubmVsX2luZGV4KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dW1jX3Y2XzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMNCj4gaW5k
ZXggNjRkZjM3Yjg2MGRkLi44NTAyZTczNmY3MjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdW1jX3Y2XzEuYw0KPiBAQCAtMTE2LDcgKzExNiw3IEBAIHN0YXRpYyB2b2lkIHVtY192
Nl8xX3F1ZXJ5X2NvcnJlY3RhYmxlX2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LA0KPiAgIA0KPiAgIAkvKiBjaGVjayBmb3IgU1JBTSBjb3JyZWN0YWJsZSBlcnJvcg0KPiAg
IAkgIE1DVU1DX1NUQVRVUyBpcyBhIDY0IGJpdCByZWdpc3RlciAqLw0KPiAtCW1jX3VtY19zdGF0
dXMgPSBSUkVHNjQobWNfdW1jX3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOw0KPiArCW1j
X3VtY19zdGF0dXMgPSBSUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zm
c2V0KTsNCj4gICAJaWYgKFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMw
X01DVU1DX1NUQVRVU1QwLCBFcnJvckNvZGVFeHQpID09IDYgJiYNCj4gICAJICAgIFJFR19HRVRf
RklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBWYWwpID09
IDEgJiYNCj4gICAJICAgIFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMw
X01DVU1DX1NUQVRVU1QwLCBDRUNDKSA9PSAxKQ0KPiBAQCAtMTM0LDcgKzEzNCw3IEBAIHN0YXRp
YyB2b2lkIHVtY192Nl8xX3F1ZXJyeV91bmNvcnJlY3RhYmxlX2Vycm9yX2NvdW50KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2DQo+ICAgICAgICAgICAgICAgICAgIFNPQzE1X1JFR19PRkZTRVQo
VU1DLCAwLCBtbU1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCk7DQo+ICAgDQo+ICAgCS8qIGNo
ZWNrIHRoZSBNQ1VNQ19TVEFUVVMgKi8NCj4gLQltY191bWNfc3RhdHVzID0gUlJFRzY0KG1jX3Vt
Y19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsNCj4gKwltY191bWNfc3RhdHVzID0gUlJF
RzY0X1VNQyhtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCk7DQo+ICAgCWlmICgo
UkVHX0dFVF9GSUVMRChtY191bWNfc3RhdHVzLCBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVTVDAs
IFZhbCkgPT0gMSkgJiYNCj4gICAJICAgIChSRUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0dXMsIE1D
QV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgRGVmZXJyZWQpID09IDEgfHwNCj4gICAJICAgIFJF
R19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBV
RUNDKSA9PSAxIHx8DQo+IEBAIC0xNzMsMTEgKzE3MywxMSBAQCBzdGF0aWMgdm9pZCB1bWNfdjZf
MV9xdWVyeV9lcnJvcl9hZGRyZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIAkv
KiBza2lwIGVycm9yIGFkZHJlc3MgcHJvY2VzcyBpZiAtRU5PTUVNICovDQo+ICAgCWlmICghZXJy
X2RhdGEtPmVycl9hZGRyKSB7DQo+ICAgCQkvKiBjbGVhciB1bWMgc3RhdHVzICovDQo+IC0JCVdS
RUc2NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsNCj4gKwkJ
V1JFRzY0X1VNQyhtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsN
Cj4gICAJCXJldHVybjsNCj4gICAJfQ0KPiAgIA0KPiAtCW1jX3VtY19zdGF0dXMgPSBSUkVHNjQo
bWNfdW1jX3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOw0KPiArCW1jX3VtY19zdGF0dXMg
PSBSUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsNCj4gICAN
Cj4gICAJLyogY2FsY3VsYXRlIGVycm9yIGFkZHJlc3MgaWYgdWUvY2UgZXJyb3IgaXMgZGV0ZWN0
ZWQgKi8NCj4gICAJaWYgKFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMw
X01DVU1DX1NUQVRVU1QwLCBWYWwpID09IDEgJiYNCj4gQEAgLTIwMCw3ICsyMDAsNyBAQCBzdGF0
aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9lcnJvcl9hZGRyZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LA0KPiAgIAl9DQo+ICAgDQo+ICAgCS8qIGNsZWFyIHVtYyBzdGF0dXMgKi8NCj4gLQlX
UkVHNjQobWNfdW1jX3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQsIDB4MFVMTCk7DQo+ICsJ
V1JFRzY0X1VNQyhtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsN
Cj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfcmFzX2Vycm9yX2Fk
ZHJlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
