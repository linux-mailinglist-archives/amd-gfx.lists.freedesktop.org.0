Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C781B007B
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Apr 2020 06:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1487B6E143;
	Mon, 20 Apr 2020 04:16:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750072.outbound.protection.outlook.com [40.107.75.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451566E143
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Apr 2020 04:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBHHiUpALvNvHmkya94bzcrc3Gkx/L0O9zrKsW6RQvf5HhI/PSuP6vJ4oYZbFvbypI2mRyQUuzB0IMpuM77dv2peTcIX+snrTOZgwOFHF92tjG+MMhSn3Y7SyNCmN35Kmuu1O3/S22xVyVH351m0TtjaedUky8FxrXkhA307uIRfLqawR135eUdW5BwwPkBtQN7Uc7Kd1ukrM9bKg7bLp2jRbRn/R+xuZuM89OnXRbFiV7GHJTkBeHrRh+EBtuU/vRfXaJHDab54DBOUucTAxLFJUiRXlc9k0iTGJccA1IrAYqNk0GMfQqqQH0ep5ZeCCt709w6gRCJOod1M5czCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caru6VcrVxB/mD0AnBsnpvENLW84O9dUnB0hKPSR+Ys=;
 b=QVfo/46OixLsqkJzgDFIN4e1ls6zGGYFfFG3txLHjJCHif56NpmxetklmHCZOPLDkYg9gk2sqVDUVFKJHEqrH3x+soj9ej4XtbWixd6s1xplgP945YiJhHGBOvPjrs9R4sOvDeXy/W1cnsLp1qsWxWdRIUYl7sn7MqjsYOP84e70JiNnlHi7M/Kwg0NK8hzjhQtbGQRIiiQPWuwllfEZRvWuoPXG6U6QhhKwxSA8Kw34xsMA5QaJ7vgM1eWUFciIApsM/hLNZWv1J5owa9BZ9mGdDy1rhs+u/jYDS7n+TrICy3zUWJzS8TG4u7drfyRhN5cGsBBz2nHAi43A5dVxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caru6VcrVxB/mD0AnBsnpvENLW84O9dUnB0hKPSR+Ys=;
 b=RIM5xfjB4hIr8hvk+wZQZMnD6JtQLInm7KtzI5CLJ9Tz5HqAM64oBrdPQlqLBjT5u3G1y2EIlCnQxy2TyaxztiispOCHUGJyPIV256t+kLYkmJ3eTWEDhdOOtoUaoEZFlGI1ApCJG9PwYXLiZEk7rHCq4Oc+TKvgxoykuNhEX3M=
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (2603:10b6:208:c9::27)
 by MN2PR12MB4565.namprd12.prod.outlook.com (2603:10b6:208:26b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Mon, 20 Apr
 2020 04:16:56 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::58b5:b730:f260:a425]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::58b5:b730:f260:a425%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 04:16:56 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Subject: RE: [PATCH] drm/amdgpu: refine kiq read register
Thread-Topic: [PATCH] drm/amdgpu: refine kiq read register
Thread-Index: AQHWFITfGzG8E2hClEmY6N5h5huwKqh9c68AgAP4JEA=
Date: Mon, 20 Apr 2020 04:16:56 +0000
Message-ID: <MN2PR12MB30396A22AD7B458762284BC7E5D40@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <20200417065310.21108-1-yttao@amd.com>
 <2359153a-853b-6cdd-acbc-21ff0fb0b473@amd.com>
In-Reply-To: <2359153a-853b-6cdd-acbc-21ff0fb0b473@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c51516b-6d2c-429e-7da3-08d7e4e1aa04
x-ms-traffictypediagnostic: MN2PR12MB4565:|MN2PR12MB4565:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4565A2380ADB2BE6F91AA0DFE5D40@MN2PR12MB4565.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3039.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(66556008)(316002)(186003)(2906002)(66446008)(5660300002)(110136005)(66476007)(64756008)(76116006)(478600001)(9686003)(55016002)(66946007)(6636002)(86362001)(4326008)(8936002)(71200400001)(26005)(6506007)(53546011)(7696005)(30864003)(81156014)(52536014)(33656002)(8676002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: asr/VXH85ImuYfNKfvKpatiFsWOVKY9wNxF3UDTrmCjUkg8bY0eVgYB3WfRUNAWqQo7LzAsI9lrDi0GfRFai/XPI/fV8n5d8z8qcp9jvnltxvADHO6FnZIUZihFr95hgIh2WCf03wnmjpEzSwuO8ACtUhIcEQ4XhgCk4PSFjImTi968LE6GGq53Lz4LIi99qBCyyHla86zY/0qzWiKz1oTw7Kag8WEl36RfB1gD3bieuxEdO6RnkNhB2QqefiLKjs/ogtH0/hqVMIyS8ZWhNAuNNpXCqkzmv2UG3n8S3zEe1QFXPeaLhrbjmFcIeRhoStea2iH0jDNYh2cMf8lIcrNN4bLvnRDbD84i75XYcgqIiW6sKFHBYEInOF2drac20qK92GPgqI/B2d7xLzs+h14QMsDvPCqbE2oHxpnHOMqRM/o3LrbyylruORyogZ+BU
x-ms-exchange-antispam-messagedata: DXa4gajcnKRReTBRTnugy0O8z5ryQU66MzTXZxdKhbLKg8eWKnq9BTlRVrFpIvSCNJpS70vMi2mvf/Yu0z+urC6W1WXc+nNu0VaI9oykurww5PalLl0nQ3uOlqI6JpRs6vCeCHMZhkLbxPxP5AYXYA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c51516b-6d2c-429e-7da3-08d7e4e1aa04
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 04:16:56.4991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmpiCJq02YAx2wPbE9ymY9tTltq3O3je9uLgZ+N++T3XT4qRT6IpFkob0fLNnNOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4565
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

SGkgRmVsaXgNCg0KTWFueSB0aGFua3MgZm9yIHlvdXIgcmV2aWV3LiBJIGhhdmUgbW9kaWZpZWQg
aXQgYWNjb3JkaW5nIHRvIHlvdXIgY29tbWVudHMgYW5kIHN1Z2dlc3Rpb24uDQoNCkJlc3QgUmVn
YXJkcw0KWWludGlhbiBUYW8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEt1
ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gDQpTZW50OiAyMDIw5bm0NOac
iDE35pelIDIzOjM5DQpUbzogVGFvLCBZaW50aWFuIDxZaW50aWFuLlRhb0BhbWQuY29tPjsgTGl1
LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPg0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiByZWZpbmUga2lxIHJlYWQgcmVn
aXN0ZXINCg0KQW0gMjAyMC0wNC0xNyB1bSAyOjUzIGEubS4gc2NocmllYiBZaW50aWFuIFRhbzoN
Cj4gQWNjb3JkaW5nIHRvIHRoZSBjdXJyZW50IGtpcSByZWFkIHJlZ2lzdGVyIG1ldGhvZCwgdGhl
cmUgd2lsbCBiZSByYWNlIA0KPiBjb25kaXRpb24gd2hlbiB1c2luZyBLSVEgdG8gcmVhZCByZWdp
c3RlciBpZiBtdWx0aXBsZSBjbGllbnRzIHdhbnQgdG8gDQo+IHJlYWQgYXQgc2FtZSB0aW1lIGp1
c3QgbGlrZSB0aGUgZXhwYW1wbGUgYmVsb3c6DQo+IDEuIGNsaWVudC1BIHN0YXJ0IHRvIHJlYWQg
UkVHLTAgdGhyb2d1aCBLSVEgMi4gY2xpZW50LUEgcG9sbCB0aGUgDQo+IHNlcW5vLTAgMy4gY2xp
ZW50LUIgc3RhcnQgdG8gcmVhZCBSRUctMSB0aHJvdWdoIEtJUSA0LiBjbGllbnQtQiBwb2xsIA0K
PiB0aGUgc2Vxbm8tMSA1LiB0aGUga2lxIGNvbXBsZXRlIHRoZXNlIHR3byByZWFkIG9wZXJhdGlv
biA2LiBjbGllbnQtQSANCj4gdG8gcmVhZCB0aGUgcmVnaXN0ZXIgYXQgdGhlIHdiIGJ1ZmZlciBh
bmQNCj4gICAgZ2V0IFJFRy0xIHZhbHVlDQo+DQo+IFRoZXJlZm9yZSwgZGlyZWN0bHkgbWFrZSBr
aXEgd3JpdGUgdGhlIHJlZ2lzdGVyIHZhbHVlIGF0IHRoZSByaW5nIA0KPiBidWZmZXIgdGhlbiB0
aGVyZSB3aWxsIGJlIG5vIHJhY2UgY29uZGl0aW9uIGZvciB0aGUgd2IgYnVmZmVyLg0KPg0KPiB2
Mjogc3VwcGx5IHRoZSByZWFkX2Nsb2NrIGFuZCBtb3ZlIHRoZSByZWdfdmFsX29mZnMgYmFjaw0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgIHwgMTEgKysrKy0tLS0t
LSAgDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaCAgfCAgMSAtICAN
Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCB8ICA1ICsrKy0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgIHwgMTQgKysrKystLS0t
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jICAgIHwgMTQgKysr
KystLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgIHwg
MjggKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDMzIGluc2Vy
dGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nZnguYw0KPiBpbmRleCBlYTU3NmI0MjYwYTQuLjRlMWMwMjM5ZTU2MSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYw0KPiBAQCAtMzA0LDEw
ICszMDQsNiBAQCBpbnQgYW1kZ3B1X2dmeF9raXFfaW5pdF9yaW5nKHN0cnVjdCBhbWRncHVfZGV2
aWNlIA0KPiAqYWRldiwNCj4gIA0KPiAgCXNwaW5fbG9ja19pbml0KCZraXEtPnJpbmdfbG9jayk7
DQo+ICANCj4gLQlyID0gYW1kZ3B1X2RldmljZV93Yl9nZXQoYWRldiwgJmtpcS0+cmVnX3ZhbF9v
ZmZzKTsNCj4gLQlpZiAocikNCj4gLQkJcmV0dXJuIHI7DQo+IC0NCj4gIAlyaW5nLT5hZGV2ID0g
TlVMTDsNCj4gIAlyaW5nLT5yaW5nX29iaiA9IE5VTEw7DQo+ICAJcmluZy0+dXNlX2Rvb3JiZWxs
ID0gdHJ1ZTsNCj4gQEAgLTMzMSw3ICszMjcsNiBAQCBpbnQgYW1kZ3B1X2dmeF9raXFfaW5pdF9y
aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlIA0KPiAqYWRldiwNCj4gIA0KPiAgdm9pZCBhbWRncHVf
Z2Z4X2tpcV9mcmVlX3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKSAgew0KPiAtCWFtZGdw
dV9kZXZpY2Vfd2JfZnJlZShyaW5nLT5hZGV2LCByaW5nLT5hZGV2LT5nZngua2lxLnJlZ192YWxf
b2Zmcyk7DQo+ICAJYW1kZ3B1X3JpbmdfZmluaShyaW5nKTsNCj4gIH0NCj4gIA0KPiBAQCAtNjc1
LDEyICs2NzAsMTQgQEAgdWludDMyX3QgYW1kZ3B1X2tpcV9ycmVnKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1aW50MzJfdCByZWcpDQo+ICAJdWludDMyX3Qgc2VxOw0KPiAgCXN0cnVjdCBh
bWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsNCj4gIAlzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcgPSAma2lxLT5yaW5nOw0KPiArCXVpbnQ2NF90IHJlZ192YWxfb2ZmcyA9IDA7DQo+ICAN
Cj4gIAlCVUdfT04oIXJpbmctPmZ1bmNzLT5lbWl0X3JyZWcpOw0KPiAgDQo+ICAJc3Bpbl9sb2Nr
X2lycXNhdmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7DQo+ICAJYW1kZ3B1X3JpbmdfYWxsb2Mo
cmluZywgMzIpOw0KPiAtCWFtZGdwdV9yaW5nX2VtaXRfcnJlZyhyaW5nLCByZWcpOw0KPiArCXJl
Z192YWxfb2ZmcyA9IChyaW5nLT53cHRyICYgcmluZy0+YnVmX21hc2spICsgMzA7DQoNCkkgdGhp
bmsgdGhhdCBzaG91bGQgYmUgKHJpbmctPndwdHIgKyAzMCkgJiByaW5nLT5idWZfbWFzay4gT3Ro
ZXJ3aXNlIHRoZSByZWdfdmFsX29mZnNldCBjYW4gYmUgcGFzdCB0aGUgZW5kIG9mIHRoZSByaW5n
Lg0KDQpCdXQgdGhhdCBzdGlsbCBsZWF2ZXMgYSBwcm9ibGVtIGlmIGFub3RoZXIgY29tbWFuZCBp
cyBzdWJtaXR0ZWQgdG8gdGhlIEtJUSBiZWZvcmUgeW91IHJlYWQgdGhlIHJldHVybmVkIHJlZ192
YWwgZnJvbSB0aGUgcmluZy4gWW91ciByZWdfdmFsIGNhbiBiZSBvdmVyd3JpdHRlbiBieSB0aGUg
bmV3IGNvbW1hbmQgYW5kIHlvdSBnZXQgdGhlIHdyb25nIHJlc3VsdC4gT3IgdGhlIGNvbW1hbmQg
Y2FuIGJlIG92ZXJ3cml0dGVuIHdpdGggdGhlIHJlZ192YWwsIHdoaWNoIHdpbGwgbW9zdCBsaWtl
bHkgaGFuZyB0aGUgQ1AuDQoNCllvdSBjb3VsZCBhbGxvY2F0ZSBzcGFjZSBvbiB0aGUgS0lRIHJp
bmcgd2l0aCBhIE5PUCBjb21tYW5kIHRvIHByZXZlbnQgdGhhdCBzcGFjZSBmcm9tIGJlaW5nIG92
ZXJ3cml0dGVuIGJ5IG90aGVyIGNvbW1hbmRzLg0KDQpSZWdhcmRzLA0KwqAgRmVsaXgNCg0KDQo+
ICsJYW1kZ3B1X3JpbmdfZW1pdF9ycmVnKHJpbmcsIHJlZywgcmVnX3ZhbF9vZmZzKTsNCj4gIAlh
bWRncHVfZmVuY2VfZW1pdF9wb2xsaW5nKHJpbmcsICZzZXEpOw0KPiAgCWFtZGdwdV9yaW5nX2Nv
bW1pdChyaW5nKTsNCj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZraXEtPnJpbmdfbG9jaywg
ZmxhZ3MpOyBAQCAtNzA3LDcgKzcwNCw3IEBAIA0KPiB1aW50MzJfdCBhbWRncHVfa2lxX3JyZWco
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHJlZykNCj4gIAlpZiAoY250ID4g
TUFYX0tJUV9SRUdfVFJZKQ0KPiAgCQlnb3RvIGZhaWxlZF9raXFfcmVhZDsNCj4gIA0KPiAtCXJl
dHVybiBhZGV2LT53Yi53YltraXEtPnJlZ192YWxfb2Zmc107DQo+ICsJcmV0dXJuIHJpbmctPnJp
bmdbcmVnX3ZhbF9vZmZzXTsNCj4gIA0KPiAgZmFpbGVkX2tpcV9yZWFkOg0KPiAgCXByX2Vycigi
ZmFpbGVkIHRvIHJlYWQgcmVnOiV4XG4iLCByZWcpOyBkaWZmIC0tZ2l0IA0KPiBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaCANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2Z4LmgNCj4gaW5kZXggNjM0NzQ2ODI5MDI0Li5lZTY5OGYwMjQ2ZDgg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgNCj4gQEAgLTEw
Myw3ICsxMDMsNiBAQCBzdHJ1Y3QgYW1kZ3B1X2tpcSB7DQo+ICAJc3RydWN0IGFtZGdwdV9yaW5n
CXJpbmc7DQo+ICAJc3RydWN0IGFtZGdwdV9pcnFfc3JjCWlycTsNCj4gIAljb25zdCBzdHJ1Y3Qg
a2lxX3BtNF9mdW5jcyAqcG1mOw0KPiAtCXVpbnQzMl90CQkJcmVnX3ZhbF9vZmZzOw0KPiAgfTsN
Cj4gIA0KPiAgLyoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yaW5nLmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jpbmcu
aA0KPiBpbmRleCBmNjE2NjRlZTQ5NDAuLmEzZDg4ZjJhYTlmNCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oDQo+IEBAIC0xODEsNyArMTgxLDggQEAgc3Ry
dWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHsNCj4gIAl2b2lkICgqZW5kX3VzZSkoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nKTsNCj4gIAl2b2lkICgqZW1pdF9zd2l0Y2hfYnVmZmVyKSAoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nKTsNCj4gIAl2b2lkICgqZW1pdF9jbnR4Y250bCkgKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZywgdWludDMyX3QgZmxhZ3MpOw0KPiAtCXZvaWQgKCplbWl0X3JyZWcpKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgcmVnKTsNCj4gKwl2b2lkICgqZW1pdF9y
cmVnKShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZywNCj4gKwkJCSAgdWlu
dDY0X3QgcmVnX3ZhbF9vZmZzKTsNCj4gIAl2b2lkICgqZW1pdF93cmVnKShzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdmFsKTsNCj4gIAl2b2lkICgqZW1p
dF9yZWdfd2FpdCkoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCByZWcsDQo+ICAJ
CQkgICAgICB1aW50MzJfdCB2YWwsIHVpbnQzMl90IG1hc2spOyBAQCAtMjY1LDcgKzI2Niw3IEBA
IHN0cnVjdCANCj4gYW1kZ3B1X3JpbmcgeyAgI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X2hkcF9m
bHVzaChyKSANCj4gKHIpLT5mdW5jcy0+ZW1pdF9oZHBfZmx1c2goKHIpKSAgI2RlZmluZSANCj4g
YW1kZ3B1X3JpbmdfZW1pdF9zd2l0Y2hfYnVmZmVyKHIpIChyKS0+ZnVuY3MtPmVtaXRfc3dpdGNo
X2J1ZmZlcigocikpDQo+ICAjZGVmaW5lIGFtZGdwdV9yaW5nX2VtaXRfY250eGNudGwociwgZCkg
DQo+IChyKS0+ZnVuY3MtPmVtaXRfY250eGNudGwoKHIpLCAoZCkpIC0jZGVmaW5lIGFtZGdwdV9y
aW5nX2VtaXRfcnJlZyhyLCANCj4gZCkgKHIpLT5mdW5jcy0+ZW1pdF9ycmVnKChyKSwgKGQpKQ0K
PiArI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X3JyZWcociwgZCwgbykgKHIpLT5mdW5jcy0+ZW1p
dF9ycmVnKChyKSwgDQo+ICsoZCksIChvKSkNCj4gICNkZWZpbmUgYW1kZ3B1X3JpbmdfZW1pdF93
cmVnKHIsIGQsIHYpIChyKS0+ZnVuY3MtPmVtaXRfd3JlZygociksIA0KPiAoZCksICh2KSkgICNk
ZWZpbmUgYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd2FpdChyLCBkLCB2LCBtKSANCj4gKHIpLT5mdW5j
cy0+ZW1pdF9yZWdfd2FpdCgociksIChkKSwgKHYpLCAobSkpICAjZGVmaW5lIA0KPiBhbWRncHVf
cmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdChyLCBkMCwgZDEsIHYsIG0pIA0KPiAociktPmZ1
bmNzLT5lbWl0X3JlZ193cml0ZV9yZWdfd2FpdCgociksIChkMCksIChkMSksICh2KSwgKG0pKSBk
aWZmIA0KPiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIA0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQo+IGluZGV4IDBhMDNl
MmFkNWQ5NS4uN2M5YTVlNDQwNTA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYw0KPiBAQCAtNzU5NCwyMSArNzU5NCwxOSBAQCBzdGF0aWMgdm9pZCBnZnhfdjEw
XzBfcmluZ19lbWl0X2ZyYW1lX2NudGwoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBib29sIHN0
YXJ0LA0KPiAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIHYgfCBGUkFNRV9DTUQoc3RhcnQgPyAw
IDogMSkpOyAgfQ0KPiAgDQo+IC1zdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X3JyZWco
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCANCj4gdWludDMyX3QgcmVnKQ0KPiArc3RhdGljIHZv
aWQgZ2Z4X3YxMF8wX3JpbmdfZW1pdF9ycmVnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWlu
dDMyX3QgcmVnLA0KPiArCQkJCSAgICAgdWludDY0X3QgcmVnX3ZhbF9vZmZzKQ0KPiAgew0KPiAt
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcmluZy0+YWRldjsNCj4gLQlzdHJ1Y3QgYW1k
Z3B1X2tpcSAqa2lxID0gJmFkZXYtPmdmeC5raXE7DQo+IC0NCj4gIAlhbWRncHVfcmluZ193cml0
ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfQ09QWV9EQVRBLCA0KSk7DQo+ICAJYW1kZ3B1X3Jpbmdf
d3JpdGUocmluZywgMCB8CS8qIHNyYzogcmVnaXN0ZXIqLw0KPiAgCQkJCSg1IDw8IDgpIHwJLyog
ZHN0OiBtZW1vcnkgKi8NCj4gIAkJCQkoMSA8PCAyMCkpOwkvKiB3cml0ZSBjb25maXJtICovDQo+
ICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgcmVnKTsNCj4gIAlhbWRncHVfcmluZ193cml0ZShy
aW5nLCAwKTsNCj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBsb3dlcl8zMl9iaXRzKGFkZXYt
PndiLmdwdV9hZGRyICsNCj4gLQkJCQlraXEtPnJlZ192YWxfb2ZmcyAqIDQpKTsNCj4gLQlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4g
LQkJCQlraXEtPnJlZ192YWxfb2ZmcyAqIDQpKTsNCj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5n
LCBsb3dlcl8zMl9iaXRzKHJpbmctPmdwdV9hZGRyICsNCj4gKwkJCQkJICAgICAgcmVnX3ZhbF9v
ZmZzICogNCkpOw0KPiArCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIHVwcGVyXzMyX2JpdHMocmlu
Zy0+Z3B1X2FkZHIgKw0KPiArCQkJCQkgICAgICByZWdfdmFsX29mZnMgKiA0KSk7DQo+ICB9DQo+
ICANCj4gIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9yaW5nX2VtaXRfd3JlZyhzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIA0KPiB1aW50MzJfdCByZWcsIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OF8wLmMNCj4gaW5kZXggZmM2YzJmMmJjNzZjLi44ZTdlZWU3ODM4ZTAgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KPiBAQCAtNjM4MywyMSArNjM4Mywx
OSBAQCBzdGF0aWMgdm9pZCBnZnhfdjhfMF9yaW5nX2VtaXRfcGF0Y2hfY29uZF9leGVjKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZywgdW5zaWduZQ0KPiAgCQlyaW5nLT5yaW5nW29mZnNldF0gPSAo
cmluZy0+cmluZ19zaXplID4+IDIpIC0gb2Zmc2V0ICsgY3VyOyAgfQ0KPiAgDQo+IC1zdGF0aWMg
dm9pZCBnZnhfdjhfMF9yaW5nX2VtaXRfcnJlZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIA0K
PiB1aW50MzJfdCByZWcpDQo+ICtzdGF0aWMgdm9pZCBnZnhfdjhfMF9yaW5nX2VtaXRfcnJlZyhz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZywNCj4gKwkJCQkgICAgdWludDY0
X3QgcmVnX3ZhbF9vZmZzKQ0KPiAgew0KPiAtCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
cmluZy0+YWRldjsNCj4gLQlzdHJ1Y3QgYW1kZ3B1X2tpcSAqa2lxID0gJmFkZXYtPmdmeC5raXE7
DQo+IC0NCj4gIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfQ09QWV9E
QVRBLCA0KSk7DQo+ICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCB8CS8qIHNyYzogcmVnaXN0
ZXIqLw0KPiAgCQkJCSg1IDw8IDgpIHwJLyogZHN0OiBtZW1vcnkgKi8NCj4gIAkJCQkoMSA8PCAy
MCkpOwkvKiB3cml0ZSBjb25maXJtICovDQo+ICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgcmVn
KTsNCj4gIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4gLQlhbWRncHVfcmluZ193cml0
ZShyaW5nLCBsb3dlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4gLQkJCQlraXEtPnJl
Z192YWxfb2ZmcyAqIDQpKTsNCj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9i
aXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4gLQkJCQlraXEtPnJlZ192YWxfb2ZmcyAqIDQpKTsN
Cj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBsb3dlcl8zMl9iaXRzKHJpbmctPmdwdV9hZGRy
ICsNCj4gKwkJCQkJICAgICAgcmVnX3ZhbF9vZmZzICogNCkpOw0KPiArCWFtZGdwdV9yaW5nX3dy
aXRlKHJpbmcsIHVwcGVyXzMyX2JpdHMocmluZy0+Z3B1X2FkZHIgKw0KPiArCQkJCQkgICAgICBy
ZWdfdmFsX29mZnMgKiA0KSk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGdmeF92OF8wX3Jp
bmdfZW1pdF93cmVnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgDQo+IHVpbnQzMl90IHJlZywg
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiBpbmRleCA4NGZjZjg0MjMx
NmQuLmZmMjc5YjFmNWMyNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jDQo+IEBAIC00MDQ2LDExICs0MDQ2LDEzIEBAIHN0YXRpYyB1aW50NjRfdCBnZnhfdjlfMF9r
aXFfcmVhZF9jbG9jayhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gIAl1aW50MzJfdCBz
ZXE7DQo+ICAJc3RydWN0IGFtZGdwdV9raXEgKmtpcSA9ICZhZGV2LT5nZngua2lxOw0KPiAgCXN0
cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZraXEtPnJpbmc7DQo+ICsJdWludDY0X3QgcmVnX3Zh
bF9vZmZzID0gMDsNCj4gIA0KPiAgCUJVR19PTighcmluZy0+ZnVuY3MtPmVtaXRfcnJlZyk7DQo+
ICANCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgma2lxLT5yaW5nX2xvY2ssIGZsYWdzKTsNCj4gIAlh
bWRncHVfcmluZ19hbGxvYyhyaW5nLCAzMik7DQo+ICsJcmVnX3ZhbF9vZmZzID0gKHJpbmctPndw
dHIgJiByaW5nLT5idWZfbWFzaykgKyAzMDsNCj4gIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQ
QUNLRVQzKFBBQ0tFVDNfQ09QWV9EQVRBLCA0KSk7DQo+ICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgOSB8CS8qIHNyYzogcmVnaXN0ZXIqLw0KPiAgCQkJCSg1IDw8IDgpIHwJLyogZHN0OiBtZW1v
cnkgKi8NCj4gQEAgLTQwNTgsMTAgKzQwNjAsMTAgQEAgc3RhdGljIHVpbnQ2NF90IGdmeF92OV8w
X2tpcV9yZWFkX2Nsb2NrKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgCQkJCSgxIDw8
IDIwKSk7CS8qIHdyaXRlIGNvbmZpcm0gKi8NCj4gIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAw
KTsNCj4gIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4gLQlhbWRncHVfcmluZ193cml0
ZShyaW5nLCBsb3dlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4gLQkJCQlraXEtPnJl
Z192YWxfb2ZmcyAqIDQpKTsNCj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9i
aXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4gLQkJCQlraXEtPnJlZ192YWxfb2ZmcyAqIDQpKTsN
Cj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBsb3dlcl8zMl9iaXRzKHJpbmctPmdwdV9hZGRy
ICsNCj4gKwkJCQkJICAgICAgcmVnX3ZhbF9vZmZzICogNCkpOw0KPiArCWFtZGdwdV9yaW5nX3dy
aXRlKHJpbmcsIHVwcGVyXzMyX2JpdHMocmluZy0+Z3B1X2FkZHIgKw0KPiArCQkJCQkgICAgICBy
ZWdfdmFsX29mZnMgKiA0KSk7DQo+ICAJYW1kZ3B1X2ZlbmNlX2VtaXRfcG9sbGluZyhyaW5nLCAm
c2VxKTsNCj4gIAlhbWRncHVfcmluZ19jb21taXQocmluZyk7DQo+ICAJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgma2lxLT5yaW5nX2xvY2ssIGZsYWdzKTsgQEAgLTQwODgsOCArNDA5MCw4IA0KPiBA
QCBzdGF0aWMgdWludDY0X3QgZ2Z4X3Y5XzBfa2lxX3JlYWRfY2xvY2soc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQo+ICAJaWYgKGNudCA+IE1BWF9LSVFfUkVHX1RSWSkNCj4gIAkJZ290byBm
YWlsZWRfa2lxX3JlYWQ7DQo+ICANCj4gLQlyZXR1cm4gKHVpbnQ2NF90KWFkZXYtPndiLndiW2tp
cS0+cmVnX3ZhbF9vZmZzXSB8DQo+IC0JCSh1aW50NjRfdClhZGV2LT53Yi53YltraXEtPnJlZ192
YWxfb2ZmcyArIDEgXSA8PCAzMlVMTDsNCj4gKwlyZXR1cm4gKHVpbnQ2NF90KXJpbmctPnJpbmdb
cmVnX3ZhbF9vZmZzXSB8DQo+ICsJCSh1aW50NjRfdClyaW5nLT5yaW5nW3JlZ192YWxfb2ZmcyAr
IDEgXSA8PCAzMlVMTDsNCj4gIA0KPiAgZmFpbGVkX2tpcV9yZWFkOg0KPiAgCXByX2VycigiZmFp
bGVkIHRvIHJlYWQgZ3B1IGNsb2NrXG4iKTsgQEAgLTU0ODIsMjEgKzU0ODQsMTkgQEAgc3RhdGlj
IA0KPiB2b2lkIGdmeF92OV8wX3JpbmdfZW1pdF9wYXRjaF9jb25kX2V4ZWMoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLCB1bnNpZ25lDQo+ICAJCXJpbmctPnJpbmdbb2Zmc2V0XSA9IChyaW5nLT5y
aW5nX3NpemU+PjIpIC0gb2Zmc2V0ICsgY3VyOyAgfQ0KPiAgDQo+IC1zdGF0aWMgdm9pZCBnZnhf
djlfMF9yaW5nX2VtaXRfcnJlZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIA0KPiB1aW50MzJf
dCByZWcpDQo+ICtzdGF0aWMgdm9pZCBnZnhfdjlfMF9yaW5nX2VtaXRfcnJlZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZywNCj4gKwkJCQkgICAgdWludDY0X3QgcmVnX3Zh
bF9vZmZzKQ0KPiAgew0KPiAtCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcmluZy0+YWRl
djsNCj4gLQlzdHJ1Y3QgYW1kZ3B1X2tpcSAqa2lxID0gJmFkZXYtPmdmeC5raXE7DQo+IC0NCj4g
IAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfQ09QWV9EQVRBLCA0KSk7
DQo+ICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCB8CS8qIHNyYzogcmVnaXN0ZXIqLw0KPiAg
CQkJCSg1IDw8IDgpIHwJLyogZHN0OiBtZW1vcnkgKi8NCj4gIAkJCQkoMSA8PCAyMCkpOwkvKiB3
cml0ZSBjb25maXJtICovDQo+ICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgcmVnKTsNCj4gIAlh
bWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBs
b3dlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4gLQkJCQlraXEtPnJlZ192YWxfb2Zm
cyAqIDQpKTsNCj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9iaXRzKGFkZXYt
PndiLmdwdV9hZGRyICsNCj4gLQkJCQlraXEtPnJlZ192YWxfb2ZmcyAqIDQpKTsNCj4gKwlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCBsb3dlcl8zMl9iaXRzKHJpbmctPmdwdV9hZGRyICsNCj4gKwkJ
CQkJICAgICAgcmVnX3ZhbF9vZmZzICogNCkpOw0KPiArCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IHVwcGVyXzMyX2JpdHMocmluZy0+Z3B1X2FkZHIgKw0KPiArCQkJCQkgICAgICByZWdfdmFsX29m
ZnMgKiA0KSk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGdmeF92OV8wX3JpbmdfZW1pdF93
cmVnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgDQo+IHVpbnQzMl90IHJlZywNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
