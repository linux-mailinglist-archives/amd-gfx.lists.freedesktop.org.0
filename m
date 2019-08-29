Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B3A2705
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 21:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16A16E152;
	Thu, 29 Aug 2019 19:09:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E812D6E152
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 19:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRpstCV9d4gu0W+vOxNTd9QbFwr3oTkLbSzgdTW+FuHRqt1q3YmiuoU6xXm+bnyh85rdNbmY+8YQKLGsbFiVNgLoQ8hYUHBj0m5aSEWxv4hFWH9vqdT/dHBe04z6WXPZSaqLeBUyO84I4cCDVlJPVeipuReLet2NTU5J2hr+P7bTfD9/ceYvqW6qW8Dfhi7mNeRKe0wkkTk2EUVTBw8OjxvVwtASAHqWvYDPEjUd9XEXLUmGzBFSuuUnpdrV1rLJqasibFooU4L4ckrCCc1lIXweWyYfKTLpX2jNp8imnmqoROSTMmlgZG/9EP88LjuLCOXMrrw6Bet9WSm5xKVK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjknnF/BzZB6oRT+iQCs7MnguuTYLFwX5qngPnN6qFk=;
 b=fj0gzmgOeqkiI38USdMoseD8sc4Zw4/5GeRxPwiqn1FsGFYkSDhh6VrpnI/7JATGdclT2dh3ucLWO7A8lwDifSjm9VgNiEV42B0OeGFIvyfpOYBNzTWmoHYYLcqCXK9XtGRDGyqIW5kCqwXUXIZIVytzMCseOBhpPr2978dw4TlfuiBM/0iXCzWKwJsmJKeUeZbF0v4Db2z2nxPhEh+UGOusS3vlt6nRRVVpQMhXnYvWztluL27b435OAunSfNd+S23/PCbinDjBDa6d0yuQL3LePaav3jc662IfpZPikDhRdtHYhgu9oKw/xsIEc6sOnPCyXjgcQzEy9fF9mwv0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2794.namprd12.prod.outlook.com (20.176.117.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Thu, 29 Aug 2019 19:09:29 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 19:09:29 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Topic: [PATCH 1/2] dmr/amdgpu: Avoid HW GPU reset for RAS.
Thread-Index: AQHVXdtIbt+c9wcLM02KYbAzIAaCdqcRu5gAgABt3gCAAACwAIAAAIeAgAAkUICAABGZAIAAHkGA
Date: Thu, 29 Aug 2019 19:09:29 +0000
Message-ID: <f5c745ba-da46-d2b3-92eb-7aa91e520b5c@amd.com>
References: <1567022426-6612-1-git-send-email-andrey.grodzovsky@amd.com>
 <85798da5-a4f1-28d3-c80f-9f262743cac9@gmail.com>
 <9a46188b-b528-0d1f-8c3f-b6ce5b73649f@amd.com>
 <8c2b0bf3-47ff-ea3b-a682-7ec76240be4d@amd.com>
 <1444ae5f-0997-d1ce-3e1e-23fea8822c88@amd.com>
 <3a39a720-ae2d-0019-aecc-422f0e3f27bb@amd.com>
 <2763a85d-cfd7-bf80-5d8b-3590cf35e6d0@amd.com>
In-Reply-To: <2763a85d-cfd7-bf80-5d8b-3590cf35e6d0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 772aaf70-8e75-42e0-9d20-08d72cb46a85
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2794; 
x-ms-traffictypediagnostic: DM6PR12MB2794:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB27945A7D658210B8B9E079AF92A20@DM6PR12MB2794.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(199004)(189003)(76176011)(478600001)(305945005)(6306002)(6512007)(7736002)(6436002)(316002)(66946007)(110136005)(58126008)(54906003)(52116002)(4326008)(31686004)(53936002)(99286004)(25786009)(5660300002)(66476007)(2501003)(66556008)(64756008)(66446008)(6246003)(31696002)(86362001)(966005)(14454004)(2906002)(8936002)(81166006)(3846002)(8676002)(81156014)(6116002)(36756003)(65806001)(66066001)(186003)(386003)(53546011)(229853002)(6506007)(65956001)(71190400001)(102836004)(71200400001)(6486002)(476003)(26005)(14444005)(256004)(486006)(11346002)(446003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2794;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KKemNrUHsIVFdDphFZ6uOK7I8qduvF5rnyWfgi65YR4UKM6drpri5wY0D1PolEuLYIY2Y9Dl31HVON3eqk0aQNH3iGrJoubJoBwLIwUmJwjMd5cT1j4h+iYxJ+CaaCQXyk2n98H4sBYJIsAzcDe0nGHRr0aW/Yq8gEjWp6HmH32hQA8bQJ/r8EjzZQdGULwKQBKDayO9niuwxC+6Yip3eDmEFeiNPdo+RxILIMZ7fga2wGzkDN3tCl2DuD48s9Et/RZaELjMBMzGWjDMbZ4TvhUiyMMs+rxT55T1m6cjcqoB1xHcY3yaPiXfi3782AvRygVXe2qJn4rSI5/EkNp585XPDv7IHiocakBygVZxXnsu66RwKcEPBWozY3iCFjtj8hYd9vDLt18QHAWc5iOR7ziJqPBBBeyYLgwqRkeTevM=
Content-ID: <F9D66803E8BD6E449AC225F4E9BF0C97@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772aaf70-8e75-42e0-9d20-08d72cb46a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 19:09:29.1659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pi3M2A7iWteYMHiaaonJ13jksTw8TlB9X3gmwEjhWcSLcieKRR3iHlocea2z4j6y6BsS1DxOCPH4k6JeOOqqjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2794
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjknnF/BzZB6oRT+iQCs7MnguuTYLFwX5qngPnN6qFk=;
 b=SDubkl/MWJZ8ep9gpTsex45ND7jZqeUq0Rl64nd4qZSn9V8Ppih9HUCc5AVAQD5Xo2TADeCAx1rywcJXQO7BCufm+MYHG6shENyoYEt/jI3bwINNzKyMuYOIId8vc09ocfwA0AB+SjhRT90y3IO0HNGGWcCizeWyVGw4ANnIViM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yOSAxOjIxIHAubS4sIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToNCj4gT24g
OC8yOS8xOSAxMjoxOCBQTSwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4gT24gMjAxOS0wOC0y
OSAxMDowOCBhLm0uLCBHcm9kem92c2t5LCBBbmRyZXkgd3JvdGU6DQo+Pj4gQWdyZWUsIHRoZSBw
bGFjZW1lbnQgb2YgYW1kZ3B1X2FtZGtmZF9wcmUvcG9zdCBfcmVzZXQgaW4NCj4+PiBhbWRncHVf
ZGV2aWNlX2xvY2svdW5sb2NrX2FkZXYgaXMgYSBiaXQgd2llcmQuDQo+Pj4NCj4+IGFtZGdwdV9k
ZXZpY2VfcmVzZXRfc3Jpb3YgYWxyZWFkeSBjYWxscyBhbWRncHVfYW1ka2ZkX3ByZS9wb3N0X3Jl
c2V0DQo+PiBpdHNlbGYgd2hpbGUgaXQgaGFzIGV4Y2x1c2l2ZSBhY2Nlc3MgdG8gdGhlIEdQVS4N
Cj4gU28gaW4gdGhhdCBjYXNlIGFtZGdwdV9hbWRrZmRfcHJlL3Bvc3RfcmVzZXQgZ2V0cyBjYWxs
ZWQgdHdpY2UgLSBvbmNlDQo+IGZyb20gYW1kZ3B1X2RldmljZV9sb2NrL3VubG9ja19hZGV2IGFu
ZCBzZWNvbmQgdGltZSBmcm9tDQo+IGFtZGdwdV9kZXZpY2VfcmVzZXRfc3Jpb3YsIG5vID8gV2h5
IGlzIGl0ID8NCg0KTm8sIGl0J3Mgbm90IGNhbGxlZCB0d2ljZSBiZWNhdXNlIHRoZSBiYXJlIG1l
dGFsIGNhc2UgaGFzIGNvbmRpdGlvbnMgaWYgDQooIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkuIElm
IHlvdSBkb24ndCBtb3ZlIHRoZSANCmFtZGdwdV9hbWRrZmRfcHJlL3Bvc3RfcmVzZXQgY2FsbHMg
aW50byBhIGJhcmUtbWV0YWwtc3BlY2lmaWMgY29kZS1wYXRoIA0KKHN1Y2ggYXMgYW1kZ3B1X2Rv
X2FzaWNfcmVzZXQpLCB5b3UnbGwgbmVlZCB0byBrZWVwIHRob3NlIGNvbmRpdGlvbnMuDQoNCg0K
Pg0KPg0KPj4gSXQgd291bGQgbWFrZSBzZW5zZSB0bw0KPj4gbW92ZSB0aGUgc2FtZSBjYWxscyBp
bnRvIGFtZGdwdV9kb19hc2ljX3Jlc2V0IGZvciB0aGUgYmFyZS1tZXRhbCBjYXNlLg0KPg0KPiBQ
cm9ibGVtIGlzIGkgYW0gc2tpcHBpbmcgYW1kZ3B1X2RvX2FzaWNfcmVzZXQgdG90YWxseSBpbiB0
aGlzIGNhc2UgYXMNCj4gdGhlcmUgaXMgbm8gSFcgcmVzZXQgaGVyZSBzbyBpIHdpbGwganVzdCBl
eHRyYWN0IGl0IGZyb20NCj4gYW1kZ3B1X2RldmljZV9sb2NrL3VubG9ja19hZGV2DQoNCk9LLg0K
DQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPg0KPiBBbmRyZXkNCj4NCj4NCj4+IFJlZ2FyZHMs
DQo+PiAgICDCoCBGZWxpeA0KPj4NCj4+DQo+Pj4gQW5kcmV5DQo+Pj4NCj4+PiBPbiA4LzI5LzE5
IDEwOjA2IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+Pj4+IEZlbGl4IGFkdmlzZWQg
dGhhdCB0aGUgd2F5IHRvIHN0b3AgYWxsIEtGRCBhY3Rpdml0eSBpcyBzaW1wbHkgdG8gTk9UDQo+
Pj4+PiBjYWxsIGFtZGdwdV9hbWRrZmRfcG9zdF9yZXNldCBzbyB0aGF0IHdoeSBJIGFkZGVkIHRo
aXMuIERvIHlvdSBtZWFuIHlvdQ0KPj4+Pj4gcHJlZmVyIGFtZGdwdV9hbWRrZmRfcG9zdF9yZXNl
dCB0byBiZSBvdXRzaWRlIG9mIGFtZGdwdV9kZXZpY2VfdW5sb2NrX2FkZXYgPw0KPj4+PiBZZXMs
IGV4YWN0bHkuIEl0IGRvZXNuJ3Qgc2VlbXMgdG8gYmUgcmVsYXRlZCB0byB0aGUgdW5sb2NrIG9w
ZXJhdGlvbiBpbg0KPj4+PiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCByYXRoZXIgb25seSBzaWduYWxz
IHRoZSBLRkQgdGhhdCB0aGUgcmVzZXQgaXMNCj4+Pj4gY29tcGxldGVkLg0KPj4+Pg0KPj4+PiBD
aHJpc3RpYW4uDQo+Pj4+DQo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
