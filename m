Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 463758DD91
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 20:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D086E804;
	Wed, 14 Aug 2019 18:52:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5F56E804
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 18:52:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REbOmTxToK6i+tVpB0MmK82MIH+H556T+kjMhvd8VMle+ISj9uWZLAOlvuwG7IP2q9b/XHs5kHE1DEVnOFfCFS9gKJZlNJoruBtFbbmO2wIpwcFH+yv+axhUIuVg2VJTP+0k3TNwzKt+8f2AcknmJkjr63jqH03UjwZ6vzry5bYgUleJxHqqFHS+CnAfvL8UASAA4409omX8gX08q3DI2j4wPYIHQZal4+bvArbGxu6a7mCzAvDHepiZOnILsuG3uelCETemvpjlIO6v6oQQftYCfHbtVH09UViabm2NzbPACOivwCbG6aY2v6KSocJAeO6eUQg9KCVLxqnHAUGagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3matIwGf8UkH07BYqxFLKXsBBHI+iKv65+kUSZyauV8=;
 b=Yl8q8O6OxIS872tcSNFRHFojJO7EohI9nxS+3yT7FBcMM6izanaGaJ4ZdxCoituD9f7GulZmktoxFVJpOVCWYTKzCHmSgiFy0E5dwBgpGBo5HMz8mlmJpZC955/dZMJHkvkKsUz1HCHHIB6JedCEetE2Kg4vtLIQrdZpU1pHm+v7tHULk5mSVfEgtqMPl/4vvL8c/7ftg0ZGsOVeGpstSyazk1yBlMDsm4AGZV1tYNcZ6ba4tAHRDnB+4zyxmdpflKsTaJmttpi0vCD6AJ60tpna/2QMiaqXwXNbDpeZ8OW5d1BVJHeRTT1pNBg3RsTn9gs2k/kq+m6EuIChluyCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) by
 MN2PR12MB4254.namprd12.prod.outlook.com (10.255.224.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Wed, 14 Aug 2019 18:52:56 +0000
Received: from MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::3599:65d6:5af2:5ca1]) by MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::3599:65d6:5af2:5ca1%3]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 18:52:56 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhao, Yong"
 <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fill amdgpu_task_info for KFD VMs
Thread-Topic: [PATCH] drm/amdkfd: Fill amdgpu_task_info for KFD VMs
Thread-Index: AQHVUgwl4whMPfTz906eU30xRHb6MKb6TBQAgACyyQA=
Date: Wed, 14 Aug 2019 18:52:55 +0000
Message-ID: <47e033df-9483-5a4e-2661-6bdc8557124c@amd.com>
References: <20190813192007.15881-1-Yong.Zhao@amd.com>
 <1557e6fe-60a0-39ff-1ffd-2133be879113@gmail.com>
