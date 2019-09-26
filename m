Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD2BFA69
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 22:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B36EDFF;
	Thu, 26 Sep 2019 20:08:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780050.outbound.protection.outlook.com [40.107.78.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7843C6EDFF
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 20:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6IxJed0/2hhswXmA01pRn8CHlrAo7TPRix/CSJupVIHBMYqlzCAaegRtnwQerVeQL1iLUOh7qxlFP2+Ljdwc4wGMs/q+FVtI3EKJeuKckvGrosGAJHU/4AagsPFO7tH6OHfHrzD0uF7QVvIVXkrU2ZeVpOLL2h7LYKWVwourLGMIjER+jns0LY3S2lyHpv99NBsHZUFx1FDm6TJQdlLGIC+yAd7SarTn7aHKoTkrmL/ZjyiwphD7MvW8N5KdGGmSrG7UnX/IHAOBC70KDP32uUe5eCn9U/838FvgVNZVcUTi1OeVIv0XRHey/aX0ZOo7stQxoOSv0V/fyflty310w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K56FctWzrA4qwR3+BaE6FgfwG1qSBpcUk2f6iNOhiQA=;
 b=cBEwSg9ENLf+WVQtQpacEWLkac1VnYg5y8cjk7UId9en8wWRgUsjLSBRpk3XLg5F75Jufk5kze235Z6yP7TJr8mkqaVk7nIzkRFMI1jw4iCAz67ixAz940HKpBOxWZt11cbmSte0v4g6hJEf/Bze/4cESNdAiAKOtFZp1wMYEBY0ZmgqxiSuDjiTHd2nWKDtOPygRTjEArjapog6czpnk6uKk/lX+xQ3pifVliM3tSzskY14iC0dC7c8I7s+fpOKUD9VznkaxA9G4OGh06GKfefw0IXATudgp9bsnAA70/KY6X+8aIcx2O75hrS9l/xkUbab9nfsOeGIrFiG+V5VXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3820.namprd12.prod.outlook.com (10.255.173.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 20:07:57 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 20:07:57 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Topic: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Index: AQHVdKMLfiETUwenfUKQugN+iTCqb6c+YuSA
Date: Thu, 26 Sep 2019 20:07:56 +0000
Message-ID: <ae7610f9-97bb-45f4-56ed-7a3dcbc4758c@amd.com>
References: <20190926194548.15119-1-Yong.Zhao@amd.com>
 <20190926194548.15119-2-Yong.Zhao@amd.com>
In-Reply-To: <20190926194548.15119-2-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5803234a-136e-49a0-9c94-08d742bd38f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3820; 
x-ms-traffictypediagnostic: DM6PR12MB3820:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB38207D489AB4CAF0AE07CD0492860@DM6PR12MB3820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(199004)(189003)(2501003)(6116002)(58126008)(256004)(6512007)(71200400001)(66066001)(6486002)(478600001)(229853002)(36756003)(31696002)(26005)(476003)(2616005)(65806001)(71190400001)(102836004)(52116002)(486006)(11346002)(446003)(186003)(6246003)(6436002)(386003)(6506007)(99286004)(3846002)(53546011)(76176011)(66946007)(2906002)(86362001)(5660300002)(65956001)(14454004)(66446008)(64756008)(66556008)(66476007)(31686004)(7736002)(316002)(81166006)(8936002)(25786009)(81156014)(8676002)(110136005)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3820;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J4nPXamqmGfbh6SGnBFIbMlvFQLp1Q/P8UV70yUMmyc5pwN0WvoK1JsjqPAAl/csQZv7GQG6Rr3wQYq0KtqG5pubed4nRv2FePtdx33cg3oC/IMZJsOBA9i6aF/ykIKpo4sCICB0B1qYiqLkMsUlItTwVAM6IjTc6fQeH49j9jcxRRUCsbMA/mjXtAclP9qDkUK7ltYIiMHPGYt3bhoxt3QmsEpv6dpkC5MT4m1jsfmK2fZqhdiKobr29xhWxDiDTSgxpjvyJ0zD6Qa2DO0AVw/34p2uHf1Gqrzmz9QSX0zrlkpIFaRNaTV3xRSHo2PIpRpjHPNxVO7WD1vu/W5O5OGD9bz3X569o4qtFCRrf7weOMVnao4ywntXjcED1Z7ut0BiUOandUfGS1bgKCjkMK/m1BV//wULSYjnRqqNczo=
Content-ID: <7CA7B69559A38647893E177D838710A9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5803234a-136e-49a0-9c94-08d742bd38f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 20:07:57.0067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CF/M/1aYnoVzy2jeOQPc3r4YLBff5QqNlYnYpq54mVsIKktouMHE+TJ81QinWMWoRNCyxwKs/IE29yMZ+sWd2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K56FctWzrA4qwR3+BaE6FgfwG1qSBpcUk2f6iNOhiQA=;
 b=xEY+GexuKwV/8Ac9/x82wFnuJZc54lDcRMEPb06hTu7wjmLNxzj3wEHVajwWnkekgfwytH+yosjwgT/pta4q1Bvjl0xRFnlUMvA6U3yRsa/+mzzqvQ8GJW9PMI0VI8Opi61f0HEKYh601PlScJaCCldV/ZcC2q30zHU9JfRzIiQ=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0yNiAzOjQ2IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+IEJlY2F1c2Ugd2Ug
cmVjb3JkIHRoZSBtYXBwaW5nIGluIHRoZSBzb2Z0d2FyZSwgd2UgY2FuIHF1ZXJ5IHBhc2lkDQo+
IHRocm91Z2ggdm1pZCB1c2luZyB0aGUgc3RvcmVkIG1hcHBpbmcgaW5zdGVhZCBvZiByZWFkaW5n
IGZyb20gQVRDDQo+IHJlZ2lzdGVycy4NCj4NCj4gVGhpcyBhbHNvIHByZXBhcmVzIGZvciB0aGUg
ZGVmZWF0dXJlZCBBVEMgYmxvY2sgaW4gZnV0dXJlIEFTSUNzLg0KPg0KPiBDaGFuZ2UtSWQ6IEk3
ODFjYjlkMzBkYzBjYzkzMzc5OTA4ZmYxY2Y4ZGE3OThiYjI2ZjEzDQo+IFNpZ25lZC1vZmYtYnk6
IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jIHwgNSArKystLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jDQo+IGluZGV4IGFiOGE2
OTVjNGEzYy4uNzU0YzA1MmI3ZDcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYw0KPiBAQCAtNTgsOCArNTgsOSBAQCBzdGF0aWMg
Ym9vbCBldmVudF9pbnRlcnJ1cHRfaXNyX3Y5KHN0cnVjdCBrZmRfZGV2ICpkZXYsDQo+ICAgCQlt
ZW1jcHkocGF0Y2hlZF9paHJlLCBpaF9yaW5nX2VudHJ5LA0KPiAgIAkJCQlkZXYtPmRldmljZV9p
bmZvLT5paF9yaW5nX2VudHJ5X3NpemUpOw0KPiAgIA0KPiAtCQlwYXNpZCA9IGRldi0+a2ZkMmtn
ZC0+Z2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfcGFzaWQoDQo+IC0JCQkJZGV2LT5rZ2QsIHZt
aWQpOw0KPiArCQlwYXNpZCA9IGRldi0+ZHFtLT52bWlkX3Bhc2lkW3ZtaWRdOw0KPiArCQlpZiAo
IXBhc2lkKQ0KPiArCQkJcHJfZXJyKCJwYXNpZCBpcyBub3QgcXVlcmllZCBjb3JyZWN0bHlcbiIp
Ow0KDQpUaGlzIGVycm9yIG1lc3NhZ2UgaXMgbm90IGhlbHBmdWwuIEEgaGVscGZ1bCBtZXNzYWdl
IG1heSBiZSBzb21ldGhpbmcgDQpsaWtlICJObyBQQVNJRCBhc3NpZ25lZCBmb3IgVk1JRCAlZCIu
IFRoYXQgc2FpZCwgcHJpbnRpbmcgZXJyb3IgbWVzc2FnZXMgDQppbiBhbiBpbnRlcnJ1cHQgaGFu
ZGxlciB0aGF0IGNhbiBiZSBwb3RlbnRpYWxseSB2ZXJ5IGZyZXF1ZW50IGlzIG5vdCB0aGUgDQpi
ZXN0IGlkZWEuIFRoZXJlIGlzIGFscmVhZHkgYSBXQVJOX09OQ0UgYSBmZXcgbGluZXMgYmVsb3cg
dGhhdCBzaG91bGQgYmUgDQp0cmlnZ2VyZWQgaWYgUEFTSUQgaXMgbm90IGFzc2lnbmVkLg0KDQpS
ZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiAgIA0KPiAgIAkJLyogUGF0Y2ggdGhlIHBhc2lkIGZp
ZWxkICovDQo+ICAgCQlwYXRjaGVkX2locmVbM10gPSBjcHVfdG9fbGUzMigobGUzMl90b19jcHUo
cGF0Y2hlZF9paHJlWzNdKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
