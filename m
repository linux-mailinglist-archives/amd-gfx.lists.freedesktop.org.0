Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F65CB07
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 10:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7826589B0B;
	Tue,  2 Jul 2019 08:10:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700049.outbound.protection.outlook.com [40.107.70.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74BF89B03
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 08:10:36 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2533.namprd12.prod.outlook.com (52.132.141.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 08:10:31 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 08:10:31 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: remove an unused variable
Thread-Topic: [PATCH] drm/amdkfd: remove an unused variable
Thread-Index: AQHVMKOJswsYwohLvUelXceFASPxLaa2+d3A
Date: Tue, 2 Jul 2019 08:10:31 +0000
Message-ID: <DM5PR12MB1418EDBBCF78DE9366E007F1FCF80@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1562050664-24740-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1562050664-24740-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d44579e3-ebed-4cf0-c2a1-08d6fec4c082
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2533; 
x-ms-traffictypediagnostic: DM5PR12MB2533:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB2533C9A5598BEDD85A27143EFCF80@DM5PR12MB2533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(199004)(189003)(13464003)(8676002)(81156014)(76116006)(86362001)(73956011)(478600001)(33656002)(64756008)(76176011)(186003)(66446008)(7736002)(7696005)(14454004)(6436002)(2501003)(229853002)(81166006)(66946007)(6246003)(53546011)(52536014)(8936002)(4326008)(74316002)(9686003)(66066001)(11346002)(25786009)(4744005)(446003)(6506007)(316002)(66476007)(102836004)(966005)(110136005)(66556008)(305945005)(5660300002)(99286004)(2906002)(6116002)(72206003)(68736007)(6306002)(3846002)(71200400001)(53936002)(476003)(26005)(486006)(256004)(14444005)(55016002)(71190400001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2533;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9YW7MbiKsaYbvR2aJs2KNtII13z85zExRpXPFgOecdpvSzeFOSVX9Oh3PlRTY5wLdw/C9Oz5wuYi8mc9t9tk79bovHSHBl9DMvJo+3VyFGGk4drHcwr5UE0R6AEPuNr50QrWu3cAVhq4c/ESIt7qs/UD/YZUbiuz4RH90zMBoTYaC4N8vYSH3E8QTHgfGGlfajVyk8+VKWQ8OiY3hlSqKO2GzdgSB8mm7ejDzuzHMQ3xgGaFdsL+f56E5ZQ2Z3NTSFeciGdtMUBQq26lG8eJXGKceJW5Bucsq4YPjwV85HI+D0M5bBlXc5wES/PZjwEjwRiszoT0NWdmrajW07RHtGAYQO0vJfRbqMBwVe0tsPfKqYjRMpBPw0IGUMfUpEpvbQn31R3xI9MoEeKH8BWeX0LXD/i4AEs1NsDAWvLbDfM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44579e3-ebed-4cf0-c2a1-08d6fec4c082
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:10:31.4532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbIWOll8wgGx5xC616QkqZubFyjPZ9yu3JPVHcmk/eg=;
 b=n+G0UrqCW8evgwT+ZmlIzCB/GpuiDlMryrCiaV3VDqNQP8SzWEhgOm6PiOdKsiJ/JQ9aSQGXJP2VCJMMf1MOoEYgSLeDBbM670f0pU7S+VFnzV+VpA+zq+yfipq2R0iRGevnUShp958BiZ/UPkTDA1fTjwUUEImGGOCrV7WkuoA=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWGlh
bywgSmFjaw0KU2VudDogMjAxOeW5tDfmnIgy5pelIDE0OjU4DQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4NClN1Ympl
Y3Q6IFtQQVRDSF0gZHJtL2FtZGtmZDogcmVtb3ZlIGFuIHVudXNlZCB2YXJpYWJsZQ0KDQpKdXN0
IGZvciBjbGVhbnVwLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQu
Y29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMSAt
DQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYw0KaW5kZXggMjRkYjgyYi4uMzMyMmE0NCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQpAQCAtNDg3LDcgKzQ4Nyw2IEBAIHN0cnVjdCBr
ZmRfZGV2ICprZ2Qya2ZkX3Byb2JlKHN0cnVjdCBrZ2RfZGV2ICprZ2QsDQogCXN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyAqZjJnKSAgew0KIAlzdHJ1Y3Qg
a2ZkX2RldiAqa2ZkOw0KLQlpbnQgcmV0Ow0KIAljb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZv
ICpkZXZpY2VfaW5mbyA9DQogCQkJCQlsb29rdXBfZGV2aWNlX2luZm8ocGRldi0+ZGV2aWNlKTsN
CiANCi0tDQoxLjkuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
