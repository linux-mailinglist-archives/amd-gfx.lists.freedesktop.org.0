Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36732812B5
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 09:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693FD6E02F;
	Mon,  5 Aug 2019 07:04:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFBE6E02F
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 07:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+iB2MFShTrUNep7h4feakd/NSRGc7FCVy6r18Bw8eIYymAHeqASDGs+A+gPvYDto4qcD6VZm4UlpseQFhFumNfOvp94U8XQ+hc/9iyJ5sm8kma/1hK+m6husXQMo1+B3SfvmvRhbcZt6j7orVPs2srwvQkel0xSYIKF2V2Mmu4ChLnbx1TfdxED6FcZzfwLybPYUfyJzukm8XxoFFQ3/1eczPY/q2utLUfaWkID6/y/xnjLCJp/AaDNgzlHnmhSG8+GjJFQ7LvmrdT3cAn+t2d71mVo6aFu9iBJB5Cuxk9gGNz4r59mizVi65G81DsEpq1/J95uGOtALW6GD4cpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1OLCETRuneKFNx0bG1xL3uy/MGi6ez2V6hImo68YXk=;
 b=IDsniHdZ/m9nU9Em3+qejsRtnY3vPKnqkZ6ZSkwCltqzNAIeWQ2dt7QpVNiNbwinrzwbAbaOGgg2tmz0+5MwQie5xrrMe7SRgg6iDuVE99SRD/Ah6ZvbaGWJxbz71IkytvRY5M3fLabX4hHZNoHxi1sbQtvzwNEOe20jwKIWP2gS3UHnt99r0czH6P5Bp8wsvV/58z6Vy07pu9cM6A7ieRmxnbiIjwLY1mGpXBCGRx0gHMw/gxZ7SiqaoEfNmkqkDaGpzJ9MjtWUTG6R+uI+Q60EOdCioBr9N2jJOz63SkAmQWCZWRZqLRVjWIVeMVxpgMjXUXjhxCfRHEqdwxlzOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1756.namprd12.prod.outlook.com (10.175.86.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.19; Mon, 5 Aug 2019 07:03:56 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 07:03:56 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix panic during gpu reset
Thread-Topic: [PATCH] drm/amdgpu: Fix panic during gpu reset
Thread-Index: AdVLWxnCmtewJ2ZoSpuv2sekqerKFAAAMsUg
Date: Mon, 5 Aug 2019 07:03:56 +0000
Message-ID: <DM5PR12MB141848988547CFDD176ACC4FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <SN6PR12MB2800C2017D0188CB813D82E487DA0@SN6PR12MB2800.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB2800C2017D0188CB813D82E487DA0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d281001f-0677-40f9-2ddc-08d719731524
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1756; 
x-ms-traffictypediagnostic: DM5PR12MB1756:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB17564702F725742200A0B723FCDA0@DM5PR12MB1756.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(189003)(199004)(13464003)(53936002)(256004)(14444005)(54906003)(476003)(86362001)(76176011)(71190400001)(71200400001)(4326008)(99286004)(102836004)(305945005)(68736007)(6246003)(7696005)(33656002)(7736002)(9686003)(66476007)(316002)(52536014)(6306002)(66446008)(66946007)(64756008)(110136005)(186003)(76116006)(446003)(66066001)(229853002)(55016002)(66556008)(53546011)(4744005)(11346002)(5660300002)(14454004)(6506007)(2906002)(6116002)(486006)(478600001)(26005)(2501003)(74316002)(6436002)(81166006)(81156014)(3846002)(8936002)(25786009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1756;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t2o29EbUUgkTvaVM5X4eJCcvN8TNfHiZMu1B7s/2GxC8Gvj12J1qGgecxYcD+MqIJKdEAtpn1rmj7FfmIX7hTal+s+pqtrIE086VVyjH4QDWgLb97L/Vcr1mC0mRuNXd2D/xE1odl7b/HZEnVA1tLtyWhAsrL32cTNQgJe/AXgNnE00otirnSUuq3ijcEMZTANoFIw0xMLOUV+m1FD+Q8Tr5x5pT5sMAzl+ojAlMvFHSy86tpMFkhxhuFw2C/l3aOGVMELVf+M2hTHemwTubnv3MjKUfxUNOHbLniR04t+ivr3LL1bIqAqAZjhhTwE6hNJga96FtFA2AFVUGFr+/SrGjnemymxvmaMFLJ08Id4BGfsp0zBHlwJrpb1Q2FTUYhcFoGp9H4Nz3o1XS90771NhaA7VPWn7tl6VDGp3SgI8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d281001f-0677-40f9-2ddc-08d719731524
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 07:03:56.2340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1756
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1OLCETRuneKFNx0bG1xL3uy/MGi6ez2V6hImo68YXk=;
 b=RI+wbwtu8+WHBVzQZjq0zNZf9zayhy6cI464wu5Y7mfyxDdNf+xQsNvZW6sd9NSmtr9CGb0F51mIOdN766Fruz1jNEiI0QL6z1PfBmeuSYq7rRRfoTmMvzT9+YK60iRFD6vSuD53t/I0cra281y2/uyyQOjps/2ViGXUWQ5NNkY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1n
ZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBQ
YW4sIFhpbmh1aQ0KU2VudDogMjAxOeW5tDjmnIg15pelIDE0OjU4DQpUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+DQpTdWJqZWN0OiBbUEFU
Q0hdIGRybS9hbWRncHU6IEZpeCBwYW5pYyBkdXJpbmcgZ3B1IHJlc2V0DQoNCkNsZWFyIHRoZSBm
bGFnIGFmdGVyIGh3IHN1c3BlbmQsIG90aGVyd2lzZSBpdCBza2lwcyB0aGUgY29ycmVzcG9uZGlu
ZyBodyByZXN1bWUuDQoNClNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1aS5wYW5AYW1k
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8
IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KaW5kZXggMzFhYmQ4
ODg1ZmRlLi5mNjJkNGYzMGU4MTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYw0KQEAgLTIyNTYsNiArMjI1Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rl
dmljZV9pcF9zdXNwZW5kX3BoYXNlMihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJCQlE
Uk1fRVJST1IoInN1c3BlbmQgb2YgSVAgYmxvY2sgPCVzPiBmYWlsZWQgJWRcbiIsDQogCQkJCSAg
YWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPmZ1bmNzLT5uYW1lLCByKTsNCiAJCX0NCisJCWFk
ZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMuaHcgPSBmYWxzZTsNCiAJCS8qIGhhbmRsZSBwdXR0aW5n
IHRoZSBTTUMgaW4gdGhlIGFwcHJvcHJpYXRlIHN0YXRlICovDQogCQlpZiAoYWRldi0+aXBfYmxv
Y2tzW2ldLnZlcnNpb24tPnR5cGUgPT0gQU1EX0lQX0JMT0NLX1RZUEVfU01DKSB7DQogCQkJaWYg
KGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7DQpAQCAtMjI3MCw3ICsyMjcxLDYgQEAgc3RhdGlj
IGludCBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2UyKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KIAkJCQkJCSAgYWRldi0+bXAxX3N0YXRlLCByKTsNCiAJCQkJCXJldHVybiByOw0K
IAkJCQl9DQotCQkJCWFkZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMuaHcgPSBmYWxzZTsNCiAJCQl9
DQogCQl9DQogCX0NCi0tDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
