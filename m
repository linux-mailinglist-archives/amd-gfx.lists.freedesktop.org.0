Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60418E03F7
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 14:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF70B6E789;
	Tue, 22 Oct 2019 12:39:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC816E789
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 12:39:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiCre7yvAQ28uQOSU9GcVReeYKOF5sy48edv+55rUXv3EnHXeQbSyBv/vq1+lFN9/1lrgGrC6+LO8rz8kG+z4C6g66XwVsY6YaA/XtvQFKviuuISAZdaUpZ85nvt04qLGA8hUdk8p4ZLK8KpyVzOU22aeRUwzdpCU7UmiYeUBwbkjmyMTy8p8Mr3nY916ToaJPQ5RXoR99Dd9Lb1vladBVRdboR4ccoDe+9HQlwueAxx/kiUTvlbanwOIjV/2p8cgLKNoOG6TnEvkLS/DGYYn05exv+sPz9poGCf+uKCkIfBq5jIqKR4zuRp6rUg8dEZlsLRwjTLFj8lhiKvAeOOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DS+fN0oa+m7TlmHSyRL3RxyR72iu6llckHapI656Zo=;
 b=jkYm8p+JHg881BM62LdQdZI3lBoPu1Tw4c0um/9UQ9n+XO3z7vPJTRh5ojtUgt7dbU9xipvmvzRsMOEjg9YsTiDIesj80edC7Y44HK1hY5Q2ZCM2gQrDOhBT7fft5sD/hFzZ1BazH8f3/t5EDJXWcSs5NiOL/FxnNyajVNnOMQLaLhMJNevwQ8nFvAZjWZVgqMV8KcFzx1kA8ByqEGJ1EBqSmfVkwhPAdDzDgKe1RmF7/3lJ3Esm8NRjslIdCIjRCMzjEqPALq0AH1tyQ//E8vymBFm4791oZfz4a/PzamUkAwI0+E2kXBL32CjIqjeEC0z5kRleJbLWy7eNTZNdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3461.namprd12.prod.outlook.com (20.178.54.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 22 Oct 2019 12:39:04 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 12:39:04 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Roman" <Roman.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu/display: add dc feature mask for psr enablement
Thread-Topic: [PATCH] drm/amdgpu/display: add dc feature mask for psr
 enablement
Thread-Index: AQHViFjUqPNmWSMlBUmkk5pZ4xQsN6dmmqqA
Date: Tue, 22 Oct 2019 12:39:04 +0000
Message-ID: <f446a637-23b0-a876-7e6d-899483d0bdc6@amd.com>
References: <1571694305-14820-1-git-send-email-Roman.Li@amd.com>
In-Reply-To: <1571694305-14820-1-git-send-email-Roman.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2c0453b8-41f5-406f-efbc-08d756ecd268
x-ms-traffictypediagnostic: BYAPR12MB3461:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB34614ECF95A091906406A4CBEC680@BYAPR12MB3461.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(71200400001)(2906002)(36756003)(4326008)(5660300002)(6246003)(256004)(71190400001)(6486002)(229853002)(4001150100001)(6436002)(14444005)(6512007)(66946007)(66556008)(66476007)(66066001)(64756008)(66446008)(31686004)(110136005)(31696002)(478600001)(86362001)(3846002)(6116002)(52116002)(11346002)(53546011)(14454004)(2501003)(316002)(76176011)(54906003)(99286004)(7736002)(476003)(486006)(305945005)(6636002)(6506007)(186003)(386003)(8676002)(446003)(2616005)(25786009)(26005)(81156014)(8936002)(81166006)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3461;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1o1u3ZeOdyok9xpOCeW4IQSdD3vz3SdhTN5RjlUDMuIIHdv08xhsIdb2MXKj3YNm1U31NTEAvuZaOXu31CIRYmX/T70rS10fWa0ZWyqzD6upjx3Y5DiLJh1ceTYg0xBCTnXGTB4tZpG9uZlZriBOM1HKUdGU//5pfgz1tY7QkPZrFb8wBCPtic62QTAbNVXCzj+fxOmYhckU0NO98yPo5JTAh/EDxvEs8jecT+YioJ92CTiR3EgB5J9WRzn9rROxn62r3n1HJr0sUoAHDx4jBVx9193eOSyVZFm1Ku6osZmVM/31dVmzMclEUXkG98sYPFbwaH0DQUjGv2Qahsx8cahV/htq6Sk6McRD0RR4/XEQUd7mtwI0Upt3p5B6HP+gMBay70SHdtHursyc7WHK50kHDJlrFR7wfldEdNsiMu5w8O6ONkVd8X+5vjDOvzMc
Content-ID: <0336D7AD98DA7B4C868E1FD50BF5E4F7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0453b8-41f5-406f-efbc-08d756ecd268
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 12:39:04.1016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQBoRmcRCbjRndi3/TP/wmZZ9FEut1g/L7cQ1E3uCBeOxXbLK1cLmCtI6CB5vFKAgeWPbK56XzfqvCSKXjGZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3461
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DS+fN0oa+m7TlmHSyRL3RxyR72iu6llckHapI656Zo=;
 b=13tFUAzlJn+8BciGEi3CPdpC5eA+bVaZOd/lVzudQwH+a9+iPLGCaz313Vqa3xZD4BQNv+qO0Wtxe12eS6yqh/NhpCt+Gbk0GMg8/A50NQZ3EDT/lWypPwy05Nl0fuceVwbQ81upQoE6Sz9gvuR8OSAK2O6W3zKFaEMonS/iho0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMSA1OjQ1IHAubS4sIFJvbWFuLkxpQGFtZC5jb20gd3JvdGU6DQo+IEZyb206
IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPg0KPiANCj4gW1doeV0NCj4gQWRkaW5nIHBzciBt
YXNrIHRvIGRjIGZlYXR1cmVzIGFsbG93cyBzZWxlY3RpdmVseSBkaXNhYmxlL2VuYWJsZSBwc3Iu
DQo+IEN1cnJlbnQgcHNyIGltcGxlbWVudGF0aW9uIG1heSBub3Qgd29yayB3aXRoIG5vbi1wYWdl
ZmxpcHBpbmcgYXBwbGljYXRpb24uDQo+IFVudGlsIHJlc29sdmVkIGl0IHNob3VsZCBiZSBkaXNh
YmxlZCBieSBkZWZhdWx0Lg0KPiANCj4gW0hvd10NCj4gQWRkIGRjZmVhdHVyZW1hc2sgZm9yIHBz
ciBlbmFibGVtZW50LiBEaXNhYmxlIGJ5IGRlZmF1bHQuDQo+IFRvIGVuYWJsZSBzZXQgYW1kZ3B1
LmRjZmVhdHVyZW1hc2s9MHg4IGluIGdydWIga2VybmVsIGNvbW1hbmQgbGluZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oICAgICAgICAgIHwgMSAr
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYw0KPiBpbmRleCAxY2Y0YmViLi4wZjA4ODc5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAgLTI0MjQsNyAr
MjQyNCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXRpYWxpemVfZHJtX2RldmljZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJCX0gZWxzZSBpZiAoZGNfbGlua19kZXRlY3Qo
bGluaywgREVURUNUX1JFQVNPTl9CT09UKSkgew0KPiAgIAkJCWFtZGdwdV9kbV91cGRhdGVfY29u
bmVjdG9yX2FmdGVyX2RldGVjdChhY29ubmVjdG9yKTsNCj4gICAJCQlyZWdpc3Rlcl9iYWNrbGln
aHRfZGV2aWNlKGRtLCBsaW5rKTsNCj4gLQkJCWFtZGdwdV9kbV9zZXRfcHNyX2NhcHMobGluayk7
DQo+ICsJCQlpZiAoYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayAmIERDX1BTUl9NQVNLKQ0KPiArCQkJ
CWFtZGdwdV9kbV9zZXRfcHNyX2NhcHMobGluayk7DQo+ICAgCQl9DQo+ICAgDQo+ICAgDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaA0KPiBpbmRleCA4ODg5YWFjLi4x
ZGFhMjIxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3No
YXJlZC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgN
Cj4gQEAgLTE0Myw2ICsxNDMsNyBAQCBlbnVtIFBQX0ZFQVRVUkVfTUFTSyB7DQo+ICAgZW51bSBE
Q19GRUFUVVJFX01BU0sgew0KPiAgIAlEQ19GQkNfTUFTSyA9IDB4MSwNCj4gICAJRENfTVVMVElf
TU9OX1BQX01DTEtfU1dJVENIX01BU0sgPSAweDIsDQo+ICsJRENfUFNSX01BU0sgPSAweDgsDQoN
CkNhbiB0aGlzIGp1c3QgYmUgMHg0IGluc3RlYWQ/IEFueSByZWFzb24gd2h5IHdlJ3JlIHNraXBw
aW5nIGEgZmxhZyBoZXJlIA0KZ29pbmcgZnJvbSAweDIgdG8gMHg4Pw0KDQpZb3UgY2FuIHN0aWxs
IGhhdmUgbXk6DQoNClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5r
YXpsYXVza2FzQGFtZC5jb20+DQoNCmJ1dCBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIG9uIGZpeGlu
ZyB0aGlzIHVwIHRvIGEgMHg0IGZpcnN0IGluIHRoZSANCmNvbW1pdCBtZXNzYWdlIC8gRENfRkVB
VFVSRV9NQVNLLg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQoNCj4gICB9Ow0KPiAgIA0KPiAgIGVu
dW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWw7DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
