Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F217D8A6FA
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 21:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A776E5C1;
	Mon, 12 Aug 2019 19:20:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690089.outbound.protection.outlook.com [40.107.69.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9747A6E5C1
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 19:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfc/1n4NDtR+/+bQ4FtCZr09UoCLHxXDIk+vqyRUJUC+6Bj1btizAQ50oguGG5K3pRprbdXlewAd5ge3azxE3BK4S5Q59fUNuyl9CxR6CfBiA38eA0Sx0B80VJrmThpEslN8S4AGKLBD5lvVl4H3KfrRdA1vzc/pw0hwHhg2Hvd26z4+ELwBsNl2HQxc9dnXRrFzNBVliOztfw2KrC1QzlAhPUfrC6fXgg50EFZL5jqKO2Hl5v7+X8eTCnct2UVa1iiRXDoneGqNSHFFFGUunkW9KLbf03bt5p1875yRm7wtc5X0VqWTBpSlNUubmiPaSLGhIUjh82qyBvK09U3obw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nkxz90/EFcwak39rFdhZu4GvW+QIUXl8Tz3R5zT488=;
 b=DwNPimveZovsLmC7m98FCHZW0/WH0k7e+tvyXx0iYWoIbRV7g1VHJIRC8pUlAl1NGCQPg2+J/rHgwIz0je5mj/S0kpCOc3kGd8bSZxKEV51tBDCTH8A5po2Q91nndwYp/D63pgHEEGeJOnaVmHHCdZnb2TtFenoHDDRR94kpuqPePOfzH4QraHob9CusmIIW6Vev3EcH2sEv2s7s+sa+VeJSs7eFvXnHStWhG+iiO8IkLwt1+CwbgtUeB3E+KEQ04qON2qfoIZzIiXi99gDOwyRuPllrPSMPHypmhvFrNe119iuvUxR3tOmQiM+i2M2DuOznJUNvIHkU+I89l+KM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3115.namprd12.prod.outlook.com (20.178.31.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Mon, 12 Aug 2019 19:20:48 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 19:20:48 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Add more page fault info printing for GFX10
Thread-Topic: [PATCH] drm/amdgpu: Add more page fault info printing for GFX10
Thread-Index: AQHVUUD0Aw8CgFboLk+X0obRH0/dM6b34TMAgAACYYA=
Date: Mon, 12 Aug 2019 19:20:48 +0000
Message-ID: <2da6884f-fcbf-e1ba-9150-28609dd16c2b@amd.com>
References: <20190812190536.22744-1-Yong.Zhao@amd.com>
 <b8fd8285-12f8-373d-022f-e846dbb99efc@gmail.com>
In-Reply-To: <b8fd8285-12f8-373d-022f-e846dbb99efc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0476f273-fb6d-4cf3-a91c-08d71f5a2e74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3115; 
x-ms-traffictypediagnostic: DM6PR12MB3115:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB31151E245BA9F6B4E14F7081F0D30@DM6PR12MB3115.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(81166006)(305945005)(81156014)(7736002)(5660300002)(8676002)(71190400001)(102836004)(256004)(53546011)(186003)(6506007)(66066001)(71200400001)(26005)(386003)(3846002)(2906002)(86362001)(6246003)(6116002)(25786009)(53936002)(31696002)(316002)(2501003)(99286004)(110136005)(36756003)(14454004)(478600001)(6436002)(476003)(66946007)(64756008)(66476007)(66556008)(2616005)(446003)(11346002)(66446008)(52116002)(486006)(31686004)(76176011)(229853002)(6486002)(8936002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3115;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vk7g2hKpSDA0weU+wRc15rVwQPl/wjuftxdsjFLe7cWpUySm2cehRV45ki41wxztfzBy/XlxfA3AKZPzEBBZd87S54wtR7L58eoFgKifzpW9mXqSr/ASUt6thEf19LBA3XxlRXI1G3/qAKXgMQ4n7CQ6jsLpAq6MQXP7T/FdSTFSlIHMYa0CO+q3u1sC156SuuklM2AKshNT6Zinp9m/TE/AcqT7RHVC4Xk1uGn/hmnM0WAsYUGVwqKC+fq+daiZMN9Ejslt3OfS0Wo01WXwqUTXSEpwrQ5ZNOMdXBvs/nKQ1BkkX+T2ldu3ZM+B+QTrlfZJXIk9n/cE9Zto3K53Su6lOTOdfCFlNTQpmGtwuRKmVkOaVlSgAULXw6TKHkghfmS5X0zt0JRvF7IZ01CqNipfBLI6uzzy1ttSCaO+P+U=
Content-ID: <5AA5EDF85E40B54AA5AB5998F882307C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0476f273-fb6d-4cf3-a91c-08d71f5a2e74
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 19:20:48.4189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5NW7tzNj65mlNyGsHOUsf9dKUdX3xglqe9OmiI/Bs5Max6tZAohVg07ZRwE4puye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nkxz90/EFcwak39rFdhZu4GvW+QIUXl8Tz3R5zT488=;
 b=rLWpESEbz6pfY3yaADfarl5W/l1ZAD6/3nv6L3A+u489DcgbFBCl6gtkY2Ki89ODfxVagUau4L8ldMeAdYDn/+2gsLjEPSTz45HWn9EwYvSxPerVwZRyEpPAGtsMaZWY0fauTXavx0681aiChG5j0ofS0FFsHB/Ke1SS2XozLbY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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

SGkgQ2hyaXN0aWFuLA0KDQpJIGZlZWwgd2l0aCAiOiIgaXQgaXMgYmV0dGVyLCBiZWNhdXNlIHdp
dGhvdXQgaXQgSSBmb3VuZCBpdCBpcyBub3QgZWFzeSANCnRvIGludGVycHJldCB0aGUgcHJpbnRp
bmcuIE1vcmVvdmVyLCBpdCBjb250aW51ZXMgdGhlIGZvcm1hdCBvZiB0aGUgDQpmb3JtZXIgcGFy
dC4NCg0KSXQgbG9va3MgbGlrZSB0aGlzOg0KDQpbwqAgMTkwLjY4NjY2OF0gYW1kZ3B1IDAwMDA6
MDM6MDAuMDogW2dmeGh1YjBdIHJldHJ5IHBhZ2UgZmF1bHQgKHNyY19pZDowIA0KcmluZzowIHZt
aWQ6OCBwYXNpZDozMjc3MSwgZm9yIHByb2Nlc3M6a2ZkdGVzdCBwaWQ6MzI3MyB0aHJlYWQ6a2Zk
dGVzdCANCnBpZDozMjczKQ0KDQp2cyB3aXRob3V0ICI6Ig0KDQpbwqAgMTkwLjY4NjY2OF0gYW1k
Z3B1IDAwMDA6MDM6MDAuMDogW2dmeGh1YjBdIHJldHJ5IHBhZ2UgZmF1bHQgKHNyY19pZDowIA0K
cmluZzowIHZtaWQ6OCBwYXNpZDozMjc3MSwgZm9yIHByb2Nlc3Mga2ZkdGVzdCBwaWQgMzI3MyB0
aHJlYWQga2ZkdGVzdCANCnBpZCAzMjczKQ0KDQoNCklmIHlvdSBhcmUgbm90IGNvbnZpbmNlZCwg
SSBjYW4gY2hhbmdlIGl0IHRvIHdpdGhvdXQgIjoiLg0KDQoNClJlZ2FyZHMsDQoNCllvbmcNCg0K
T24gMjAxOS0wOC0xMiAzOjEyIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDEy
LjA4LjE5IHVtIDIxOjA1IHNjaHJpZWIgWmhhbywgWW9uZzoNCj4+IFRoZSBwcmludGluZyB3ZSBk
aWQgZm9yIEdGWDkgd2FzIG5vdCBwcm9wb2dhdGVkIHRvIEdGWDEwIHNvbWVob3csIHNvIGZpeA0K
Pj4gaXQgbm93Lg0KPj4NCj4+IENoYW5nZS1JZDogSWMwYjgzODExMzQzNDBiODNjZDY5YzNmZTE4
NmFjN2E4YTk3YjFiY2ENCj4+IFNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFt
ZC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBf
MC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmPCoCB8wqAgNSArKystDQo+PiDCoCAyIGZpbGVzIGNoYW5n
ZWQsIDMyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIA0KPj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYw0KPj4gaW5kZXggNGUzYWMxMDg0YTk0Li5mMjNi
ZTk4ZTk4OTcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djEwXzAuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMN
Cj4+IEBAIC0xNDAsMTcgKzE0MCw0MCBAQCBzdGF0aWMgaW50IGdtY192MTBfMF9wcm9jZXNzX2lu
dGVycnVwdChzdHJ1Y3QgDQo+PiBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4gwqDCoMKgwqDCoCB9
DQo+PiDCoCDCoMKgwqDCoMKgIGlmIChwcmludGtfcmF0ZWxpbWl0KCkpIHsNCj4+ICvCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyB0YXNrX2luZm87DQo+PiArDQo+PiArwqDC
oMKgwqDCoMKgwqAgbWVtc2V0KCZ0YXNrX2luZm8sIDAsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Rh
c2tfaW5mbykpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGFtZGdwdV92bV9nZXRfdGFza19pbmZvKGFk
ZXYsIGVudHJ5LT5wYXNpZCwgJnRhc2tfaW5mbyk7DQo+PiArDQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihhZGV2LT5kZXYsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiWyVzXSBW
TUMgcGFnZSBmYXVsdCAoc3JjX2lkOiV1IHJpbmc6JXUgdm1pZDoldSANCj4+IHBhc2lkOiV1KVxu
IiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJbJXNdIHBhZ2UgZmF1bHQgKHNyY19pZDol
dSByaW5nOiV1IHZtaWQ6JXUgcGFzaWQ6JXUsICINCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJmb3IgcHJvY2VzczolcyBwaWQ6JWQgdGhyZWFkOiVzIHBpZDolZClcbiIsDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeS0+dm1pZF9zcmMgPyAibW1odWIiIDogImdmeGh1YiIs
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeS0+c3JjX2lkLCBlbnRyeS0+cmlu
Z19pZCwgZW50cnktPnZtaWQsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyeS0+cGFz
aWQpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGRldl9lcnIoYWRldi0+ZGV2LCAiwqAgYXQgcGFnZSAw
eCUwMTZsbHggZnJvbSAlZFxuIiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudHJ5LT5w
YXNpZCwgdGFza19pbmZvLnByb2Nlc3NfbmFtZSwgdGFza19pbmZvLnRnaWQsDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB0YXNrX2luZm8udGFza19uYW1lLCB0YXNrX2luZm8ucGlkKTsNCj4+
ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGFkZXYtPmRldiwgIsKgIGluIHBhZ2Ugc3RhcnRpbmcg
YXQgYWRkcmVzcyAweCUwMTZsbHggDQo+PiBmcm9tIGNsaWVudCAlZFxuIiwNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIsIGVudHJ5LT5jbGllbnRfaWQpOw0KPj4gLcKgwqDCoMKg
wqDCoMKgIGlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZXZfZXJyKGFkZXYtPmRldiwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
IlZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTOjB4JTA4WFxuIiwNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIkdDVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVM6MHgl
MDhYXG4iLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMpOw0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihhZGV2LT5kZXYsICJcdCBNT1JFX0ZB
VUxUUzogMHglbHhcbiIsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJFR19H
RVRfRklFTEQoc3RhdHVzLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHQ1ZN
X0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBNT1JFX0ZBVUxUUykpOw0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2X2VycihhZGV2LT5kZXYsICJcdCBXQUxLRVJfRVJST1I6IDB4JWx4
XG4iLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSRUdfR0VUX0ZJRUxEKHN0
YXR1cywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0NWTV9MMl9QUk9URUNU
SU9OX0ZBVUxUX1NUQVRVUywgV0FMS0VSX0VSUk9SKSk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkZXZfZXJyKGFkZXYtPmRldiwgIlx0IFBFUk1JU1NJT05fRkFVTFRTOiAweCVseFxuIiwN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUkVHX0dFVF9GSUVMRChzdGF0dXMs
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdDVk1fTDJfUFJPVEVDVElPTl9G
QVVMVF9TVEFUVVMsIFBFUk1JU1NJT05fRkFVTFRTKSk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkZXZfZXJyKGFkZXYtPmRldiwgIlx0IE1BUFBJTkdfRVJST1I6IDB4JWx4XG4iLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSRUdfR0VUX0ZJRUxEKHN0YXR1cywNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0NWTV9MMl9QUk9URUNUSU9OX0ZBVUxU
X1NUQVRVUywgTUFQUElOR19FUlJPUikpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2
X2VycihhZGV2LT5kZXYsICJcdCBSVzogMHglbHhcbiIsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFJFR19HRVRfRklFTEQoc3RhdHVzLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBHQ1ZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBSVykpOw0KPj4g
K8KgwqDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqAgwqDCoMKgwqDCoCByZXR1
cm4gMDsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+PiBpbmRl
eCAyOTZlMmQ5ODI1NzguLjM0YzRjMmQwODU1MCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMNCj4+IEBAIC0zNjQsNyArMzY0LDcgQEAgc3RhdGljIGludCBnbWNf
djlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgDQo+PiBhbWRncHVfZGV2aWNlICphZGV2LA0K
Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoYWRldi0+ZGV2LA0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIlslc10gJXMgcGFnZSBmYXVsdCAoc3JjX2lkOiV1IHJpbmc6JXUg
dm1pZDoldSAiDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAicGFzaWQ6JXUsIGZvciBwcm9j
ZXNzICVzIHBpZCAlZCB0aHJlYWQgJXMgcGlkICVkKVxuIiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJwYXNpZDoldSwgZm9yIHByb2Nlc3M6JXMgcGlkOiVkIHRocmVhZDolcyBwaWQ6JWQp
XG4iLA0KPg0KPiBJIHRoaW5rIHRoZSB0ZXh0IGFjdHVhbGx5IGxvb2tzIGJldHRlciB3aXRob3V0
IHRoZSAiOiIuDQo+DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBodWJfbmFtZSwgcmV0
cnlfZmF1bHQgPyAicmV0cnkiIDogIm5vLXJldHJ5IiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVudHJ5LT5zcmNfaWQsIGVudHJ5LT5yaW5nX2lkLCBlbnRyeS0+dm1pZCwNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudHJ5LT5wYXNpZCwgdGFza19pbmZvLnByb2Nlc3Nf
bmFtZSwgdGFza19pbmZvLnRnaWQsDQo+PiBAQCAtMzg3LDYgKzM4Nyw5IEBAIHN0YXRpYyBpbnQg
Z21jX3Y5XzBfcHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0IA0KPj4gYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoYWRldi0+ZGV2LCAiXHQg
TUFQUElOR19FUlJPUjogMHglbHhcbiIsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFJFR19HRVRfRklFTEQoc3RhdHVzLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUywgTUFQUElOR19FUlJPUikp
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihhZGV2LT5kZXYsICJcdCBSVzog
MHglbHhcbiIsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJFR19HRVRfRklF
TEQoc3RhdHVzLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBWTV9MMl9QUk9U
RUNUSU9OX0ZBVUxUX1NUQVRVUywgUlcpKTsNCj4NCj4gVGhhdCBzaG91bGQgcHJvYmFibHkgYmUg
YSBzZXBhcmF0ZSBwYXRjaCBzaW5jZSBpdCBpcyBmaXhpbmcgZ2Z4OS4NCj4NCj4gQXBhcnQgZnJv
bSB0aGF0IHRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1lLA0KPiBDaHJpc3RpYW4uDQo+DQo+PiDC
oCDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCB9DQo+DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
