Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 403FAD952E
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 17:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F5989EF7;
	Wed, 16 Oct 2019 15:12:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe42::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C889EF7
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 15:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjM/uW/tAPgxOnaoITZr+au/nqMpw5DC3FVb9M5zzNCSLYUicVXKPesbsyZBntJlWaoSwC62aOzZ9uGVxGlS51ZHTmRBOZKx9DQX66gV8kec1KEyjsW8Pg/Uf/JRmOdJgUPDgZbcO7yRd+gamEOinPF5l1OZ11j8gFIhwADHVT/b5aXrexigReNb90tTkOZVVb8wcr1sOgh3jBVA7BjUr7XeA0KNAV7T1dGJHoAtvHCW0Z8kHZ2NE0XFRPWFP1ktqXzuc0XU2PidEqbTHJwu7r2z/8/mUW7HEUIUIzzpNpU5pzLUpd7oVpOC8amrmreJ6sxevBzFvrQjd+MYuzSQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g/kf/oaiG33P1dqwruDk5keUTuuyTEn/UXDtFdv0rc=;
 b=gPQCtvnt+AN01pwNzSL+z3fOqmSHVx59z5wtAIfrh5x1TrMWTCIBff6kA6Ehk/ObYwTmNk5LnnaI6OF4MGPyg57lxZSVpt22UG/wnBtssDIb+rlz51gPEHfsYJTlqZcfmWmaHsq9rW7WdoC9Ws3c2NkuW5ov4g/qrFlRwzjEJGK4hqFzFb/n5ubL/B72TDte6iT2MQWIetl7fCPV2Mj4bkWDtNuOpeTwCUU6F/GgAHUn/nTEtDHyncCUb7vRwygytD9ylnECRoSo96sJrK2ggqQ/qEb8U3udYzOGKigtkp7+u3ETeXIUN6v8u8RpjL2oUU4lYM6oStTm8gXth6k/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 15:12:34 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Wed, 16 Oct
 2019 15:12:34 +0000
From: James Zhu <jamesz@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amdgpu/uvd6: fix allocation size in enc ring test
 (v2)
Thread-Topic: [PATCH 1/3] drm/amdgpu/uvd6: fix allocation size in enc ring
 test (v2)
Thread-Index: AQHVg6Z+XoPwUBDWmkiWqkgm52FI6qddYPWA
Date: Wed, 16 Oct 2019 15:12:33 +0000
Message-ID: <880ce9cd-fefa-b684-b137-0adb88e014ab@amd.com>
References: <20191015221813.625024-1-alexander.deucher@amd.com>
In-Reply-To: <20191015221813.625024-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19d8b12c-2d17-4bf0-f559-08d7524b4568
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1653:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR12MB1653306808C14BA3DF9FE30BE4920@CY4PR12MB1653.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(6306002)(81156014)(316002)(81166006)(6246003)(6512007)(486006)(26005)(3846002)(8936002)(31696002)(14454004)(71200400001)(71190400001)(6116002)(8676002)(5640700003)(36756003)(66476007)(64756008)(66556008)(66946007)(66446008)(476003)(11346002)(66066001)(446003)(2616005)(4001150100001)(6916009)(7736002)(229853002)(52116002)(305945005)(99286004)(256004)(186003)(2906002)(25786009)(102836004)(966005)(31686004)(2351001)(6436002)(5660300002)(2501003)(386003)(6506007)(6486002)(53546011)(76176011)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1653;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VUUQRlcUfoXC8prfbgfxv/WgxAWiIg/67zaMZFbl7UDz8B02zsDs2IqvTV+PscoGAsdIanNUHmwahp4LX4fVA/vH3owpODlEPl5TxP7YRgvcmjHb/6nSg/MR1xPxuWQxW+pJY2g5TtMZsPK8gFW1p9ieTnGeSyQ43a/NrgRAZNDwePhoJzj8LfmFEqstnB288yLKsCwBhagSe44UizuWqai4teKO52n2gtARjOzJTInGZj2OlecE0crXqQUeynuHa1mC18/6n8Rt/KTbzvkaAkWEi+wWnAcY+EUEdgSrI2B03i0Oa1hFHWTPSI7A+WCNJkstSC62Cqs3v4IE8zxi2337n/RHwEDIz7aCPZlpFJQofMoNLSgH964ZwgNuowtBAzcyDqDAlAc8l2Lo52VbCXXKlkGixobwNvv5WQvrxFBWi/qDc+NFrn2JnUEbJS6kSadLth9yJcHtEXtgHrI/sg==
x-ms-exchange-transport-forked: True
Content-ID: <D39F07BCAD4FE944862CB17D9CB7E4BC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d8b12c-2d17-4bf0-f559-08d7524b4568
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 15:12:33.9684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xig79/Q7f8sxbVQ62UxHM4FIfx6mtRzNQwfkwN/cOdLf02TVF3XkSKUgFHhxW369
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1653
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g/kf/oaiG33P1dqwruDk5keUTuuyTEn/UXDtFdv0rc=;
 b=M4ewdiIf3lfuOs+zbR/dYsMTD6jmtU3/DlZ/OcFG2un4n5IArBP/rnEfn8kY2JK/0AFiXCOXg2iy+2MkspwMYgvCsPU8kXqd8HPUsSDKouUB+0warsQvqF23NxyhYCqCU42zCPLcWaGURA2oCaYH98lSHFDTUc1rWyJtfoh+sfw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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