In-Reply-To: <1557e6fe-60a0-39ff-1ffd-2133be879113@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To MN2PR12MB2911.namprd12.prod.outlook.com
 (2603:10b6:208:a9::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e989481f-d6fe-4e8b-a625-08d720e89e57
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4254; 
x-ms-traffictypediagnostic: MN2PR12MB4254:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4254561910081565ADD5E6A48CAD0@MN2PR12MB4254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(229853002)(31686004)(81166006)(8936002)(81156014)(2501003)(8676002)(6486002)(31696002)(2616005)(476003)(66446008)(86362001)(71200400001)(71190400001)(52116002)(66556008)(76176011)(66946007)(2906002)(99286004)(65806001)(5660300002)(65956001)(66066001)(186003)(64756008)(66476007)(26005)(102836004)(53546011)(6506007)(386003)(53936002)(3846002)(6436002)(6116002)(6246003)(6512007)(256004)(305945005)(25786009)(65826007)(110136005)(966005)(14454004)(486006)(478600001)(446003)(11346002)(316002)(58126008)(6306002)(36756003)(64126003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4254;
 H:MN2PR12MB2911.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ujmr+JKdXYdgFtzCEHRRzFnxbLEBscGThSritawZMCtmJ7X1EkRjrj3Y/EZgFHGvchTjGmZ22AUdbnwFL1jh4E847jAawzsZfzo7yd+fwJ6CqbIz0cXfRvuQ1W+BTiAY5FYq9JWOXXN12VvdQAnEwapG+i5zlYsaDnSp/8KR/BW+wRo3uBuWYGaVBV/3f2J5eK9BtlCfMsy1fRPpZemaUo4Yt7PYHj3RFgO9MsQCib5hCV2rjycguG6/q6fs0DzEJWXWDPSkPt37sLq0prTpE75aWt8259qGe5y6KV7CmDdARMSmWOm4txgezj5tGc4VkSXsNgl9sdk15JN6nDsGXXhgaGdJ/V2+N9hjG8TVpTdO5paaFVKbJemtxgQESus5vi5Wi2ZSXdOzKB+cU9FfFY0cKkLbn7E49Rl8cQ1CQgE=
Content-ID: <A0F07F94228DA345A0ED0B5CE5158E4D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e989481f-d6fe-4e8b-a625-08d720e89e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 18:52:55.8889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UcLPj9srROLknwubvvoaHWxX7fvSG5mWHQ2Z5gGOh1DNrXz/ElXgzxVILnCxmzxJzjEgNjJcTGr0sNNM//IDmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3matIwGf8UkH07BYqxFLKXsBBHI+iKv65+kUSZyauV8=;
 b=Rt7Fdve4dNRNLFZqdS4j2Kcj4ui1ikf3syqn7MIdTn9YSMKYI8X70ItK358flKqkntFUDG9fkZIvrmzzwdRoWAGsK/OxuNn5qVThcygTmbtOjTJ95qMkLGAwac1kdH3IqNlr0HMTUUp1PWlHbv42jrazl4CodhddmEbS5PymuuE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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

UmV2aWV3ZWQtYnk6IEhhcmlzaCBLYXNpdmlzd2FuYXRoYW4gPGhhcmlzaC5rYXNpdmlzd2FuYXRo
YUBhbWQuY29tPg0KDQpPbiAyMDE5LTA4LTE0IDQ6MTMgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3
cm90ZToNCj4gQW0gMTMuMDguMTkgdW0gMjE6MjAgc2NocmllYiBaaGFvLCBZb25nOg0KPj4gVGhl
IGFtZGdwdV90YXNrX2luZm8gd2lsbCBiZSB1c2VkIHdoZW4gcHJpbnRpbmcgVk0gcGFnZSBmYXVs
dCBmb3IgS0ZEDQo+PiBwcm9jZXNzZXMuDQo+Pg0KPj4gQ2hhbmdlLUlkOiBJZmQ5ODNkYjVkY2Vi
MWQ0NzdlNzI4N2U0ODkzZjgwNTY1YTdhNmIwNg0KPj4gU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFv
IDxZb25nLlpoYW9AYW1kLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IA0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwgMiArKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcHJvY2Vzcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3By
b2Nlc3MuYw0KPj4gaW5kZXggOGYxMDc2YzBjODhhLi4yZWM0Mjc0OWY5NzEgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jDQo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jDQo+PiBAQCAtODAxLDYgKzgw
MSw4IEBAIGludCBrZmRfcHJvY2Vzc19kZXZpY2VfaW5pdF92bShzdHJ1Y3Qga2ZkX3Byb2Nlc3Nf
ZGV2aWNlICpwZGQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+IMKgwqDC
oMKgwqAgfQ0KPj4gwqAgK8KgwqDCoCBhbWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhwZGQtPnZtKTsN
Cj4+ICsNCj4+IMKgwqDCoMKgwqAgcmV0ID0ga2ZkX3Byb2Nlc3NfZGV2aWNlX3Jlc2VydmVfaWJf
bWVtKHBkZCk7DQo+PiDCoMKgwqDCoMKgIGlmIChyZXQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byBlcnJfcmVzZXJ2ZV9pYl9tZW07DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
