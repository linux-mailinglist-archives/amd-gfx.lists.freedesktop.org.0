Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC99A659
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 05:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13A56EBB2;
	Fri, 23 Aug 2019 03:48:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621DC6EBB3
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 03:48:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lM7bblrQMM+znvS9A0OXQQto3gHXikuAgp2Ln9RdzoYMaKEhh+lGGnl8MJ0mFv/teHZA9YTME0EULAUsZPuFqf2fDFEPI9eLghf7kE0YYVjM7KIG37mvcptWJLa1Pbxv1Cx9ytFXYytRydFQ0O+89987atZvr/EsQaDc0DRJdm4+WoHWVcJ4fCLZ33SMUI2GPjIArrcEPzsDQaLepiw2eGZn4hA1U3faTNmnKldHHvxCkaCo590jj1QdwGHb5r/Fp2T/ZHH0JMCq1L/0mB/hlAgtRPy+A86ILK4d0Xj+2P42sY6pirezwmtnrivhonOzxKf1n/0NDPlu0jxReoIwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoqgmK0InGWSzhvcQquvgoEGhxxfRTyf47XKADlJss8=;
 b=X3df/0egwuDu4DWXCTvmiMKVhcLB4dN5WDSs7t56aWSIZs6uQeYjO87vpXYwR1Ffk66S7WPzXIULsFsptgFYkHp0vJvJfPa1HmqNiPg2wvvJZKRAA0BDO6kPuqXo+1UbHm2fKOrN4kx5CmB5zKQOsYsAipfY0zcMCo9ie6DRL8Gd/5GIZSJD+11n0zMh54bNsB2Fn5GezZXwdfEtyJihlu8oXqmYwygNwTXwUAVnHh6S329/Lp9KPAZ31vtcEBOBCIRp6jtPakDZW7SUmBOLiz2gaZxGm0efQS+JJgfFu3mcxLTU+dZR68LwuwyRIox/2+/5pcrrZjoMR+q9tPIUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (20.180.6.72) by
 CH2PR12MB3784.namprd12.prod.outlook.com (52.132.231.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 03:48:14 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::cc0e:7290:874d:c7f8]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::cc0e:7290:874d:c7f8%2]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 03:48:14 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/4] drm/amdgpu: Add RAS EEPROM table.
