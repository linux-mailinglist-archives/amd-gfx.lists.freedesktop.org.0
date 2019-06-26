Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B508557435
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 00:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BA16E536;
	Wed, 26 Jun 2019 22:19:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770042.outbound.protection.outlook.com [40.107.77.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1245E6E536
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 22:19:04 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3547.namprd12.prod.outlook.com (20.179.106.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 22:19:02 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 22:19:02 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default value
Thread-Topic: [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default value
Thread-Index: AQHVLDMGOXB306YnLk+9PYZ8IHgni6augegA
Date: Wed, 26 Jun 2019 22:19:02 +0000
Message-ID: <651064ae-f112-de81-f477-1af0a469127f@amd.com>
References: <1561562565-24858-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1561562565-24858-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6b6cfa0-c9e3-4a0a-7a52-08d6fa844b1f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3547; 
x-ms-traffictypediagnostic: DM6PR12MB3547:
x-microsoft-antispam-prvs: <DM6PR12MB3547E8457D3C4091E571E17F92E20@DM6PR12MB3547.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(376002)(346002)(396003)(199004)(189003)(6246003)(66476007)(6512007)(66556008)(110136005)(86362001)(72206003)(6486002)(4326008)(2501003)(6436002)(53936002)(229853002)(54906003)(2906002)(99286004)(31696002)(58126008)(14454004)(66946007)(73956011)(64756008)(31686004)(66446008)(102836004)(53546011)(186003)(25786009)(26005)(386003)(486006)(65806001)(2616005)(476003)(11346002)(65956001)(14444005)(256004)(6506007)(446003)(66066001)(316002)(305945005)(52116002)(81166006)(7736002)(81156014)(8676002)(478600001)(76176011)(5660300002)(3846002)(6116002)(64126003)(36756003)(71190400001)(71200400001)(65826007)(68736007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3547;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g1xRtcCtsdVt1tPYsvqSdIC9KdkrkzGCg2uPu39o6KC8mFImFrHwH/yseS4h8roS3pN09UpTgtY2Bb2P0opeQ4+nrru7pA5tjAMiknuUanCB4nrWM0GeqQCe7GnPyiiFt4X+5oTgAjFHmq+rEe9OFljPjl3H5bQA2wMQOlGEYtpDa2GVIiK6kzzNQX8nZhHukeuUbD0TzEoIeeW1gaCVFq291Qec968y9TJkf1vY7VUMBV+GdAkhdtIUDA9mDsAr4D7uBKHCqqn/CLmCGOS8JpSnH8hIKv65k8SgFr+0fVdpxToLPtF48jyKXPFgRSyrwAF5BhbEebJ2RrN8/5lShkLVnkF89Tygx5quCaSJAe3DDFPGtsZZSAYUo9Q8hshuOZ32prRFVtSsbe4bwN+1WfiWOj/mI+390PSKZI2+6mw=
Content-ID: <711766C87F10504E88A0EB05FEEC54BC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b6cfa0-c9e3-4a0a-7a52-08d6fa844b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 22:19:02.5083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3547
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCx23cWCM+xxYIakHqKGpsi8tNJUgME1eIfWfrx36C4=;
 b=CnG/paC2dVYiOAqCgr7XG+z3kYA5TVBbmWJGORD5qMyUk8mSCgDJkuogrMtMAKW8HqSwg7lOd64paC2w3lE6YbYb8bViZeo2f2i9BIavMoFGztVo783nVuTzTCNWGkmfpS1axGFk1LMHVp/5WyepaXI1NdMcU7EiTIZ4QeXGYAI=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Li,
 Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yNiAxMToyMiBhLm0uLCBaZW5nLCBPYWsgd3JvdGU6DQo+IFNldCBkZWZhdWx0
IHZhbHVlIG9mIHRoaXMga2VybmVsIHBhcmFtZXRlciB0byA5MDAwDQo+DQo+IENoYW5nZS1JZDog
SWY5MWRiNGQyYzJhYzA4ZTI1ZDc3MjhkNDk2MjljYmFlYzBkNmM3NzMNCj4gU2lnbmVkLW9mZi1i
eTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYw0KPiBpbmRleCA3Y2Y2YWIwLi5lNzRhMTc1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+IEBAIC03MDAsNyArNzAwLDcgQEAgTU9EVUxF
X1BBUk1fREVTQyhod3NfZ3dzX3N1cHBvcnQsICJNRUMgRlcgc3VwcG9ydCBnd3MgYmFycmllcnMg
KGZhbHNlID0gbm90IHN1cHANCj4gICAgICogRE9DOiBxdWV1ZV9wcmVlbXB0aW9uX3RpbWVvdXRf
bXMgKGludCkNCj4gICAgICogcXVldWUgcHJlZW1wdGlvbiB0aW1lb3V0IGluIG1zICgxID0gTWlu
aW11bSwgOTAwMCA9IGRlZmF1bHQpDQo+ICAgICAqLw0KPiAtaW50IHF1ZXVlX3ByZWVtcHRpb25f
dGltZW91dF9tczsNCj4gK2ludCBxdWV1ZV9wcmVlbXB0aW9uX3RpbWVvdXRfbXMgPSA5MDAwOw0K
PiAgIG1vZHVsZV9wYXJhbShxdWV1ZV9wcmVlbXB0aW9uX3RpbWVvdXRfbXMsIGludCwgMDY0NCk7
DQo+ICAgTU9EVUxFX1BBUk1fREVTQyhxdWV1ZV9wcmVlbXB0aW9uX3RpbWVvdXRfbXMsICJxdWV1
ZSBwcmVlbXB0aW9uIHRpbWVvdXQgaW4gbXMgKDEgPSBNaW5pbXVtLCA5MDAwID0gZGVmYXVsdCki
KTsNCj4gICAjZW5kaWYNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
