Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E426980
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 20:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9482D89A9B;
	Wed, 22 May 2019 18:04:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730064.outbound.protection.outlook.com [40.107.73.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969BC89A9B
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 18:04:43 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0085.namprd12.prod.outlook.com (10.172.78.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 18:04:41 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 18:04:41 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/amd/display: Use new connector state when
 getting color depth
Thread-Topic: [PATCH v2 2/2] drm/amd/display: Use new connector state when
 getting color depth
Thread-Index: AQHVELeSUuUKsD+z4UqD9gdqyt8MgqZ3cBSA
Date: Wed, 22 May 2019 18:04:41 +0000
Message-ID: <b02792ef-f7c1-a9d3-782d-d241bdfe0f2e@amd.com>
References: <20190522160055.26665-1-nicholas.kazlauskas@amd.com>
 <20190522160055.26665-2-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190522160055.26665-2-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YT1PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::24)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71e198eb-1acc-479e-c5e7-08d6dedff663
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0085; 
x-ms-traffictypediagnostic: CY4PR1201MB0085:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB008516BE551AF15F7850587A8C000@CY4PR1201MB0085.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(136003)(39860400002)(376002)(396003)(199004)(189003)(76176011)(316002)(72206003)(966005)(478600001)(31696002)(68736007)(58126008)(110136005)(54906003)(99286004)(52116002)(14454004)(7736002)(6306002)(64756008)(66446008)(66556008)(71190400001)(305945005)(64126003)(73956011)(66946007)(6512007)(71200400001)(2501003)(66476007)(2616005)(65956001)(65806001)(26005)(14444005)(256004)(3846002)(6116002)(66066001)(11346002)(446003)(6506007)(53546011)(386003)(2906002)(65826007)(53936002)(36756003)(6246003)(6436002)(102836004)(186003)(25786009)(8676002)(5660300002)(8936002)(31686004)(476003)(229853002)(486006)(81156014)(81166006)(4326008)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0085;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lx8BPqIs57Bgm0PZLFcaw2AttjtX/Nsj3HbWPC9xni4OFnQ40x035plHGESprQGVJdPe9eAINz1vSU4H4iqQmyLjWQ1wfoaMMJe+abKXeNtdZ38i39IS/VuIWBhj0s5udaQW2erpI+fYYROxm55MQbNQC3xTLDWvfmkPcybPiNzDqCl6xkuJ1pqrpZLtYSLvnuxVGnCSYM1kv4vKAOzs1zElTouhWEID3+ND9As+HYZzTh6A2/Y2jfZmxo0OQu8shRwa6L+IfGqbBvXgeydWHfDZCgHff070sGnQr0B7PGHDOtdZ21U2Hs5fCgk69oGMh0Wx1RWwD5DWP7kcSIby3aB2ECP5yHuaZHUDUeekxG/v/tzGID0afJ27LCtn//VSX4gjYF6JiKLmfx0KfEPuZoCBOLwVrnmLPXpE4NL8Dxs=
Content-ID: <95F2761F87159345B90E39DD3178A153@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e198eb-1acc-479e-c5e7-08d6dedff663
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 18:04:41.6444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0085
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoHeu2dFK+xespkrorrVQOonGOFNaYd1CjLBikK83pk=;
 b=jJ1xe7DcKjMjcdYhoSd/EJoO57ywdI8z8tJ2+0J0CcbZu/p0Hq4YaRvE9Jh1piA+zclBmTLAykFo+oB4mQ31wsDBUy5F2rPzgcZhIPSaT8y15NiDydgdsNA90/FZTfCEpVFimfylQlMZwdkVwdfnKofEO5I5y9nmKvNbmsgwLCM=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMiAxMjowMCBwLm0uLCBOaWNob2xhcyBLYXpsYXVza2FzIHdyb3RlOg0KPiBb
Q0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+IA0KPiBbV2h5XQ0KPiBUaGUgY3VycmVudCBzdGF0
ZSBvbiB0aGUgY29ubmVjdG9yIGlzIHF1ZXJpZWQgd2hlbiBnZXR0aW5nIHRoZSBtYXggYnBjDQo+
IHJhdGhlciB0aGFuIHRoZSBuZXcgc3RhdGUuIFRoaXMgbWVhbnMgdGhhdCBhIG5ldyBtYXggYnBj
IHZhbHVlIGNhbiBvbmx5DQo+IGN1cnJlbnRseSB0YWtlIGVmZmVjdCBvbiB0aGUgY29tbWl0ICph
ZnRlciogaXQgY2hhbmdlcy4NCj4gDQo+IFRoZSBuZXcgc3RhdGUgc2hvdWxkIGJlIHBhc3NlZCBp
biBpbnN0ZWFkLg0KPiANCj4gW0hvd10NCj4gUGFzcyBkb3duIHRoZSBkbV9zdGF0ZSBhcyBkcm0g
c3RhdGUgdG8gd2hlcmUgd2UgZG8gY29sb3IgZGVwdGggbG9va3VwLg0KPiANCj4gVGhlIHBhc3Nl
ZCBpbiBzdGF0ZSBjYW4gc3RpbGwgYmUgTlVMTCB3aGVuIGNhbGxlZCBmcm9tDQo+IGFtZGdwdV9k
bV9jb25uZWN0b3JfbW9kZV92YWxpZCwgc28gbWFrZSBzdXJlIHRoYXQgd2UgaGF2ZSByZWFzb25h
YmxlDQo+IGRlZmF1bHRzIGluIHBsYWNlLiBUaGF0IHNob3VsZCBwcm9iYWJseSBiZSBhZGRyZXNz
ZWQgYXQgc29tZSBwb2ludC4NCj4gDQo+IFRoaXMgY2hhbmdlIG5vdyAoY29ycmVjdGx5KSBjYXVz
ZXMgYSBtb2Rlc2V0IHRvIG9jY3VyIHdoZW4gY2hhbmdpbmcgdGhlDQo+IG1heCBicGMgZm9yIGEg
Y29ubmVjdG9yLg0KPiANCj4gdjI6IERyb3AgZXh0cmEgVE9ETy4NCj4gDQo+IENjOiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4NCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xh
cy5rYXpsYXVza2FzQGFtZC5jb20+DQo+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+DQoNClNlcmllcyBpcw0KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRs
YW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpIYXJyeQ0KDQo+IC0tLQ0KPiAgLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMjcgKysrKysrKysrKy0t
LS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jDQo+IGluZGV4IGI4ZTg4MjA5ZWY1ZC4uZmQwNDIxNzk0ZTBmIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMNCj4gQEAgLTMwMzgsMTMgKzMwMzgsMTMgQEAgc3RhdGljIHZvaWQgdXBkYXRlX3N0cmVhbV9z
Y2FsaW5nX3NldHRpbmdzKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLA0KPiAg
fQ0KPiANCj4gIHN0YXRpYyBlbnVtIGRjX2NvbG9yX2RlcHRoDQo+IC1jb252ZXJ0X2NvbG9yX2Rl
cHRoX2Zyb21fZGlzcGxheV9pbmZvKGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpDQo+ICtjb252ZXJ0X2NvbG9yX2RlcHRoX2Zyb21fZGlzcGxheV9pbmZvKGNvbnN0IHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKnN0YXRlKQ0KPiAg
ew0KPiAgICAgICAgIHVpbnQzMl90IGJwYyA9IGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJwYzsN
Cj4gDQo+IC0gICAgICAgLyogVE9ETzogVXNlIHBhc3NlZCBpbiBzdGF0ZSBpbnN0ZWFkIG9mIHRo
ZSBjdXJyZW50IHN0YXRlLiAqLw0KPiAtICAgICAgIGlmIChjb25uZWN0b3ItPnN0YXRlKSB7DQo+
IC0gICAgICAgICAgICAgICBicGMgPSBjb25uZWN0b3ItPnN0YXRlLT5tYXhfYnBjOw0KPiArICAg
ICAgIGlmIChzdGF0ZSkgew0KPiArICAgICAgICAgICAgICAgYnBjID0gc3RhdGUtPm1heF9icGM7
DQo+ICAgICAgICAgICAgICAgICAvKiBSb3VuZCBkb3duIHRvIHRoZSBuZWFyZXN0IGV2ZW4gbnVt
YmVyLiAqLw0KPiAgICAgICAgICAgICAgICAgYnBjID0gYnBjIC0gKGJwYyAmIDEpOw0KPiAgICAg
ICAgIH0NCj4gQEAgLTMxNjUsMTEgKzMxNjUsMTIgQEAgc3RhdGljIHZvaWQgYWRqdXN0X2NvbG91
cl9kZXB0aF9mcm9tX2Rpc3BsYXlfaW5mbyhzdHJ1Y3QgZGNfY3J0Y190aW1pbmcgKnRpbWluZ18N
Cj4gDQo+ICB9DQo+IA0KPiAtc3RhdGljIHZvaWQNCj4gLWZpbGxfc3RyZWFtX3Byb3BlcnRpZXNf
ZnJvbV9kcm1fZGlzcGxheV9tb2RlKHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwNCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGVfaW4sDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Is
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBkY19zdHJlYW1fc3RhdGUgKm9sZF9zdHJlYW0pDQo+ICtzdGF0aWMgdm9pZCBmaWxsX3N0
cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZSgNCj4gKyAgICAgICBzdHJ1Y3Qg
ZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0sDQo+ICsgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGVfaW4sDQo+ICsgICAgICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciwNCj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAq
Y29ubmVjdG9yX3N0YXRlLA0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBkY19zdHJlYW1fc3RhdGUg
Km9sZF9zdHJlYW0pDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IGRjX2NydGNfdGltaW5nICp0aW1p
bmdfb3V0ID0gJnN0cmVhbS0+dGltaW5nOw0KPiAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9pbmZvICppbmZvID0gJmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvOw0KPiBAQCAtMzE5Miw3
ICszMTkzLDcgQEAgZmlsbF9zdHJlYW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5X21vZGUo
c3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLA0KPiANCj4gICAgICAgICB0aW1pbmdfb3V0
LT50aW1pbmdfM2RfZm9ybWF0ID0gVElNSU5HXzNEX0ZPUk1BVF9OT05FOw0KPiAgICAgICAgIHRp
bWluZ19vdXQtPmRpc3BsYXlfY29sb3JfZGVwdGggPSBjb252ZXJ0X2NvbG9yX2RlcHRoX2Zyb21f
ZGlzcGxheV9pbmZvKA0KPiAtICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3IpOw0KPiAr
ICAgICAgICAgICAgICAgY29ubmVjdG9yLCBjb25uZWN0b3Jfc3RhdGUpOw0KPiAgICAgICAgIHRp
bWluZ19vdXQtPnNjYW5fdHlwZSA9IFNDQU5OSU5HX1RZUEVfTk9EQVRBOw0KPiAgICAgICAgIHRp
bWluZ19vdXQtPmhkbWlfdmljID0gMDsNCj4gDQo+IEBAIC0zMzg5LDYgKzMzOTAsOCBAQCBjcmVh
dGVfc3RyZWFtX2Zvcl9zaW5rKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9y
LA0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpwcmVmZXJyZWRfbW9k
ZSA9IE5VTEw7DQo+ICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmRybV9jb25uZWN0b3I7
DQo+ICsgICAgICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbl9zdGF0ZSA9
DQo+ICsgICAgICAgICAgICAgICBkbV9zdGF0ZSA/ICZkbV9zdGF0ZS0+YmFzZSA6IE5VTEw7DQo+
ICAgICAgICAgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtID0gTlVMTDsNCj4gICAgICAg
ICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtb2RlID0gKmRybV9tb2RlOw0KPiAgICAgICAgIGJv
b2wgbmF0aXZlX21vZGVfZm91bmQgPSBmYWxzZTsNCj4gQEAgLTM0NjEsMTAgKzM0NjQsMTAgQEAg
Y3JlYXRlX3N0cmVhbV9mb3Jfc2luayhzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5l
Y3RvciwNCj4gICAgICAgICAqLw0KPiAgICAgICAgIGlmICghc2NhbGUgfHwgbW9kZV9yZWZyZXNo
ICE9IHByZWZlcnJlZF9yZWZyZXNoKQ0KPiAgICAgICAgICAgICAgICAgZmlsbF9zdHJlYW1fcHJv
cGVydGllc19mcm9tX2RybV9kaXNwbGF5X21vZGUoc3RyZWFtLA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIE5VTEwpOw0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIGNvbl9zdGF0ZSwgTlVMTCk7DQo+
ICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgICAgZmlsbF9zdHJlYW1fcHJvcGVydGllc19m
cm9tX2RybV9kaXNwbGF5X21vZGUoc3RyZWFtLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAm
bW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIG9sZF9zdHJlYW0pOw0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIGNvbl9zdGF0ZSwgb2xkX3N0cmVhbSk7
DQo+IA0KPiAgICAgICAgIHVwZGF0ZV9zdHJlYW1fc2NhbGluZ19zZXR0aW5ncygmbW9kZSwgZG1f
c3RhdGUsIHN0cmVhbSk7DQo+IA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0
DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPiANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