Thread-Topic: [PATCH v4 1/4] drm/amdgpu: Add RAS EEPROM table.
Thread-Index: AQHVWFtf1gSXZq/YKECwGsQ+ckagBacIGnSA
Date: Fri, 23 Aug 2019 03:48:14 +0000
Message-ID: <25f27943-9d66-e8be-4857-a5035597a902@amd.com>
References: <1566417719-1528-1-git-send-email-andrey.grodzovsky@amd.com>
 <1566417719-1528-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1566417719-1528-2-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:208:160::41) To CH2PR12MB4152.namprd12.prod.outlook.com
 (2603:10b6:610:a7::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a36e7eb-a390-4df9-a423-08d7277cb99a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB3784; 
x-ms-traffictypediagnostic: CH2PR12MB3784:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB37849A8BB70588B29CB6C20699A40@CH2PR12MB3784.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(189003)(199004)(486006)(6116002)(6306002)(6512007)(71200400001)(71190400001)(81166006)(2906002)(5660300002)(186003)(102836004)(53936002)(66066001)(966005)(478600001)(81156014)(6486002)(4326008)(54906003)(316002)(7736002)(2501003)(25786009)(229853002)(110136005)(99286004)(305945005)(3846002)(36756003)(6246003)(26005)(386003)(6436002)(30864003)(76176011)(31696002)(2616005)(14444005)(476003)(14454004)(11346002)(446003)(66556008)(66946007)(66446008)(86362001)(53946003)(31686004)(64756008)(66476007)(256004)(52116002)(6506007)(53546011)(8676002)(8936002)(461764006)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3784;
 H:CH2PR12MB4152.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nalCIGDhQtP1hJPiAUJXfSEM9obzjcLYdPTMlsRG4N6rShqHtucrxYPp6mv1PrbBwA+cD/4sGwAmhwN+zHox/dbbaAjWufkmQniMSvu4hBmsdzxxKno3cJjBusq5q0sKxCpvhA9ajK9gRZgHk/uSH7af/Xb/zngCIPMM0KXnZ13WwAxEvUV2J4TVhBNEQ5vdwjFnK6mJXrd09oNaq7LOhKTZkdSzheS28wF5hpf4kTYU/G+656CvYYx+BGdUH4m4zZqNnsumzUl284EFfjlosHbIDCfy6VehD46jMyNA/5PKgOA/XfS7B78urKWQkYWqqPHeboAu9gM6yiPYU7G4Ib9Rcv/Gx0AezYlCGd5xR/kGcU0j6/+igMBM1WbX1jhJHtAvLfsTcspgBKmr7aFVAlkQHMIeI+9gNKJYOhVKfSA=
Content-ID: <B3C375A6792C6444B835557C17F2BE91@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a36e7eb-a390-4df9-a423-08d7277cb99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 03:48:14.3715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YChGcCD29ILLKzAImlp6BAoSVsVjCd2TtjHum6Rmzfebil2xTBiKDBus+O17IxCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoqgmK0InGWSzhvcQquvgoEGhxxfRTyf47XKADlJss8=;
 b=f/0yYgM3kCzK5PCY22UGevd3hV/hW8bya0Olg7Ff/8DtnmIpupj1dUiwMW4VAdIXfJ5CH9xto8dvI/5CR30mNaiDmuRNYUXaQWX8Csee6ZNwJ+VMxU+vruJWFzc1wCs9MU4kz5317lHtMkC6WSjm1MgYhakS5CHmwdRtceqWgvU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Panariti, David" <David.Panariti@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Russell,
 Kent" <Kent.Russell@amd.com>, "Zhou1, 
 Tao" <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQW5kcmV5LA0KDQpMb29rcyBnb29kLS10aGFua3MgZm9yIGFkZHJlc3NpbmcgbXkgY29tbWVu
dHMgZGF0ZWQgMjAxOS0wOC0wNy4NCg0KUmVnYXJkcywNCkx1YmVuDQoNCk9uIDIwMTktMDgtMjEg
MTY6MDEsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOg0KPiBBZGQgUkFTIEVFUFJPTSB0YWJsZSBt
YW5hZ2VyIHRvIGVhbmJsZSBSQVMgZXJyb3JzIHRvIGJlIHN0b3JlZA0KPiB1cG9uIGFwcGVhcmFu
Y2UgYW5kIHJldHJpdmVkIG9uIGRyaXZlciBsb2FkLg0KPiANCj4gdjI6IEZpeCBzb21lIHByaW50
cy4NCj4gDQo+IHYzOg0KPiBGaXggY2hlY2tzdW0gY2FsY3VsYXRpb24uDQo+IE1ha2UgdGFibGUg
cmVjb3JkIGFuZCBoZWFkZXIgc3RydWN0cyBwYWNrZWQgdG8gZG8gY29ycmVjdCBieXRlIHZhbHVl
IHN1bS4NCj4gRml4IHJlY29yZCBjcm9zc2luZyBFRVBST00gcGFnZSBib3VuZHJ5Lg0KPiANCj4g
djQ6DQo+IEZpeCBieXRlIHN1bSB2YWwgY2FsY3VsYXRpb24gZm9yIHJlY29yZCAtIGxvb2sgYXQg
c2l6ZW9mKHJlY29yZCkuDQo+IEZpeCBzb21lIHN0eWxlIGNvbW1lbnRzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgICAgICAgICAgICB8
ICAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oICAgICAg
ICB8ICAgMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJv
bS5jIHwgNDgyICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmggfCAgOTAgKysrKysNCj4gIDQgZmlsZXMgY2hh
bmdlZCwgNTc2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jDQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19l
ZXByb20uaA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01h
a2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUNCj4gaW5kZXggMjhk
NzZiZC4uZjAxNmNmMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
TWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUNCj4g
QEAgLTU0LDcgKzU0LDcgQEAgYW1kZ3B1LXkgKz0gYW1kZ3B1X2RldmljZS5vIGFtZGdwdV9rbXMu
byBcDQo+ICAJYW1kZ3B1X2d0dF9tZ3IubyBhbWRncHVfdnJhbV9tZ3IubyBhbWRncHVfdmlydC5v
IGFtZGdwdV9hdG9tZmlybXdhcmUubyBcDQo+ICAJYW1kZ3B1X3ZmX2Vycm9yLm8gYW1kZ3B1X3Nj
aGVkLm8gYW1kZ3B1X2RlYnVnZnMubyBhbWRncHVfaWRzLm8gXA0KPiAgCWFtZGdwdV9nbWMubyBh
bWRncHVfeGdtaS5vIGFtZGdwdV9jc2EubyBhbWRncHVfcmFzLm8gYW1kZ3B1X3ZtX2NwdS5vIFwN
Cj4gLQlhbWRncHVfdm1fc2RtYS5vIGFtZGdwdV9kaXNjb3Zlcnkubw0KPiArCWFtZGdwdV92bV9z
ZG1hLm8gYW1kZ3B1X3BtdS5vIGFtZGdwdV9kaXNjb3ZlcnkubyBhbWRncHVfcmFzX2VlcHJvbS5v
DQo+ICANCj4gIGFtZGdwdS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0gYW1kZ3B1X3BtdS5vDQo+
ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBpbmRleCAyNzY1
ZjJkLi44ZDViY2Q4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5oDQo+IEBAIC0yOSw2ICsyOSw3IEBADQo+ICAjaW5jbHVkZSAiYW1kZ3B1LmgiDQo+ICAjaW5j
bHVkZSAiYW1kZ3B1X3BzcC5oIg0KPiAgI2luY2x1ZGUgInRhX3Jhc19pZi5oIg0KPiArI2luY2x1
ZGUgImFtZGdwdV9yYXNfZWVwcm9tLmgiDQo+ICANCj4gIGVudW0gYW1kZ3B1X3Jhc19ibG9jayB7
DQo+ICAJQU1ER1BVX1JBU19CTE9DS19fVU1DID0gMCwNCj4gQEAgLTMzMyw2ICszMzQsOCBAQCBz
dHJ1Y3QgYW1kZ3B1X3JhcyB7DQo+ICAJc3RydWN0IG11dGV4IHJlY292ZXJ5X2xvY2s7DQo+ICAN
Cj4gIAl1aW50MzJfdCBmbGFnczsNCj4gKw0KPiArCXN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9j
b250cm9sIGVlcHJvbV9jb250cm9sOw0KPiAgfTsNCj4gIA0KPiAgc3RydWN0IHJhc19mc19kYXRh
IHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNf
ZWVwcm9tLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5j
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLmJmMDc1MTUNCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
X2VlcHJvbS5jDQo+IEBAIC0wLDAgKzEsNDgyIEBADQo+ICsvKg0KPiArICogQ29weXJpZ2h0IDIw
MTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLg0KPiArICoNCj4gKyAqIFBlcm1pc3Npb24g
aXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmlu
ZyBhDQo+ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRh
dGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLA0KPiArICogdG8gZGVhbCBpbiB0aGUgU29mdHdh
cmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbg0KPiAr
ICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3Ry
aWJ1dGUsIHN1YmxpY2Vuc2UsDQo+ICsgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3
YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUNCj4gKyAqIFNvZnR3YXJlIGlz
IGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6
DQo+ICsgKg0KPiArICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlz
c2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4NCj4gKyAqIGFsbCBjb3BpZXMgb3Igc3Vi
c3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLg0KPiArICoNCj4gKyAqIFRIRSBTT0ZU
V0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBF
WFBSRVNTIE9SDQo+ICsgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRI
RSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwNCj4gKyAqIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTA0K
PiArICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1Ig
QU5ZIENMQUlNLCBEQU1BR0VTIE9SDQo+ICsgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4g
QU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwNCj4gKyAqIEFSSVNJTkcg
RlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVT
RSBPUg0KPiArICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLg0KPiArICoNCj4gKyAq
Lw0KPiArDQo+ICsjaW5jbHVkZSAiYW1kZ3B1X3Jhc19lZXByb20uaCINCj4gKyNpbmNsdWRlICJh
bWRncHUuaCINCj4gKyNpbmNsdWRlICJhbWRncHVfcmFzLmgiDQo+ICsjaW5jbHVkZSA8bGludXgv
Yml0cy5oPg0KPiArDQo+ICsjZGVmaW5lIEVFUFJPTV9JMkNfVEFSR0VUX0FERFIgMHhBMA0KPiAr
DQo+ICsjZGVmaW5lIEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRSAyMA0KPiArI2RlZmluZSBFRVBS
T01fVEFCTEVfUkVDT1JEX1NJWkUgMjQNCj4gKyNkZWZpbmUgRUVQUk9NX0FERFJFU1NfU0laRSAw
eDINCj4gKw0KPiArLyogVGFibGUgaGRyIGlzICdBTURSJyAqLw0KPiArI2RlZmluZSBFRVBST01f
VEFCTEVfSERSX1ZBTCAweDQxNGQ0NDUyDQo+ICsjZGVmaW5lIEVFUFJPTV9UQUJMRV9WRVIgMHgw
MDAxMDAwMA0KPiArDQo+ICsvKiBBc3N1bWUgMiBNYml0IHNpemUgKi8NCj4gKyNkZWZpbmUgRUVQ
Uk9NX1NJWkVfQllURVMgMjU2MDAwDQo+ICsjZGVmaW5lIEVFUFJPTV9QQUdFX19TSVpFX0JZVEVT
IDI1Ng0KPiArI2RlZmluZSBFRVBST01fSERSX1NUQVJUIDANCj4gKyNkZWZpbmUgRUVQUk9NX1JF
Q09SRF9TVEFSVCAoRUVQUk9NX0hEUl9TVEFSVCArIEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRSkN
Cj4gKyNkZWZpbmUgRUVQUk9NX01BWF9SRUNPUkRfTlVNICgoRUVQUk9NX1NJWkVfQllURVMgLSBF
RVBST01fVEFCTEVfSEVBREVSX1NJWkUpIC8gRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFKQ0KPiAr
I2RlZmluZSBFRVBST01fQUREUl9NU0JfTUFTSyBHRU5NQVNLKDE3LCA4KQ0KPiArDQo+ICsjZGVm
aW5lIHRvX2FtZGdwdV9kZXZpY2UoeCkgKGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3QgYW1kZ3B1X3Jh
cywgZWVwcm9tX2NvbnRyb2wpKS0+YWRldg0KPiArDQo+ICtzdGF0aWMgdm9pZCBfX2VuY29kZV90
YWJsZV9oZWFkZXJfdG9fYnVmZihzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fdGFibGVfaGVhZGVy
ICpoZHIsDQo+ICsJCQkJCSAgdW5zaWduZWQgY2hhciAqYnVmZikNCj4gK3sNCj4gKwl1aW50MzJf
dCAqcHAgPSAodWludDMyX3QgKikgYnVmZjsNCj4gKw0KPiArCXBwWzBdID0gY3B1X3RvX2xlMzIo
aGRyLT5oZWFkZXIpOw0KPiArCXBwWzFdID0gY3B1X3RvX2xlMzIoaGRyLT52ZXJzaW9uKTsNCj4g
KwlwcFsyXSA9IGNwdV90b19sZTMyKGhkci0+Zmlyc3RfcmVjX29mZnNldCk7DQo+ICsJcHBbM10g
PSBjcHVfdG9fbGUzMihoZHItPnRibF9zaXplKTsNCj4gKwlwcFs0XSA9IGNwdV90b19sZTMyKGhk
ci0+Y2hlY2tzdW0pOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBfX2RlY29kZV90YWJsZV9o
ZWFkZXJfZnJvbV9idWZmKHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV90YWJsZV9oZWFkZXIgKmhk
ciwNCj4gKwkJCQkJICB1bnNpZ25lZCBjaGFyICpidWZmKQ0KPiArew0KPiArCXVpbnQzMl90ICpw
cCA9ICh1aW50MzJfdCAqKWJ1ZmY7DQo+ICsNCj4gKwloZHItPmhlYWRlciAJICAgICAgPSBsZTMy
X3RvX2NwdShwcFswXSk7DQo+ICsJaGRyLT52ZXJzaW9uIAkgICAgICA9IGxlMzJfdG9fY3B1KHBw
WzFdKTsNCj4gKwloZHItPmZpcnN0X3JlY19vZmZzZXQgPSBsZTMyX3RvX2NwdShwcFsyXSk7DQo+
ICsJaGRyLT50Ymxfc2l6ZSAJICAgICAgPSBsZTMyX3RvX2NwdShwcFszXSk7DQo+ICsJaGRyLT5j
aGVja3N1bSAJICAgICAgPSBsZTMyX3RvX2NwdShwcFs0XSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyBpbnQgX191cGRhdGVfdGFibGVfaGVhZGVyKHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250
cm9sICpjb250cm9sLA0KPiArCQkJCSB1bnNpZ25lZCBjaGFyICpidWZmKQ0KPiArew0KPiArCWlu
dCByZXQgPSAwOw0KPiArCXN0cnVjdCBpMmNfbXNnIG1zZyA9IHsNCj4gKwkJCS5hZGRyCT0gRUVQ
Uk9NX0kyQ19UQVJHRVRfQUREUiwNCj4gKwkJCS5mbGFncwk9IDAsDQo+ICsJCQkubGVuCT0gRUVQ
Uk9NX0FERFJFU1NfU0laRSArIEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRSwNCj4gKwkJCS5idWYJ
PSBidWZmLA0KPiArCX07DQo+ICsNCj4gKw0KPiArCSoodWludDE2X3QgKilidWZmID0gRUVQUk9N
X0hEUl9TVEFSVDsNCj4gKwlfX2VuY29kZV90YWJsZV9oZWFkZXJfdG9fYnVmZigmY29udHJvbC0+
dGJsX2hkciwgYnVmZiArIEVFUFJPTV9BRERSRVNTX1NJWkUpOw0KPiArDQo+ICsJcmV0ID0gaTJj
X3RyYW5zZmVyKCZjb250cm9sLT5lZXByb21fYWNjZXNzb3IsICZtc2csIDEpOw0KPiArCWlmIChy
ZXQgPCAxKQ0KPiArCQlEUk1fRVJST1IoIkZhaWxlZCB0byB3cml0ZSBFRVBST00gdGFibGUgaGVh
ZGVyLCByZXQ6JWQiLCByZXQpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIHVpbnQzMl90ICBfX2NhbGNfaGRyX2J5dGVfc3VtKHN0cnVjdCBhbWRncHVfcmFzX2Vl
cHJvbV9jb250cm9sICpjb250cm9sKTsNCj4gKw0KPiAraW50IGFtZGdwdV9yYXNfZWVwcm9tX2lu
aXQoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpDQo+ICt7DQo+ICsJ
aW50IHJldCA9IDA7DQo+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVf
ZGV2aWNlKGNvbnRyb2wpOw0KPiArCXVuc2lnbmVkIGNoYXIgYnVmZltFRVBST01fQUREUkVTU19T
SVpFICsgRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFXSA9IHsgMCB9Ow0KPiArCXN0cnVjdCBhbWRn
cHVfcmFzX2VlcHJvbV90YWJsZV9oZWFkZXIgKmhkciA9ICZjb250cm9sLT50YmxfaGRyOw0KPiAr
CXN0cnVjdCBpMmNfbXNnIG1zZyA9IHsNCj4gKwkJCS5hZGRyCT0gRUVQUk9NX0kyQ19UQVJHRVRf
QUREUiwNCj4gKwkJCS5mbGFncwk9IEkyQ19NX1JELA0KPiArCQkJLmxlbgk9IEVFUFJPTV9BRERS
RVNTX1NJWkUgKyBFRVBST01fVEFCTEVfSEVBREVSX1NJWkUsDQo+ICsJCQkuYnVmCT0gYnVmZiwN
Cj4gKwl9Ow0KPiArDQo+ICsJbXV0ZXhfaW5pdCgmY29udHJvbC0+dGJsX211dGV4KTsNCj4gKw0K
PiArCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQo+ICsJY2FzZSBDSElQX1ZFR0EyMDoNCj4g
KwkvKlRPRE8gQWRkIE1JLTYwICovDQo+ICsJCWJyZWFrOw0KPiArDQo+ICsJZGVmYXVsdDoNCj4g
KwkJcmV0dXJuIDA7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHJldCkgew0KPiArCQlEUk1fRVJST1Io
IkZhaWxlZCB0byBpbml0IEkyQyBjb250cm9sbGVyLCByZXQ6JWQiLCByZXQpOw0KPiArCQlyZXR1
cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCS8qIFJlYWQvQ3JlYXRlIHRhYmxlIGhlYWRlciBmcm9t
IEVFUFJPTSBhZGRyZXNzIDAgKi8NCj4gKwlyZXQgPSBpMmNfdHJhbnNmZXIoJmNvbnRyb2wtPmVl
cHJvbV9hY2Nlc3NvciwgJm1zZywgMSk7DQo+ICsJaWYgKHJldCA8IDEpIHsNCj4gKwkJRFJNX0VS
Uk9SKCJGYWlsZWQgdG8gcmVhZCBFRVBST00gdGFibGUgaGVhZGVyLCByZXQ6JWQiLCByZXQpOw0K
PiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCV9fZGVjb2RlX3RhYmxlX2hlYWRlcl9m
cm9tX2J1ZmYoaGRyLCAmYnVmZlsyXSk7DQo+ICsNCj4gKwlpZiAoaGRyLT5oZWFkZXIgPT0gRUVQ
Uk9NX1RBQkxFX0hEUl9WQUwpIHsNCj4gKwkJY29udHJvbC0+bnVtX3JlY3MgPSAoaGRyLT50Ymxf
c2l6ZSAtIEVFUFJPTV9UQUJMRV9IRUFERVJfU0laRSkgLw0KPiArCQkJCSAgICBFRVBST01fVEFC
TEVfUkVDT1JEX1NJWkU7DQo+ICsJCURSTV9ERUJVR19EUklWRVIoIkZvdW5kIGV4aXN0aW5nIEVF
UFJPTSB0YWJsZSB3aXRoICVkIHJlY29yZHMiLA0KPiArCQkJCSBjb250cm9sLT5udW1fcmVjcyk7
DQo+ICsNCj4gKwl9IGVsc2Ugew0KPiArCQlEUk1fSU5GTygiQ3JlYXRpbmcgbmV3IEVFUFJPTSB0
YWJsZSIpOw0KPiArDQo+ICsJCWhkci0+aGVhZGVyID0gRUVQUk9NX1RBQkxFX0hEUl9WQUw7DQo+
ICsJCWhkci0+dmVyc2lvbiA9IEVFUFJPTV9UQUJMRV9WRVI7DQo+ICsJCWhkci0+Zmlyc3RfcmVj
X29mZnNldCA9IEVFUFJPTV9SRUNPUkRfU1RBUlQ7DQo+ICsJCWhkci0+dGJsX3NpemUgPSBFRVBS
T01fVEFCTEVfSEVBREVSX1NJWkU7DQo+ICsNCj4gKwkJYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJv
bV9jb250cm9sLnRibF9ieXRlX3N1bSA9DQo+ICsJCQkJX19jYWxjX2hkcl9ieXRlX3N1bSgmYWRl
di0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sKTsNCj4gKwkJcmV0ID0gX191cGRhdGVfdGFi
bGVfaGVhZGVyKGNvbnRyb2wsIGJ1ZmYpOw0KPiArCX0NCj4gKw0KPiArCS8qIFN0YXJ0IGluc2Vy
dGluZyByZWNvcmRzIGZyb20gaGVyZSAqLw0KPiArCWFkZXYtPnBzcC5yYXMucmFzLT5lZXByb21f
Y29udHJvbC5uZXh0X2FkZHIgPSBFRVBST01fUkVDT1JEX1NUQVJUOw0KPiArDQo+ICsJcmV0dXJu
IHJldCA9PSAxID8gMCA6IC1FSU87DQo+ICt9DQo+ICsNCj4gK3ZvaWQgYW1kZ3B1X3Jhc19lZXBy
b21fZmluaShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCkNCj4gK3sN
Cj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHRvX2FtZGdwdV9kZXZpY2UoY29udHJv
bCk7DQo+ICsNCj4gKwlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgew0KPiArCWNhc2UgQ0hJUF9W
RUdBMjA6DQo+ICsJCS8qVE9ETyBBZGQgTUktNjAgKi8NCj4gKwkJYnJlYWs7DQo+ICsNCj4gKwlk
ZWZhdWx0Og0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBf
X2VuY29kZV90YWJsZV9yZWNvcmRfdG9fYnVmZihzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29u
dHJvbCAqY29udHJvbCwNCj4gKwkJCQkJICBzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVj
b3JkLA0KPiArCQkJCQkgIHVuc2lnbmVkIGNoYXIgKmJ1ZmYpDQo+ICt7DQo+ICsJX19sZTY0IHRt
cCA9IDA7DQo+ICsJaW50IGkgPSAwOw0KPiArDQo+ICsJLyogTmV4dCBhcmUgYWxsIHJlY29yZCBm
aWVsZHMgYWNjb3JkaW5nIHRvIEVFUFJPTSBwYWdlIHNwZWMgaW4gTEUgZm9yYW10ICovDQo+ICsJ
YnVmZltpKytdID0gcmVjb3JkLT5lcnJfdHlwZTsNCj4gKw0KPiArCWJ1ZmZbaSsrXSA9IHJlY29y
ZC0+YmFuazsNCj4gKw0KPiArCXRtcCA9IGNwdV90b19sZTY0KHJlY29yZC0+dHMpOw0KPiArCW1l
bWNweShidWZmICsgaSwgJnRtcCwgOCk7DQo+ICsJaSArPSA4Ow0KPiArDQo+ICsJdG1wID0gY3B1
X3RvX2xlNjQoKHJlY29yZC0+b2Zmc2V0ICYgMHhmZmZmZmZmZmZmZmYpKTsNCj4gKwltZW1jcHko
YnVmZiArIGksICZ0bXAsIDYpOw0KPiArCWkgKz0gNjsNCj4gKw0KPiArCWJ1ZmZbaSsrXSA9IHJl
Y29yZC0+bWVtX2NoYW5uZWw7DQo+ICsJYnVmZltpKytdID0gcmVjb3JkLT5tY3VtY19pZDsNCj4g
Kw0KPiArCXRtcCA9IGNwdV90b19sZTY0KChyZWNvcmQtPnJldGlyZWRfcGFnZSAmIDB4ZmZmZmZm
ZmZmZmZmKSk7DQo+ICsJbWVtY3B5KGJ1ZmYgKyBpLCAmdG1wLCA2KTsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIHZvaWQgX19kZWNvZGVfdGFibGVfcmVjb3JkX2Zyb21fYnVmZihzdHJ1Y3QgYW1kZ3B1
X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCj4gKwkJCQkJICAgIHN0cnVjdCBlZXByb21f
dGFibGVfcmVjb3JkICpyZWNvcmQsDQo+ICsJCQkJCSAgICB1bnNpZ25lZCBjaGFyICpidWZmKQ0K
PiArew0KPiArCV9fbGU2NCB0bXAgPSAwOw0KPiArCWludCBpID0gIDA7DQo+ICsNCj4gKwkvKiBO
ZXh0IGFyZSBhbGwgcmVjb3JkIGZpZWxkcyBhY2NvcmRpbmcgdG8gRUVQUk9NIHBhZ2Ugc3BlYyBp
biBMRSBmb3JhbXQgKi8NCj4gKwlyZWNvcmQtPmVycl90eXBlID0gYnVmZltpKytdOw0KPiArDQo+
ICsJcmVjb3JkLT5iYW5rID0gYnVmZltpKytdOw0KPiArDQo+ICsJbWVtY3B5KCZ0bXAsIGJ1ZmYg
KyBpLCA4KTsNCj4gKwlyZWNvcmQtPnRzID0gbGU2NF90b19jcHUodG1wKTsNCj4gKwlpICs9IDg7
DQo+ICsNCj4gKwltZW1jcHkoJnRtcCwgYnVmZiArIGksIDYpOw0KPiArCXJlY29yZC0+b2Zmc2V0
ID0gKGxlNjRfdG9fY3B1KHRtcCkgJiAweGZmZmZmZmZmZmZmZik7DQo+ICsJaSArPSA2Ow0KPiAr
DQo+ICsJYnVmZltpKytdID0gcmVjb3JkLT5tZW1fY2hhbm5lbDsNCj4gKwlidWZmW2krK10gPSBy
ZWNvcmQtPm1jdW1jX2lkOw0KPiArDQo+ICsJbWVtY3B5KCZ0bXAsIGJ1ZmYgKyBpLCAgNik7DQo+
ICsJcmVjb3JkLT5yZXRpcmVkX3BhZ2UgPSAobGU2NF90b19jcHUodG1wKSAmIDB4ZmZmZmZmZmZm
ZmZmKTsNCj4gK30NCj4gKw0KPiArLyoNCj4gKyAqIFdoZW4gcmVhY2hpbmcgZW5kIG9mIEVFUFJP
TSBtZW1vcnkganVtcCBiYWNrIHRvIDAgcmVjb3JkIGFkZHJlc3MNCj4gKyAqIFdoZW4gbmV4dCBy
ZWNvcmQgYWNjZXNzIHdpbGwgZ28gYmV5b25kIEVFUFJPTSBwYWdlIGJvdW5kYXJ5IG1vZGlmeSBi
aXRzIEExNy9BOA0KPiArICogaW4gSTJDIHNlbGVjdG9yIHRvIGdvIHRvIG5leHQgcGFnZQ0KPiAr
ICovDQo+ICtzdGF0aWMgdWludDMyX3QgX19jb3JyZWN0X2VlcHJvbV9kZXN0X2FkZHJlc3ModWlu
dDMyX3QgY3Vycl9hZGRyZXNzKQ0KPiArew0KPiArCXVpbnQzMl90IG5leHRfYWRkcmVzcyA9IGN1
cnJfYWRkcmVzcyArIEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRTsNCj4gKw0KPiArCS8qIFdoZW4g
YWxsIEVFUFJPTSBtZW1vcnkgdXNlZCBqdW1wIGJhY2sgdG8gMCBhZGRyZXNzICovDQo+ICsJaWYg
KG5leHRfYWRkcmVzcyA+IEVFUFJPTV9TSVpFX0JZVEVTKSB7DQo+ICsJCURSTV9JTkZPKCJSZWFj
aGVkIGVuZCBvZiBFRVBST00gbWVtb3J5LCBqdW1waW5nIHRvIDAgIg0KPiArCQkJICJhbmQgb3Zl
cnJpZGluZyBvbGQgcmVjb3JkIik7DQo+ICsJCXJldHVybiBFRVBST01fUkVDT1JEX1NUQVJUOw0K
PiArCX0NCj4gKw0KPiArCS8qDQo+ICsJICogVG8gY2hlY2sgaWYgd2Ugb3ZlcmZsb3cgcGFnZSBi
b3VuZGFyeSAgY29tcGFyZSBuZXh0IGFkZHJlc3Mgd2l0aA0KPiArCSAqIGN1cnJlbnQgYW5kIHNl
ZSBpZiBiaXRzIDE3Lzggb2YgdGhlIEVFUFJPTSBhZGRyZXNzIHdpbGwgY2hhbmdlDQo+ICsJICog
SWYgdGhleSBkbyBzdGFydCBmcm9tIHRoZSBuZXh0IDI1NmIgcGFnZQ0KPiArCSAqDQo+ICsJICog
aHR0cHM6Ly93d3cuc3QuY29tL3Jlc291cmNlL2VuL2RhdGFzaGVldC9tMjRtMDItZHIucGRmIHNl
Yy4gNS4xLjINCj4gKwkgKi8NCj4gKwlpZiAoKGN1cnJfYWRkcmVzcyAmIEVFUFJPTV9BRERSX01T
Ql9NQVNLKSAhPSAobmV4dF9hZGRyZXNzICYgRUVQUk9NX0FERFJfTVNCX01BU0spKSB7DQo+ICsJ
CURSTV9ERUJVR19EUklWRVIoIlJlYWNoZWQgZW5kIG9mIEVFUFJPTSBtZW1vcnkgcGFnZSwganVt
cGltbmcgdG8gbmV4dDogJWx4IiwNCj4gKwkJCQkobmV4dF9hZGRyZXNzICYgRUVQUk9NX0FERFJf
TVNCX01BU0spKTsNCj4gKw0KPiArCQlyZXR1cm4gIChuZXh0X2FkZHJlc3MgJiBFRVBST01fQURE
Ul9NU0JfTUFTSyk7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIGN1cnJfYWRkcmVzczsNCj4gK30N
Cj4gKw0KPiArDQo+ICtzdGF0aWMgdWludDMyX3QgIF9fY2FsY19oZHJfYnl0ZV9zdW0oc3RydWN0
IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpDQo+ICt7DQo+ICsJaW50IGk7DQo+
ICsJdWludDMyX3QgdGJsX3N1bSA9IDA7DQo+ICsNCj4gKwkvKiBIZWFkZXIgY2hlY2tzdW0sIHNr
aXAgY2hlY2tzdW0gZmllbGQgaW4gdGhlIGNhbGN1bGF0aW9uICovDQo+ICsJZm9yIChpID0gMDsg
aSA8IHNpemVvZihjb250cm9sLT50YmxfaGRyKSAtIHNpemVvZihjb250cm9sLT50YmxfaGRyLmNo
ZWNrc3VtKTsgaSsrKQ0KPiArCQl0Ymxfc3VtICs9ICooKCh1bnNpZ25lZCBjaGFyICopJmNvbnRy
b2wtPnRibF9oZHIpICsgaSk7DQo+ICsNCj4gKwlyZXR1cm4gdGJsX3N1bTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIHVpbnQzMl90ICBfX2NhbGNfcmVjc19ieXRlX3N1bShzdHJ1Y3QgZWVwcm9tX3Rh
YmxlX3JlY29yZCAqcmVjb3JkcywNCj4gKwkJCQkgICAgICBpbnQgbnVtKQ0KPiArew0KPiArCWlu
dCBpLCBqOw0KPiArCXVpbnQzMl90IHRibF9zdW0gPSAwOw0KPiArDQo+ICsJLyogUmVjb3JkcyBj
aGVja3N1bSAqLw0KPiArCWZvciAoaSA9IDA7IGkgPCBudW07IGkrKykgew0KPiArCQlzdHJ1Y3Qg
ZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkID0gJnJlY29yZHNbaV07DQo+ICsNCj4gKwkJZm9y
IChqID0gMDsgaiA8IHNpemVvZigqcmVjb3JkKTsgaisrKSB7DQo+ICsJCQl0Ymxfc3VtICs9ICoo
KCh1bnNpZ25lZCBjaGFyICopcmVjb3JkKSArIGopOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJ
cmV0dXJuIHRibF9zdW07DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgdWludDMyX3QgIF9f
Y2FsY190YmxfYnl0ZV9zdW0oc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRy
b2wsDQo+ICsJCQkJICBzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkcywgaW50IG51
bSkNCj4gK3sNCj4gKwlyZXR1cm4gX19jYWxjX2hkcl9ieXRlX3N1bShjb250cm9sKSArIF9fY2Fs
Y19yZWNzX2J5dGVfc3VtKHJlY29yZHMsIG51bSk7DQo+ICt9DQo+ICsNCj4gKy8qIENoZWNrc3Vt
ID0gMjU2IC0oKHN1bSBvZiBhbGwgdGFibGUgZW50cmllcykgbW9kIDI1NinCoCovDQo+ICtzdGF0
aWMgdm9pZCBfX3VwZGF0ZV90YmxfY2hlY2tzdW0oc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2Nv
bnRyb2wgKmNvbnRyb2wsDQo+ICsJCQkJICBzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVj
b3JkcywgaW50IG51bSwNCj4gKwkJCQkgIHVpbnQzMl90IG9sZF9oZHJfYnl0ZV9zdW0pDQo+ICt7
DQo+ICsJLyoNCj4gKwkgKiBUaGlzIHdpbGwgdXBkYXRlIHRoZSB0YWJsZSBzdW0gd2l0aCBuZXcg
cmVjb3Jkcy4NCj4gKwkgKg0KPiArCSAqIFRPRE86IFdoYXQgaGFwcGVucyB3aGVuIHRoZSBFRVBS
T00gdGFibGUgaXMgdG8gYmUgd3JhcHBlZCBhcm91bmQNCj4gKwkgKiBhbmQgb2xkIHJlY29yZHMg
ZnJvbSBzdGFydCB3aWxsIGdldCBvdmVycmlkZGVuLg0KPiArCSAqLw0KPiArDQo+ICsJLyogbmVl
ZCB0byByZWNhbGN1bGF0ZSB1cGRhdGVkIGhlYWRlciBieXRlIHN1bSAqLw0KPiArCWNvbnRyb2wt
PnRibF9ieXRlX3N1bSAtPSBvbGRfaGRyX2J5dGVfc3VtOw0KPiArCWNvbnRyb2wtPnRibF9ieXRl
X3N1bSArPSBfX2NhbGNfdGJsX2J5dGVfc3VtKGNvbnRyb2wsIHJlY29yZHMsIG51bSk7DQo+ICsN
Cj4gKwljb250cm9sLT50YmxfaGRyLmNoZWNrc3VtID0gMjU2IC0gKGNvbnRyb2wtPnRibF9ieXRl
X3N1bSAlIDI1Nik7DQo+ICt9DQo+ICsNCj4gKy8qIHRhYmxlIHN1bSBtb2QgMjU2ICsgY2hlY2tz
dW0gbXVzdCBlcXVhbHMgMjU2ICovDQo+ICtzdGF0aWMgYm9vbCBfX3ZhbGlkYXRlX3RibF9jaGVj
a3N1bShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCj4gKwkJCSAg
ICBzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkcywgaW50IG51bSkNCj4gK3sNCj4g
Kwljb250cm9sLT50YmxfYnl0ZV9zdW0gPSBfX2NhbGNfdGJsX2J5dGVfc3VtKGNvbnRyb2wsIHJl
Y29yZHMsIG51bSk7DQo+ICsNCj4gKwlpZiAoY29udHJvbC0+dGJsX2hkci5jaGVja3N1bSArIChj
b250cm9sLT50YmxfYnl0ZV9zdW0gJSAyNTYpICE9IDI1Nikgew0KPiArCQlEUk1fV0FSTigiQ2hl
Y2tzdW0gbWlzbWF0Y2gsIGNoZWNrc3VtOiAldSAiLCBjb250cm9sLT50YmxfaGRyLmNoZWNrc3Vt
KTsNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiAr
fQ0KPiArDQo+ICtpbnQgYW1kZ3B1X3Jhc19lZXByb21fcHJvY2Vzc19yZWNvZHMoc3RydWN0IGFt
ZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wsDQo+ICsJCQkJCSAgICBzdHJ1Y3QgZWVw
cm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkcywNCj4gKwkJCQkJICAgIGJvb2wgd3JpdGUsDQo+ICsJ
CQkJCSAgICBpbnQgbnVtKQ0KPiArew0KPiArCWludCBpLCByZXQgPSAwOw0KPiArCXN0cnVjdCBp
MmNfbXNnICptc2dzOw0KPiArCXVuc2lnbmVkIGNoYXIgKmJ1ZmZzOw0KPiArCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2RldmljZShjb250cm9sKTsNCj4gKw0KPiArCWlm
IChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdBMjApDQo+ICsJCXJldHVybiAwOw0KPiArDQo+
ICsJYnVmZnMgPSBrY2FsbG9jKG51bSwgRUVQUk9NX0FERFJFU1NfU0laRSArIEVFUFJPTV9UQUJM
RV9SRUNPUkRfU0laRSwNCj4gKwkJCSBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWJ1ZmZzKQ0KPiAr
CQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCW11dGV4X2xvY2soJmNvbnRyb2wtPnRibF9tdXRl
eCk7DQo+ICsNCj4gKwltc2dzID0ga2NhbGxvYyhudW0sIHNpemVvZigqbXNncyksIEdGUF9LRVJO
RUwpOw0KPiArCWlmICghbXNncykgew0KPiArCQlyZXQgPSAtRU5PTUVNOw0KPiArCQlnb3RvIGZy
ZWVfYnVmZjsNCj4gKwl9DQo+ICsNCj4gKwkvKiBJbiBjYXNlIG9mIG92ZXJmbG93IGp1c3Qgc3Rh
cnQgZnJvbSBiZWdpbm5pbmcgdG8gbm90IGxvc2UgbmV3ZXN0IHJlY29yZHMgKi8NCj4gKwlpZiAo
d3JpdGUgJiYgKGNvbnRyb2wtPm5leHRfYWRkciArIEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRSAq
IG51bSA+IEVFUFJPTV9TSVpFX0JZVEVTKSkNCj4gKwkJY29udHJvbC0+bmV4dF9hZGRyID0gRUVQ
Uk9NX1JFQ09SRF9TVEFSVDsNCj4gKw0KPiArDQo+ICsJLyoNCj4gKwkgKiBUT0RPIEN1cnJlbnRs
eSBtYWtlcyBFRVBST00gd3JpdGVzIGZvciBlYWNoIHJlY29yZCwgdGhpcyBjcmVhdGVzDQo+ICsJ
ICogaW50ZXJuYWwgZnJhZ21lbnRhdGlvbi4gT3B0aW1pemVkIHRoZSBjb2RlIHRvIGRvIGZ1bGwg
cGFnZSB3cml0ZSBvZg0KPiArCSAqIDI1NmINCj4gKwkgKi8NCj4gKwlmb3IgKGkgPSAwOyBpIDwg
bnVtOyBpKyspIHsNCj4gKwkJdW5zaWduZWQgY2hhciAqYnVmZiA9ICZidWZmc1tpKihFRVBST01f
QUREUkVTU19TSVpFICsgRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFKV07DQo+ICsJCXN0cnVjdCBl
ZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmQgPSAmcmVjb3Jkc1tpXTsNCj4gKwkJc3RydWN0IGky
Y19tc2cgKm1zZyA9ICZtc2dzW2ldOw0KPiArDQo+ICsJCWNvbnRyb2wtPm5leHRfYWRkciA9IF9f
Y29ycmVjdF9lZXByb21fZGVzdF9hZGRyZXNzKGNvbnRyb2wtPm5leHRfYWRkcik7DQo+ICsNCj4g
KwkJLyoNCj4gKwkJICogVXBkYXRlIGJpdHMgMTYsMTcgb2YgRUVQUk9NIGFkZHJlc3MgaW4gSTJD
IGFkZHJlc3MgYnkgc2V0dGluZyB0aGVtDQo+ICsJCSAqIHRvIGJpdHMgMSwyIG9mIERldmljZSBh
ZGRyZXNzIGJ5dGUNCj4gKwkJICovDQo+ICsJCW1zZy0+YWRkciA9IEVFUFJPTV9JMkNfVEFSR0VU
X0FERFIgfA0KPiArCQkJICAgICAgICgoY29udHJvbC0+bmV4dF9hZGRyICYgRUVQUk9NX0FERFJf
TVNCX01BU0spID4+IDE1KTsNCj4gKwkJbXNnLT5mbGFncwk9IHdyaXRlID8gMCA6IEkyQ19NX1JE
Ow0KPiArCQltc2ctPmxlbgk9IEVFUFJPTV9BRERSRVNTX1NJWkUgKyBFRVBST01fVEFCTEVfUkVD
T1JEX1NJWkU7DQo+ICsJCW1zZy0+YnVmCT0gYnVmZjsNCj4gKw0KPiArCQkvKiBJbnNlcnQgdGhl
IEVFUFJPTSBkZXN0IGFkZGVzcywgYml0cyAwLTE1ICovDQo+ICsJCWJ1ZmZbMF0gPSAoKGNvbnRy
b2wtPm5leHRfYWRkciA+PiA4KSAmIDB4ZmYpOw0KPiArCQlidWZmWzFdID0gKGNvbnRyb2wtPm5l
eHRfYWRkciAmIDB4ZmYpOw0KPiArDQo+ICsJCS8qIEVFUFJPTSB0YWJsZSBjb250ZW50IGlzIHN0
b3JlZCBpbiBMRSBmb3JtYXQgKi8NCj4gKwkJaWYgKHdyaXRlKQ0KPiArCQkJX19lbmNvZGVfdGFi
bGVfcmVjb3JkX3RvX2J1ZmYoY29udHJvbCwgcmVjb3JkLCBidWZmICsgRUVQUk9NX0FERFJFU1Nf
U0laRSk7DQo+ICsNCj4gKwkJLyoNCj4gKwkJICogVGhlIGRlc3RpbmF0aW9uIEVFUFJPTSBhZGRy
ZXNzIG1pZ2h0IG5lZWQgdG8gYmUgY29ycmVjdGVkIHRvIGFjY291bnQNCj4gKwkJICogZm9yIHBh
Z2Ugb3IgZW50aXJlIG1lbW9yeSB3cmFwcGluZw0KPiArCQkgKi8NCj4gKwkJY29udHJvbC0+bmV4
dF9hZGRyICs9IEVFUFJPTV9UQUJMRV9SRUNPUkRfU0laRTsNCj4gKwl9DQo+ICsNCj4gKwlyZXQg
PSBpMmNfdHJhbnNmZXIoJmNvbnRyb2wtPmVlcHJvbV9hY2Nlc3NvciwgbXNncywgbnVtKTsNCj4g
KwlpZiAocmV0IDwgMSkgew0KPiArCQlEUk1fRVJST1IoIkZhaWxlZCB0byBwcm9jZXNzIEVFUFJP
TSB0YWJsZSByZWNvcmRzLCByZXQ6JWQiLCByZXQpOw0KPiArDQo+ICsJCS8qIFRPRE8gUmVzdG9y
ZSBwcmV2IG5leHQgRUVQUk9NIGFkZHJlc3MgPyAqLw0KPiArCQlnb3RvIGZyZWVfbXNnczsNCj4g
Kwl9DQo+ICsNCj4gKw0KPiArCWlmICghd3JpdGUpIHsNCj4gKwkJZm9yIChpID0gMDsgaSA8IG51
bTsgaSsrKSB7DQo+ICsJCQl1bnNpZ25lZCBjaGFyICpidWZmID0gJmJ1ZmZzW2kqKEVFUFJPTV9B
RERSRVNTX1NJWkUgKyBFRVBST01fVEFCTEVfUkVDT1JEX1NJWkUpXTsNCj4gKwkJCXN0cnVjdCBl
ZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmQgPSAmcmVjb3Jkc1tpXTsNCj4gKw0KPiArCQkJX19k
ZWNvZGVfdGFibGVfcmVjb3JkX2Zyb21fYnVmZihjb250cm9sLCByZWNvcmQsIGJ1ZmYgKyBFRVBS
T01fQUREUkVTU19TSVpFKTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWlmICh3cml0ZSkgew0K
PiArCQl1aW50MzJfdCBvbGRfaGRyX2J5dGVfc3VtID0gX19jYWxjX2hkcl9ieXRlX3N1bShjb250
cm9sKTsNCj4gKw0KPiArCQkvKg0KPiArCQkgKiBVcGRhdGUgdGFibGUgaGVhZGVyIHdpdGggc2l6
ZSBhbmQgQ1JDIGFuZCBhY2NvdW50IGZvciB0YWJsZQ0KPiArCQkgKiB3cmFwIGFyb3VuZCB3aGVy
ZSB0aGUgYXNzdW1wdGlvbiBpcyB0aGF0IHdlIHRyZWF0IGl0IGFzIGVtcHR5DQo+ICsJCSAqIHRh
YmxlDQo+ICsJCSAqDQo+ICsJCSAqIFRPRE8gLSBDaGVjayB0aGUgYXNzdW1wdGlvbiBpcyBjb3Jy
ZWN0DQo+ICsJCSAqLw0KPiArCQljb250cm9sLT5udW1fcmVjcyArPSBudW07DQo+ICsJCWNvbnRy
b2wtPm51bV9yZWNzICU9IEVFUFJPTV9NQVhfUkVDT1JEX05VTTsNCj4gKwkJY29udHJvbC0+dGJs
X2hkci50Ymxfc2l6ZSArPSBFRVBST01fVEFCTEVfUkVDT1JEX1NJWkUgKiBudW07DQo+ICsJCWlm
IChjb250cm9sLT50YmxfaGRyLnRibF9zaXplID4gRUVQUk9NX1NJWkVfQllURVMpDQo+ICsJCQlj
b250cm9sLT50YmxfaGRyLnRibF9zaXplID0gRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFICsNCj4g
KwkJCWNvbnRyb2wtPm51bV9yZWNzICogRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFOw0KPiArDQo+
ICsJCV9fdXBkYXRlX3RibF9jaGVja3N1bShjb250cm9sLCByZWNvcmRzLCBudW0sIG9sZF9oZHJf
Ynl0ZV9zdW0pOw0KPiArDQo+ICsJCV9fdXBkYXRlX3RhYmxlX2hlYWRlcihjb250cm9sLCBidWZm
cyk7DQo+ICsJfSBlbHNlIGlmICghX192YWxpZGF0ZV90YmxfY2hlY2tzdW0oY29udHJvbCwgcmVj
b3JkcywgbnVtKSkgew0KPiArCQlEUk1fV0FSTigiRUVQUk9NIFRhYmxlIGNoZWNrc3VtIG1pc21h
dGNoISIpOw0KPiArCQkvKiBUT0RPIFVuY29tbWVudCB3aGVuIEVFUFJPTSByZWFkL3dyaXRlIGlz
IHJlbGxpYWJsZSAqLw0KPiArCQkvKiByZXQgPSAtRUlPOyAqLw0KPiArCX0NCj4gKw0KPiArZnJl
ZV9tc2dzOg0KPiArCWtmcmVlKG1zZ3MpOw0KPiArDQo+ICtmcmVlX2J1ZmY6DQo+ICsJa2ZyZWUo
YnVmZnMpOw0KPiArDQo+ICsJbXV0ZXhfdW5sb2NrKCZjb250cm9sLT50YmxfbXV0ZXgpOw0KPiAr
DQo+ICsJcmV0dXJuIHJldCA9PSBudW0gPyAwIDogLUVJTzsNCj4gK30NCj4gKw0KPiArdm9pZCBh
bWRncHVfcmFzX2VlcHJvbV90ZXN0KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpj
b250cm9sKQ0KPiArew0KPiArCWludCBpOw0KPiArCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3Jk
ICpyZWNzID0ga2NhbGxvYygxLCBzaXplb2YoKnJlY3MpLCBHRlBfS0VSTkVMKTsNCj4gKw0KPiAr
CWlmICghcmVjcykNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IDEgOyBp
KyspIHsNCj4gKwkJcmVjc1tpXS5hZGRyZXNzID0gMHhkZWFkYmVlZjsNCj4gKwkJcmVjc1tpXS5y
ZXRpcmVkX3BhZ2UgPSBpOw0KPiArCX0NCj4gKw0KPiArCWlmICghYW1kZ3B1X3Jhc19lZXByb21f
cHJvY2Vzc19yZWNvZHMoY29udHJvbCwgcmVjcywgdHJ1ZSwgMSkpIHsNCj4gKw0KPiArCQltZW1z
ZXQocmVjcywgMCwgc2l6ZW9mKCpyZWNzKSAqIDEpOw0KPiArDQo+ICsJCWNvbnRyb2wtPm5leHRf
YWRkciA9IEVFUFJPTV9SRUNPUkRfU1RBUlQ7DQo+ICsNCj4gKwkJaWYgKCFhbWRncHVfcmFzX2Vl
cHJvbV9wcm9jZXNzX3JlY29kcyhjb250cm9sLCByZWNzLCBmYWxzZSwgMSkpIHsNCj4gKwkJCWZv
ciAoaSA9IDA7IGkgPCAxOyBpKyspDQo+ICsJCQkJRFJNX0lORk8oInJlYy5hZGRyZXNzIDoweCVs
bHgsIHJlYy5yZXRpcmVkX3BhZ2UgOiVsbHUiLA0KPiArCQkJCQkgcmVjc1tpXS5hZGRyZXNzLCBy
ZWNzW2ldLnJldGlyZWRfcGFnZSk7DQo+ICsJCX0gZWxzZQ0KPiArCQkJRFJNX0VSUk9SKCJGYWls
ZWQgaW4gcmVhZGluZyBmcm9tIHRhYmxlIik7DQo+ICsNCj4gKwl9IGVsc2UNCj4gKwkJRFJNX0VS
Uk9SKCJGYWlsZWQgaW4gd3JpdGluZyB0byB0YWJsZSIpOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmgNCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uNDFmM2ZjYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmgNCj4gQEAgLTAs
MCArMSw5MCBAQA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERl
dmljZXMsIEluYy4NCj4gKyAqDQo+ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBm
cmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQ0KPiArICogY29weSBvZiB0
aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29m
dHdhcmUiKSwNCj4gKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rp
b24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24NCj4gKyAqIHRoZSByaWdodHMgdG8gdXNl
LCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLA0K
PiArICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBw
ZXJzb25zIHRvIHdob20gdGhlDQo+ICsgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28s
IHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOg0KPiArICoNCj4gKyAqIFRoZSBh
Ym92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJl
IGluY2x1ZGVkIGluDQo+ICsgKiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9m
IHRoZSBTb2Z0d2FyZS4NCj4gKyAqDQo+ICsgKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFT
IElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUg0KPiArICogSU1Q
TElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJD
SEFOVEFCSUxJVFksDQo+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQg
Tk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwNCj4gKyAqIFRIRSBDT1BZUklHSFQg
SE9MREVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBP
Ug0KPiArICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFD
VCwgVE9SVCBPUiBPVEhFUldJU0UsDQo+ICsgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBD
T05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1INCj4gKyAqIE9USEVSIERF
QUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4NCj4gKyAqDQo+ICsgKi8NCj4gKw0KPiArI2lmbmRlZiBf
QU1ER1BVX1JBU19FRVBST01fSA0KPiArI2RlZmluZSBfQU1ER1BVX1JBU19FRVBST01fSA0KPiAr
DQo+ICsjaW5jbHVkZSA8bGludXgvaTJjLmg+DQo+ICsNCj4gK3N0cnVjdCBhbWRncHVfZGV2aWNl
Ow0KPiArDQo+ICtlbnVtIGFtZGdwdV9yYXNfZWVwcm9tX2Vycl90eXBlew0KPiArCUFNREdQVV9S
QVNfRUVQUk9NX0VSUl9QTEFDRV9IT0xERVIsDQo+ICsJQU1ER1BVX1JBU19FRVBST01fRVJSX1JF
Q09WRVJBQkxFLA0KPiArCUFNREdQVV9SQVNfRUVQUk9NX0VSUl9OT05fUkVDT1ZFUkFCTEUNCj4g
K307DQo+ICsNCj4gK3N0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV90YWJsZV9oZWFkZXIgew0KPiAr
CXVpbnQzMl90IGhlYWRlcjsNCj4gKwl1aW50MzJfdCB2ZXJzaW9uOw0KPiArCXVpbnQzMl90IGZp
cnN0X3JlY19vZmZzZXQ7DQo+ICsJdWludDMyX3QgdGJsX3NpemU7DQo+ICsJdWludDMyX3QgY2hl
Y2tzdW07DQo+ICt9X19hdHRyaWJ1dGVfXygoX19wYWNrZWRfXykpOw0KPiArDQo+ICtzdHJ1Y3Qg
YW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCB7DQo+ICsJc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9t
X3RhYmxlX2hlYWRlciB0YmxfaGRyOw0KPiArCXN0cnVjdCBpMmNfYWRhcHRlciBlZXByb21fYWNj
ZXNzb3I7DQo+ICsJdWludDMyX3QgbmV4dF9hZGRyOw0KPiArCXVuc2lnbmVkIGludCBudW1fcmVj
czsNCj4gKwlzdHJ1Y3QgbXV0ZXggdGJsX211dGV4Ow0KPiArCWJvb2wgYnVzX2xvY2tlZDsNCj4g
Kwl1aW50MzJfdCB0YmxfYnl0ZV9zdW07DQo+ICt9Ow0KPiArDQo+ICsvKg0KPiArICogUmVwcmVz
ZW50cyBzaW5nbGUgdGFibGUgcmVjb3JkLiBQYWNrZWQgdG8gYmUgZWFzaWx5IHNlcmlhbGl6ZWQg
aW50byBieXRlDQo+ICsgKiBzdHJlYW0uDQo+ICsgKi8NCj4gK3N0cnVjdCBlZXByb21fdGFibGVf
cmVjb3JkIHsNCj4gKw0KPiArCXVuaW9uIHsNCj4gKwkJdWludDY0X3QgYWRkcmVzczsNCj4gKwkJ
dWludDY0X3Qgb2Zmc2V0Ow0KPiArCX07DQo+ICsNCj4gKwl1aW50NjRfdCByZXRpcmVkX3BhZ2U7
DQo+ICsJdWludDY0X3QgdHM7DQo+ICsNCj4gKwllbnVtIGFtZGdwdV9yYXNfZWVwcm9tX2Vycl90
eXBlIGVycl90eXBlOw0KPiArDQo+ICsJdW5pb24gew0KPiArCQl1bnNpZ25lZCBjaGFyIGJhbms7
DQo+ICsJCXVuc2lnbmVkIGNoYXIgY3U7DQo+ICsJfTsNCj4gKw0KPiArCXVuc2lnbmVkIGNoYXIg
bWVtX2NoYW5uZWw7DQo+ICsJdW5zaWduZWQgY2hhciBtY3VtY19pZDsNCj4gK31fX2F0dHJpYnV0
ZV9fKChfX3BhY2tlZF9fKSk7DQo+ICsNCj4gK2ludCBhbWRncHVfcmFzX2VlcHJvbV9pbml0KHN0
cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sKTsNCj4gK3ZvaWQgYW1kZ3B1
X3Jhc19lZXByb21fZmluaShzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJv
bCk7DQo+ICsNCj4gK2ludCBhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNzX3JlY29kcyhzdHJ1Y3Qg
YW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCj4gKwkJCQkJICAgIHN0cnVjdCBl
ZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmRzLA0KPiArCQkJCQkgICAgYm9vbCB3cml0ZSwNCj4g
KwkJCQkJICAgIGludCBudW0pOw0KPiArDQo+ICt2b2lkIGFtZGdwdV9yYXNfZWVwcm9tX3Rlc3Qo
c3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpOw0KPiArDQo+ICsjZW5k
aWYgLy8gX0FNREdQVV9SQVNfRUVQUk9NX0gNCj4gDQoNCg0KUmVnYXJkcywNCi0tIA0KTHViZW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
