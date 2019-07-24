Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A6731B6
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0617A6E5B4;
	Wed, 24 Jul 2019 14:33:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788C06E5B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:33:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJKjsf8ijTKUUeLJdGGwwf2SYLtgeWFh8rjmULfgxQlk4wskiyEEdij8L+L71M1aMZyxMyapWa/PVEGbokTCOxbIgvhmeKcazGB/72BmowqjFaXUwIf2U/ZzIwNK/DmH3DI6e90El5fPYIMIt0NNHha64HXI1kmLfcKaXWxuYzV19T1mSfWy7uvMQ9vvi6jBImZknNmEvj3zC86mLDIQcrabgaCv2zlFdVzL6yHuWlSnuKKN4pcXDLU6OzQafJtB0wwzqq6YfOtyNOvEqC55eaRJvMHr1PHd+FLbYy20b5jVc4L+JnI1gWnMuBIeFBT0OrAgZ4pgZieUh/RfPwBWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksfteBJHqomV1nQdpGmFmwa5jnVvFF+9Yh+1ZhQDMrk=;
 b=FbgQsqjglDbnf0G9XDqYp8pdyPbwuui6+lgF5X0yJgH7ISLRAe4RZMyxZRynLEQ+tS/T600JBUA14UMbIj/k9xSqkEdYN6NRuo7zc4c7JCysmzvpEBU1PZrU6RFnumhwKr5KY8VJ3jIjsiOWDo2K3M6eW72u/hWYmvfrr7XZ/2DmjlI3qouYc+Rn3/TIvR76bGH3Yzn5Ng7DQWUUGiAB146uL1kNzHscdlCjlRlgX9yDipYkF1dtgu49ydCTunzQymi8PcrNIiepbOLKztI2WYzPAXA00RvltiuMi/6IdCnu0qgqk2E4cK4if65WB63gIn0J+5wO6ofZIOVxDV7cPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1325.namprd12.prod.outlook.com (10.169.204.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 14:33:40 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 14:33:40 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Thread-Topic: [PATCH v3 2/3] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
Thread-Index: AQHVQimtDAhhe9PLFkelA1uC/66VJ6bZ0pAAgAACq4A=
Date: Wed, 24 Jul 2019 14:33:40 +0000
Message-ID: <a3f16c33-55f8-1de4-d866-fcff67cf9f42@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-3-git-send-email-andrey.grodzovsky@amd.com>
 <e70a00d3-bcd3-c72e-8de8-eb6ae10abee6@daenzer.net>
In-Reply-To: <e70a00d3-bcd3-c72e-8de8-eb6ae10abee6@daenzer.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::27) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b0479c7-0850-4ded-aae6-08d71043ebb3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1325; 
x-ms-traffictypediagnostic: MWHPR12MB1325:
x-microsoft-antispam-prvs: <MWHPR12MB1325F23F72BF0D0413167152EAC60@MWHPR12MB1325.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(189003)(199004)(86362001)(6916009)(54906003)(36756003)(14454004)(8676002)(71190400001)(2906002)(71200400001)(68736007)(305945005)(316002)(6116002)(7736002)(31686004)(99286004)(3846002)(52116002)(11346002)(66066001)(386003)(476003)(2616005)(446003)(6506007)(229853002)(25786009)(26005)(53546011)(102836004)(66574012)(6436002)(64756008)(76176011)(6246003)(486006)(66476007)(6486002)(66446008)(66556008)(5660300002)(66946007)(8936002)(14444005)(6512007)(256004)(478600001)(53936002)(4326008)(81156014)(31696002)(81166006)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1325;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lwBCkj5O8QfiHQKlacCSCykvxl1K9BQbzYMhD1xd8p8rn6z2oiYfXO0z9MfXgBYDsc2HvVWf7HLXVfjAOopol+lJOi+tD1kEVMDN6VfGB+yuJqSgukFICU1vK6EldvMR6c9x/81bTmyvv1SUYmbwXSeH8Ax+49ksBQOGbE1t8h4do7ckrOppQS0CImX/qNT8DrVrEpv2SjJZDu6lbQ+JvcAUc2v2kvMxM+iqpXiP+53+5vaBM9rFKz6nZHoRgLin6d2KHBfRojI+zx9vrdmpy62l1i8LV0+7vHq4a9LnQQKztD5YdQzZWnceb3JEWtwGkhQu81uIk1paa3WS0vHdmZVj7dRD772xbj6d3XLaHrKafc/14pd4QAtBmArFHXqJ+93TUbfeDsu5eqGu9Ey0af3T82HaiisL08SzDhhWGHA=
Content-ID: <F2FAA14709BB09478694EE42BCA26304@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0479c7-0850-4ded-aae6-08d71043ebb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:33:40.1129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1325
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksfteBJHqomV1nQdpGmFmwa5jnVvFF+9Yh+1ZhQDMrk=;
 b=YTsUsytxDijt6bQthW1HUJwE/FcunxCgXA2sH3ksslo7HHyO824YcTJDLAJwHe4m7tDbIDqUY5j+fF6Lqn+RY3QRJBe3BaiYZDqaqbaiSDUDecSw4Rot7QpMItQOLdHG4RcqzykV46AMHTS/zC2Ku5afDPGGzUsutDANkBKqepQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA3LzI0LzE5IDEwOjI0IEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gT24gMjAxOS0w