UmV2aWV3ZWQtYnk6IEphbWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+IGZvciB0aGlzIHNlcmll
cw0KVGVzdGVkLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPiBmb3IgdGhpcyBzZXJp
ZXMNCg0KSmFtZXMNCg0KT24gMjAxOS0xMC0xNSA2OjE4IHAubS4sIEFsZXggRGV1Y2hlciB3cm90
ZToNCj4gV2UgbmVlZCB0byBhbGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBidWZmZXIgZm9yIHRoZQ0K
PiBzZXNzaW9uIGluZm8sIG90aGVyd2lzZSB0aGUgSUIgdGVzdCBjYW4gb3ZlcndyaXRlDQo+IG90
aGVyIG1lbW9yeS4NCj4NCj4gdjI6IC0gc2Vzc2lvbiBpbmZvIGlzIDEyOEsgYWNjb3JkaW5nIHRv
IG1lc2ENCj4gICAgICAtIHVzZSB0aGUgc2FtZSBzZXNzaW9uIGluZm8gZm9yIGNyZWF0ZSBhbmQg
ZGVzdHJveQ0KPg0KPiBCdWc6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjA0MjQxDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y2XzAuYyB8IDMxICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjZfMC5jDQo+IGluZGV4IDY3MDc4NGE3ODUxMi4uMjE3MDg0ZDU2YWI4
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCj4gQEAgLTIwNiwx
MyArMjA2LDE0IEBAIHN0YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX3JpbmdfdGVzdF9yaW5nKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZykNCj4gICAgKiBPcGVuIHVwIGEgc3RyZWFtIGZvciBIVyB0ZXN0
DQo+ICAgICovDQo+ICAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2NyZWF0ZV9tc2coc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUsDQo+ICsJCQkJICAgICAgIHN0
cnVjdCBhbWRncHVfYm8gKmJvLA0KPiAgIAkJCQkgICAgICAgc3RydWN0IGRtYV9mZW5jZSAqKmZl
bmNlKQ0KPiAgIHsNCj4gICAJY29uc3QgdW5zaWduZWQgaWJfc2l6ZV9kdyA9IDE2Ow0KPiAgIAlz
dHJ1Y3QgYW1kZ3B1X2pvYiAqam9iOw0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X2liICppYjsNCj4gICAJ
c3RydWN0IGRtYV9mZW5jZSAqZiA9IE5VTEw7DQo+IC0JdWludDY0X3QgZHVtbXk7DQo+ICsJdWlu
dDY0X3QgYWRkcjsNCj4gICAJaW50IGksIHI7DQo+ICAgDQo+ICAgCXIgPSBhbWRncHVfam9iX2Fs
bG9jX3dpdGhfaWIocmluZy0+YWRldiwgaWJfc2l6ZV9kdyAqIDQsICZqb2IpOw0KPiBAQCAtMjIw
LDE1ICsyMjEsMTUgQEAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2NyZWF0ZV9tc2coc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUNCj4gICAJCXJldHVybiByOw0K
PiAgIA0KPiAgIAlpYiA9ICZqb2ItPmlic1swXTsNCj4gLQlkdW1teSA9IGliLT5ncHVfYWRkciAr
IDEwMjQ7DQo+ICsJYWRkciA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KGJvKTsNCj4gICANCj4gICAJ
aWItPmxlbmd0aF9kdyA9IDA7DQo+ICAgCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAw
MDAwMTg7DQo+ICAgCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMDE7IC8qIHNl
c3Npb24gaW5mbyAqLw0KPiAgIAlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSBoYW5kbGU7DQo+
ICAgCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMTAwMDA7DQo+IC0JaWItPnB0cltp
Yi0+bGVuZ3RoX2R3KytdID0gdXBwZXJfMzJfYml0cyhkdW1teSk7DQo+IC0JaWItPnB0cltpYi0+
bGVuZ3RoX2R3KytdID0gZHVtbXk7DQo+ICsJaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gdXBw
ZXJfMzJfYml0cyhhZGRyKTsNCj4gKwlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSBhZGRyOw0K
PiAgIA0KPiAgIAlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSAweDAwMDAwMDE0Ow0KPiAgIAlp
Yi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSAweDAwMDAwMDAyOyAvKiB0YXNrIGluZm8gKi8NCj4g
QEAgLTI2OCwxMyArMjY5LDE0IEBAIHN0YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX2dldF9jcmVhdGVf
bXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlDQo+ICAgICovDQo+
ICAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywNCj4gICAJCQkJCXVpbnQzMl90IGhhbmRsZSwNCj4gKwkJCQkJc3RydWN0IGFt
ZGdwdV9ibyAqYm8sDQo+ICAgCQkJCQlzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpDQo+ICAgew0K
PiAgIAljb25zdCB1bnNpZ25lZCBpYl9zaXplX2R3ID0gMTY7DQo+ICAgCXN0cnVjdCBhbWRncHVf
am9iICpqb2I7DQo+ICAgCXN0cnVjdCBhbWRncHVfaWIgKmliOw0KPiAgIAlzdHJ1Y3QgZG1hX2Zl
bmNlICpmID0gTlVMTDsNCj4gLQl1aW50NjRfdCBkdW1teTsNCj4gKwl1aW50NjRfdCBhZGRyOw0K
PiAgIAlpbnQgaSwgcjsNCj4gICANCj4gICAJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihy
aW5nLT5hZGV2LCBpYl9zaXplX2R3ICogNCwgJmpvYik7DQo+IEBAIC0yODIsMTUgKzI4NCwxNSBA
QCBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19nZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nLA0KPiAgIAkJcmV0dXJuIHI7DQo+ICAgDQo+ICAgCWliID0gJmpvYi0+aWJzWzBd
Ow0KPiAtCWR1bW15ID0gaWItPmdwdV9hZGRyICsgMTAyNDsNCj4gKwlhZGRyID0gYW1kZ3B1X2Jv
X2dwdV9vZmZzZXQoYm8pOw0KPiAgIA0KPiAgIAlpYi0+bGVuZ3RoX2R3ID0gMDsNCj4gICAJaWIt
PnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsNCj4gICAJaWItPnB0cltpYi0+bGVu
Z3RoX2R3KytdID0gMHgwMDAwMDAwMTsgLyogc2Vzc2lvbiBpbmZvICovDQo+ICAgCWliLT5wdHJb
aWItPmxlbmd0aF9kdysrXSA9IGhhbmRsZTsNCj4gICAJaWItPnB0cltpYi0+bGVuZ3RoX2R3Kytd
ID0gMHgwMDAxMDAwMDsNCj4gLQlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSB1cHBlcl8zMl9i
aXRzKGR1bW15KTsNCj4gLQlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSBkdW1teTsNCj4gKwlp
Yi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSB1cHBlcl8zMl9iaXRzKGFkZHIpOw0KPiArCWliLT5w
dHJbaWItPmxlbmd0aF9kdysrXSA9IGFkZHI7DQo+ICAgDQo+ICAgCWliLT5wdHJbaWItPmxlbmd0
aF9kdysrXSA9IDB4MDAwMDAwMTQ7DQo+ICAgCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4
MDAwMDAwMDI7IC8qIHRhc2sgaW5mbyAqLw0KPiBAQCAtMzI3LDEzICszMjksMjAgQEAgc3RhdGlj
IGludCB1dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywNCj4gICBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19yaW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLCBsb25nIHRpbWVvdXQpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZG1hX2ZlbmNl
ICpmZW5jZSA9IE5VTEw7DQo+ICsJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBOVUxMOw0KPiAgIAls
b25nIHI7DQo+ICAgDQo+IC0JciA9IHV2ZF92Nl8wX2VuY19nZXRfY3JlYXRlX21zZyhyaW5nLCAx
LCBOVUxMKTsNCj4gKwlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZChyaW5nLT5hZGV2LCAx
MjggKiAxMDI0LCBQQUdFX1NJWkUsDQo+ICsJCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJB
TSwNCj4gKwkJCQkgICAgICAmYm8sIE5VTEwsIE5VTEwpOw0KPiArCWlmIChyKQ0KPiArCQlyZXR1
cm4gcjsNCj4gKw0KPiArCXIgPSB1dmRfdjZfMF9lbmNfZ2V0X2NyZWF0ZV9tc2cocmluZywgMSwg
Ym8sIE5VTEwpOw0KPiAgIAlpZiAocikNCj4gICAJCWdvdG8gZXJyb3I7DQo+ICAgDQo+IC0JciA9
IHV2ZF92Nl8wX2VuY19nZXRfZGVzdHJveV9tc2cocmluZywgMSwgJmZlbmNlKTsNCj4gKwlyID0g
dXZkX3Y2XzBfZW5jX2dldF9kZXN0cm95X21zZyhyaW5nLCAxLCBibywgJmZlbmNlKTsNCj4gICAJ
aWYgKHIpDQo+ICAgCQlnb3RvIGVycm9yOw0KPiAgIA0KPiBAQCAtMzQ1LDYgKzM1NCw4IEBAIHN0
YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJp
bmcsIGxvbmcgdGltZW91dCkNCj4gICANCj4gICBlcnJvcjoNCj4gICAJZG1hX2ZlbmNlX3B1dChm
ZW5jZSk7DQo+ICsJYW1kZ3B1X2JvX3VucmVzZXJ2ZShibyk7DQo+ICsJYW1kZ3B1X2JvX3VucmVm
KCZibyk7DQo+ICAgCXJldHVybiByOw0KPiAgIH0NCj4gICANCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
