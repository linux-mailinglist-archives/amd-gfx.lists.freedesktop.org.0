Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB535C9F3
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 09:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290E7892BD;
	Tue,  2 Jul 2019 07:29:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720073.outbound.protection.outlook.com [40.107.72.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7B1892BD
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 07:29:39 +0000 (UTC)
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3501.namprd12.prod.outlook.com (20.178.241.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 07:29:37 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::4456:680a:ea21:4d42]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::4456:680a:ea21:4d42%4]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 07:29:37 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: remove an unused variable
Thread-Topic: [PATCH] drm/amdkfd: remove an unused variable
Thread-Index: AQHVMKOJswsYwohLvUelXceFASPxLaa27T3Q
Date: Tue, 2 Jul 2019 07:29:37 +0000
Message-ID: <MN2PR12MB3536904AFC3AC4A4FD95350AFBF80@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1562050664-24740-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1562050664-24740-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f01b17e-4a43-4675-4c6d-08d6febf09f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3501; 
x-ms-traffictypediagnostic: MN2PR12MB3501:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3501829DB3ADA15FC915390EFBF80@MN2PR12MB3501.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(13464003)(189003)(199004)(73956011)(5660300002)(66066001)(25786009)(66446008)(64756008)(66556008)(66476007)(66946007)(52536014)(76116006)(6506007)(53546011)(102836004)(26005)(4326008)(256004)(3846002)(86362001)(14444005)(6116002)(11346002)(486006)(476003)(446003)(14454004)(229853002)(966005)(53936002)(71190400001)(71200400001)(55016002)(8936002)(6306002)(9686003)(316002)(7736002)(68736007)(2501003)(33656002)(6436002)(99286004)(478600001)(76176011)(7696005)(2906002)(8676002)(81166006)(81156014)(305945005)(6246003)(72206003)(74316002)(186003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3501;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uF195La6wvBkbRaPmgTYkHPd4nyOEY8rLnA5N8/zUspTK6SqOyHP+tz9EEC8zksT6sFFyLPzqc3HGhJq2AeKQnpsfjItTC4e7TCX3lqipGFU+1Zymsv3YU3MZskfnbrIhvaviaBTfFHu/dATEfI0NBJSzCuSDHdJ0X9gEWhDNmMLrsUNxEDLgSWVTkGkuYzs0p78QeMPGDqCu33MGbTAzB3EYHbASMUaXyNb94vwSqQS+gc9gYnNFDU4ZiZmXYVNHv2IwInCL3BI0bbABI98YBlSUDHF54VZI/ZCoRu+SxGg7wB9EGMVeJQg1U7xPZuDc29VHbsu9u+gXVo5Hmpe0BN85udTn2R/pIaj6gW+k97qjGhAgw9PF71zNxi8DgGG8chfOFDRHDDRWdY+bgpdzEwPWbY6fdYuFdZKl5S/PJM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f01b17e-4a43-4675-4c6d-08d6febf09f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 07:29:37.7318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prliang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osdj8JbPxKbBr7H8G3qrsHIGJzVWMHAFsRWdtYyPOr8=;
 b=UdXCh3gEM1SDnJCdmoNwdpNkt+Owh0CgLIrPetdtsXyQOOW1VVmEG36cNPZJcqe83in1YJWwcDBEkPMCvlzaTgBGeKUEqMVtFE5cO2crY6imUYhknLqubUqeAjdbpRFp31Mc/0OBk4iPF7jApBH/yahZUWJ81Z0EGjzCP9wBBGk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

WWVhaCwgSSBhbHNvIG5vdGljZWQgdGhlIGJ1aWxkIHdhcm5pbmcgYW5kIHRoYW5rcyBjbGVhbiB1
cC4NCg0KUmV2aWV3ZWQtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KDQpU
aGFua3MsDQpQcmlrZQ0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
WGlhbywNCj4gSmFjaw0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDAyLCAyMDE5IDI6NTggUE0NCj4g
VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBYaWFvLCBKYWNrIDxKYWNr
LlhpYW9AYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1ka2ZkOiByZW1vdmUgYW4g
dW51c2VkIHZhcmlhYmxlDQo+IA0KPiBKdXN0IGZvciBjbGVhbnVwLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCAxIC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jDQo+IGluZGV4IDI0ZGI4MmIuLjMzMjJhNDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gQEAgLTQ4Nyw3ICs0ODcsNiBAQCBzdHJ1Y3Qga2ZkX2Rl
diAqa2dkMmtmZF9wcm9iZShzdHJ1Y3Qga2dkX2RldiAqa2dkLA0KPiAgCXN0cnVjdCBwY2lfZGV2
ICpwZGV2LCBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyAqZjJnKSAgew0KPiAgCXN0cnVjdCBr
ZmRfZGV2ICprZmQ7DQo+IC0JaW50IHJldDsNCj4gIAljb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9p
bmZvICpkZXZpY2VfaW5mbyA9DQo+ICAJCQkJCWxvb2t1cF9kZXZpY2VfaW5mbyhwZGV2LT5kZXZp
Y2UpOw0KPiANCj4gLS0NCj4gMS45LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