Ny0yNCA0OjEwIHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOg0KPj4gTW92ZSB0aGUgbG9n
aWMgdG8gY2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGluDQo+PiBhbWRncHVf
Ym9fZG9fY3JlYXRlIGludG8gc3RhbmRhbG9uZSBoZWxwZXIgc28gaXQgY2FuIGJlIHJldXNlZA0K
Pj4gaW4gb3RoZXIgZnVuY3Rpb25zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9k
em92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPj4gLS0tDQo+PiAgIFsuLi5dDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KPj4gaW5k
ZXggOTg5YjdiNS4uNjRjNDViYyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jDQo+PiBAQCAtNDEzLDYgKzQxMyw0MSBAQCBzdGF0aWMgYm9vbCBh
bWRncHVfYm9fdmFsaWRhdGVfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+ICAg
CXJldHVybiBmYWxzZTsNCj4+ICAgfQ0KPj4gICANCj4+ICt2b2lkIGFtZGdwdV9ib192YWxpZGF0
ZV91c3djKHU2NCAqYm9fZmxhZ3MpDQo+IFRoaXMgQVBJIGlzIGEgYml0IHdlaXJkLiA6KSBJJ2Qg
c3VnZ2VzdCBzb21ldGhpbmcgbGlrZQ0KPg0KPiBib29sIGFtZGdwdV91c3djX3N1cHBvcnRlZCh2
b2lkKQ0KPiB7DQo+IAlpZiAoW3ZhcmlvdXMgY29uZGl0aW9uc10pDQo+IAkJcmV0dXJuIGZhbHNl
Ow0KPg0KPiAJcmV0dXJuIHRydWU7DQo+IH0NCg0KDQpZZWEsIHRoZSBjb2RlIGlzIGNvbmZ1c2lu
ZyB3aXRoIGFsbCAjaWZkZWZzIHNvIGkgd2FudGVkIG1pbmltYWwgY2hhbmdlcyANCnRvIG5vdCBi
cmVhayBhbnl0aGluZywgYnV0IGkgY2FuIGRvIHRoaXMgd2F5IHRvLg0KDQpBbmRyZXkNCg0KDQo+
DQo+PiBAQCAtNDY2LDMzICs1MDEsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19kb19jcmVhdGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+PiBbLi4uXQ0KPj4gKwlhbWRncHVfYm9fdmFs
aWRhdGVfdXN3YygmYm8tPmZsYWdzKTsNCj4gQW5kIHRoZW4NCj4NCj4gCWlmICghYW1kZ3B1X3Vz
d2Nfc3VwcG9ydGVkKCkpDQo+IAkJYm8tPmZsYWdzICY9IH5BTURHUFVfR0VNX0NSRUFURV9DUFVf
R1RUX1VTV0M7DQo+DQo+IGhlcmUuDQo+DQo+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
