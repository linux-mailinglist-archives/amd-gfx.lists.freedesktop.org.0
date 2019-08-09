Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0687253
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 08:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784976ED00;
	Fri,  9 Aug 2019 06:42:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810074.outbound.protection.outlook.com [40.107.81.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972B6ED00
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 06:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWqDR72zLGOpglOvuyXHSVi22LI+Se+O0rMqqccQFDVMJT9eASN0P/D0XLvKORi4Mu7ZWR313aUID+1JPxE7AcnPlmhqMayW2hMIZnjk09bq1UzKVSqqU2/SlcgirMaQI3Y3OvHljvEERi58JvsjSMpL1pj+IXNtPqCtrac9tuJYbKQGX4LBgDQy4fk/zCgCkRfcoHRsu8TUdZORJWetE15MhrEg/MaXeY4vVRrkeX7FjHAc4EIhCVnGpMKeKUZR3e8e+GMo7u/h3J0wV/0J6a7okHvcD+Eu2qqyG7cq5chHWTuVTHwbTCKFmSOmSKIJbqwBp3GiMkPTchHFT7qszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5DbhkJAnnI5ck5ukLnmy6SPWf/0+n7O3wFMKI8a2Pc=;
 b=C/PU58JE/2mwOjB8EEzISK9nKIn6faQCSn99rUZy4FeVr1jsfjli+FNqNvUiZp2who32j9y64C1nOWDouCvZq88kJt0TBX9Of7YsWmBbYAPRTrljM7q17lU949iQgBaR4NKyAudHS7sSEctBzSdexLl4kIDSBzaE9WoydlG1MlV2Q5TYmG2qIcxYa3t2z+Nct1lpNu01hqUCYy5wcfKD7Gib+0t7yTCWVxmN2jG9j7WphEBp5UpxaTMCB8DvMygx64CNTuOBrm6o42JthvXZXaEIxhUFzg0lefvOmG9dsleBKikgzuQkZ13jD/HZkajkaM0LscfgDffCzFpBHlw85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1131.namprd12.prod.outlook.com (10.168.236.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 06:42:36 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 06:42:36 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: remove RREG64/WREG64
Thread-Topic: [PATCH 2/2] drm/amdgpu: remove RREG64/WREG64
Thread-Index: AQHVTmr2ve4uJ8/03Um6iA+ZbS1cZqbyXmUA
Date: Fri, 9 Aug 2019 06:42:36 +0000
Message-ID: <69e84e8e-3128-ae71-63fa-096c943679aa@amd.com>
References: <20190809042731.30491-1-tao.zhou1@amd.com>
 <20190809042731.30491-2-tao.zhou1@amd.com>
In-Reply-To: <20190809042731.30491-2-tao.zhou1@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::30) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78d9313e-4d5a-4ebd-e6d4-08d71c94c3c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1131; 
x-ms-traffictypediagnostic: DM5PR12MB1131:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB113137A3DF689E39682B859C83D60@DM5PR12MB1131.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(199004)(189003)(486006)(476003)(8676002)(6246003)(53936002)(66946007)(478600001)(305945005)(36756003)(186003)(64126003)(46003)(110136005)(66476007)(11346002)(446003)(316002)(64756008)(66556008)(25786009)(58126008)(7736002)(2616005)(256004)(8936002)(71200400001)(71190400001)(66446008)(6512007)(31686004)(81166006)(86362001)(52116002)(6436002)(6486002)(31696002)(76176011)(6116002)(2906002)(6636002)(99286004)(81156014)(229853002)(65826007)(14454004)(5660300002)(102836004)(2501003)(386003)(65956001)(6506007)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1131;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kJB9RjMUzrgcCNIS6fK1ZpJVa8diYIabtORFFroYpWYCUT5q18/4m2s5o7ZaPmX78voCiYML6tFJB0NVTt1NbocqhuOsHS1zjEInq98oPLBbUBjM6kDDjtN+hsCVfLJgK34h+1RR8Lbn3CkPmRk9OyM/I2kvKPEA1ygmhEP142V2GgSehdak97s5TfRFRdmiXB8INhjmAUMpTJPKS1jhwstPe8w4IH+FRVT/S1P6RUd2aR2kYcpeQlUe6uiH9/s4ixWYPnoTxryRSE+WQ3FotXiJnCLEuB8XLKdHOHa68Zt+A9PUuA9nN7gScii+NE4HZXxHFjV7pFCqphdyyJg/d+WZ42Ylljjl6po7cLmPAd6fFaliaY42ZYgZ2ahUx/WiVaLW+Jke87qVrJYkVJLf5cFuhrDVQrD2YTRNWSfmoAo=
Content-ID: <697D79143E258140BDE0B88A322851A4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d9313e-4d5a-4ebd-e6d4-08d71c94c3c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 06:42:36.3583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RbXnz0NwMlqTqvizdJ7Fj5TBQbbnEK/VrPdhqYbTysOBG3S7HFB2IudRawYtRY0i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5DbhkJAnnI5ck5ukLnmy6SPWf/0+n7O3wFMKI8a2Pc=;
 b=FqQPFIyeGXW1gR86dwImjZErzqKt0VQxAwEUYvma3YgTV6SjRvoc+LkcT+MRLApV0lJQ/kEOswG3f1I/VoMBYDu+NsMNXarL4xuAwepIRx91QZ0bwuISFCO3rTRCIyeAjzVKLAkH0jzTXVzl4eYSJHnKRJ6BfONy859Imz80rqU=
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

QW0gMDkuMDguMTkgdW0gMDY6Mjcgc2NocmllYiBUYW8gWmhvdToNCj4gYXRvbWljIDY0IGJpdHMg
UkVHIG9wZXJhdGlvbnMgYXJlIHVzZWxlc3MgY3VycmVudGx5DQo+DQo+IFNpZ25lZC1vZmYtYnk6
IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgfCAgNCAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAzMyAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4gaW5kZXggZWQxYTIxN2U4NmU0Li5mNmFlNTY1MmIyZTUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+IEBAIC0xMDQyLDggKzEw
NDIsNiBAQCB2b2lkIGFtZGdwdV9tbV93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
aW50MzJfdCByZWcsIHVpbnQzMl90IHYsDQo+ICAgCQkgICAgdWludDMyX3QgYWNjX2ZsYWdzKTsN
Cj4gICB2b2lkIGFtZGdwdV9tbV93cmVnOChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWlu
dDMyX3Qgb2Zmc2V0LCB1aW50OF90IHZhbHVlKTsNCj4gICB1aW50OF90IGFtZGdwdV9tbV9ycmVn
OChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgb2Zmc2V0KTsNCj4gLXVpbnQ2
NF90IGFtZGdwdV9tbV9ycmVnNjQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90
IHJlZyk7DQo+IC12b2lkIGFtZGdwdV9tbV93cmVnNjQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQzMl90IHJlZywgdWludDY0X3Qgdik7DQo+ICAgDQo+ICAgdTMyIGFtZGdwdV9pb19y
cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcmVnKTsNCj4gICB2b2lkIGFtZGdw
dV9pb193cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcmVnLCB1MzIgdik7DQo+
IEBAIC0xMDcxLDggKzEwNjksNiBAQCBpbnQgZW11X3NvY19hc2ljX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOw0KPiAgICNkZWZpbmUgRFJFRzMyKHJlZykgcHJpbnRrKEtFUk5fSU5G
TyAiUkVHSVNURVI6ICIgI3JlZyAiIDogMHglMDhYXG4iLCBhbWRncHVfbW1fcnJlZyhhZGV2LCAo
cmVnKSwgMCkpDQo+ICAgI2RlZmluZSBXUkVHMzIocmVnLCB2KSBhbWRncHVfbW1fd3JlZyhhZGV2
LCAocmVnKSwgKHYpLCAwKQ0KPiAgICNkZWZpbmUgV1JFRzMyX0lEWChyZWcsIHYpIGFtZGdwdV9t
bV93cmVnKGFkZXYsIChyZWcpLCAodiksIEFNREdQVV9SRUdTX0lEWCkNCj4gLSNkZWZpbmUgUlJF
RzY0KHJlZykgYW1kZ3B1X21tX3JyZWc2NChhZGV2LCAocmVnKSkNCj4gLSNkZWZpbmUgV1JFRzY0
KHJlZywgdikgYW1kZ3B1X21tX3dyZWc2NChhZGV2LCAocmVnKSwgKHYpKQ0KPiAgICNkZWZpbmUg
UkVHX1NFVChGSUVMRCwgdikgKCgodikgPDwgRklFTEQjI19TSElGVCkgJiBGSUVMRCMjX01BU0sp
DQo+ICAgI2RlZmluZSBSRUdfR0VUKEZJRUxELCB2KSAoKCh2KSA8PCBGSUVMRCMjX1NISUZUKSAm
IEZJRUxEIyNfTUFTSykNCj4gICAjZGVmaW5lIFJSRUczMl9QQ0lFKHJlZykgYWRldi0+cGNpZV9y
cmVnKGFkZXYsIChyZWcpKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jDQo+IGluZGV4IDdlYjllMGI5MjM1YS4uMmY0M2M1OGY1ZDAzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBAIC0yNjIsMzkgKzI2
Miw2IEBAIHZvaWQgYW1kZ3B1X21tX3dyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVp
bnQzMl90IHJlZywgdWludDMyX3QgdiwNCj4gICAJfQ0KPiAgIH0NCj4gICANCj4gLS8qKg0KPiAt
ICogYW1kZ3B1X21tX3JyZWc2NCAtIHJlYWQgYSA2NCBiaXQgbWVtb3J5IG1hcHBlZCBJTyByZWdp
c3Rlcg0KPiAtICoNCj4gLSAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXINCj4gLSAqIEBy
ZWc6IGR3b3JkIGFsaWduZWQgcmVnaXN0ZXIgb2Zmc2V0DQo+IC0gKg0KPiAtICogUmV0dXJucyB0
aGUgNjQgYml0IHZhbHVlIGZyb20gdGhlIG9mZnNldCBzcGVjaWZpZWQuDQo+IC0gKi8NCj4gLXVp
bnQ2NF90IGFtZGdwdV9tbV9ycmVnNjQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQz
Ml90IHJlZykNCj4gLXsNCj4gLQlpZiAoKHJlZyAqIDQpIDwgYWRldi0+cm1taW9fc2l6ZSkNCj4g
LQkJcmV0dXJuIGF0b21pYzY0X3JlYWQoKGF0b21pYzY0X3QgKikoYWRldi0+cm1taW8gKyAocmVn
ICogNCkpKTsNCj4gLQllbHNlDQo+IC0JCUJVRygpOw0KPiAtfQ0KPiAtDQo+IC0vKioNCj4gLSAq
IGFtZGdwdV9tbV93cmVnNjQgLSB3cml0ZSB0byBhIDY0IGJpdCBtZW1vcnkgbWFwcGVkIElPIHJl
Z2lzdGVyDQo+IC0gKg0KPiAtICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KPiAtICog
QHJlZzogZHdvcmQgYWxpZ25lZCByZWdpc3RlciBvZmZzZXQNCj4gLSAqIEB2OiA2NCBiaXQgdmFs
dWUgdG8gd3JpdGUgdG8gdGhlIHJlZ2lzdGVyDQo+IC0gKg0KPiAtICogV3JpdGVzIHRoZSB2YWx1
ZSBzcGVjaWZpZWQgdG8gdGhlIG9mZnNldCBzcGVjaWZpZWQuDQo+IC0gKi8NCj4gLXZvaWQgYW1k
Z3B1X21tX3dyZWc2NChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1
aW50NjRfdCB2KQ0KPiAtew0KPiAtCWlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKQ0K
PiAtCQlhdG9taWM2NF9zZXQoKGF0b21pYzY0X3QgKikoYWRldi0+cm1taW8gKyAocmVnICogNCkp
LCB2KTsNCj4gLQllbHNlDQo+IC0JCUJVRygpOw0KPiAtfQ0KPiAtDQo+ICAgLyoqDQo+ICAgICog
YW1kZ3B1X2lvX3JyZWcgLSByZWFkIGFuIElPIHJlZ2lzdGVyDQo+ICAgICoNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
