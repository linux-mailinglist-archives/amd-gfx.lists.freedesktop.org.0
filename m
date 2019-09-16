Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61398B3FAD
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 19:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5886EA13;
	Mon, 16 Sep 2019 17:41:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760050.outbound.protection.outlook.com [40.107.76.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F47A6EA13
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 17:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU5q6nB5RoqtqVDreNb8L43wV9HE61EZkUghYWevl+39rwBKXIQ7qv68MSFccHoCUmWSUoLOGypbIGS+56RARqy+XrQcxWvvV5ryM14zoBuydCZPC12K19esfUFaYpuClQmWeRptDRlLFBtoBvQAU5gkca/kde/rFZcM7DFRr/9waJ5ON5SE63a4hI9QZCD0ZSYy2rgWs9eiti/LXw9SYUQ/YtH+7HuYjg1LFJSib8vZHb9OwC9ku2/rjR8u35tVLHmOGcuWMPPEj7bNcNFb+iy0Nd7sWX1lIkkKf5HM4AQolPQtJ9+iH0/VeLh89ccG42Yag/mZnX595YycJIaItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX+yPCN2l/vtrjHZpp2G31eZqYDlTfnZB8+fVK4AP6Y=;
 b=i10sR9sXOMR7uEUDRsmt2JzIYkVoip408Z/N9lMjrNTcoCGvs1cqKXGODDqHjs5EF3XwkmFHOjMrBkErc8lq7z88yM+OoB2FRp1/0qcnmu7syAcLqEwdpxMJhmIVQVyGKtJTETHxaHn1rmyIR1Hpe+brtIw5vwPe1yiAgGRvbk0RXZnjHnKTK4Y+bc7VBgpqEK3G+bCXtSwA6Lfg3wxbVROcoL6dnaK825UeUKPBNtvfY0mo4axRCks4wlQUrPkR8X3E6MSQz6r+/0DMqqFpmCu12Nlfiif8tyDGNRZZQk1/TGZaYnD4v30ucus0jhFUrMqpdC+g99tXf9qxVozzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3708.namprd12.prod.outlook.com (10.255.172.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 17:41:15 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 17:41:15 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Delete unused KFD_IS_DGPU macro
Thread-Topic: [PATCH] drm/amdkfd: Delete unused KFD_IS_DGPU macro
Thread-Index: AQHVbKuCmjVZyJP7UE+J7AJ+wBAksKcukoaA
Date: Mon, 16 Sep 2019 17:41:15 +0000
Message-ID: <6be8778c-bfc9-9f18-76a1-d8943adff7d8@amd.com>
References: <20190916162622.23356-1-Yong.Zhao@amd.com>
In-Reply-To: <20190916162622.23356-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25adc87b-fdf1-4b30-d8bc-08d73acd128b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3708; 
x-ms-traffictypediagnostic: DM6PR12MB3708:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3708A7365AC3DF3BE72844C3928C0@DM6PR12MB3708.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:93;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(6512007)(36756003)(14444005)(256004)(66066001)(86362001)(14454004)(66446008)(64756008)(110136005)(81166006)(81156014)(8676002)(66476007)(8936002)(58126008)(316002)(5660300002)(478600001)(31696002)(6486002)(66946007)(25786009)(6436002)(2906002)(52116002)(2501003)(65956001)(65806001)(99286004)(102836004)(71190400001)(186003)(486006)(7736002)(305945005)(26005)(76176011)(66556008)(229853002)(3846002)(386003)(71200400001)(53546011)(6506007)(6116002)(476003)(446003)(2616005)(6246003)(31686004)(11346002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3708;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z9TmB/4/RG4gAq0GlbmDrKzTmd00ceoBXRQvVY9qsfIO2pnYmwCU7Gh8NCX7sVrGVspeBJi4SkFAcOtyx5yfmMHUcAWwv1vaizYpbOKEBu0gLjgJaRfUcfS3Zp2Mm17K/RQ6mZYjHpTAqNZxARzcyMzq91Qm35HW8Dn5j6M57nB8W3vIJw2ksUG7NdjYJSD0M/A5YhWiDSaqqgk3tEYmcbwp1oIW90Nth8brt/KZG11RX6tCg5dAx40NnYazm8vD7LyMd8A38mFrsxU2hUzQRPaF5LowYj3uH44pg7j+ZhwBaELLKYHW6ZV1QHsQwZa7pNd2NlO+AjH0ueg0GoHITG8dJFgrHmGhFTLVzOo1DwqwU232X9RAUNUX7gDvCsDqTmISSEBUOjweY9PjaaacOyw2Ju8sUdS0wCCepibiWFs=
Content-ID: <841FEB8C4678BC4F873B0C515E557066@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25adc87b-fdf1-4b30-d8bc-08d73acd128b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 17:41:15.1015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0UkOmKRpfNTKG7YfZy/D9qmcrBBa4eoCfPKBnRfDtDsQ3vCJhM3UumnHVHFxGEmslVRgjm3DA5DVStyUI5lyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX+yPCN2l/vtrjHZpp2G31eZqYDlTfnZB8+fVK4AP6Y=;
 b=unuGs0A1e+iXb0Kh0yzNN4KUPN3EnyAsw8DSRvYfiqZnrJVHc3pf8R1ZioQBcmBXJyqwE/xnO9kmEWpQ3+vjKZtQRI9c1+BkN3e6TfHq0au4iqL8W5q3DK9A33PAkGxJ4FXjEoNJSKeYCLNqzcsQp0iJoUG8mDSY5MX6yq1lubI=
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

T24gMjAxOS0wOS0xNiAxMjoyNiBwLm0uLCB3cm90ZToNCj4gVGhpcyB3YXMgZGVsZXRlZCBiZWZv
cmUsIGJ1dCBzb21laG93IHNob3dlZCB1cCBhZ2Fpbi4gRGVsZXRlIGl0IGFnYWluLg0KPg0KPiBD
aGFuZ2UtSWQ6IEkxOWIzMDYzOTMyMzgwY2I3NGEwMWQ1MDVlOGU5MmY4OTdhMmMyY2I3DQo+IFNp
Z25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggfCAzIC0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
cml2LmgNCj4gaW5kZXggMDZiYjJkN2E5YjM5Li42ZWQzMWE3NmRmZGEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPiBAQCAtMTgwLDkgKzE4MCw2IEBAIGVudW0g
Y2FjaGVfcG9saWN5IHsNCj4gICB9Ow0KPiAgIA0KPiAgICNkZWZpbmUgS0ZEX0lTX1ZJKGNoaXAp
ICgoY2hpcCkgPj0gQ0hJUF9DQVJSSVpPICYmIChjaGlwKSA8PSBDSElQX1BPTEFSSVMxMSkNCj4g
LSNkZWZpbmUgS0ZEX0lTX0RHUFUoY2hpcCkgKCgoY2hpcCkgPj0gQ0hJUF9UT05HQSAmJiBcDQo+
IC0JCQkgICAoY2hpcCkgPD0gQ0hJUF9OQVZJMTApIHx8IFwNCj4gLQkJCSAgIChjaGlwKSA9PSBD
SElQX0hBV0FJSSkNCg0KQXJlIHlvdSBmYW1pbGlhciB3aXRoICJnaXQgYmxhbWUiPyBJdCdzIHJl
YWxseSB1c2VmdWwgdG8gdHJhY2sgZG93biANCndoaWNoIGNvbW1pdCBpbnRyb2R1Y2VkIGNvZGUu
IEluIHRoaXMgY2FzZSBpdCBzaG93cyB0aGF0IGJvdGggSVNfREdQVSANCmFuZCBJU19WSSB3ZXJl
IGFkZGVkIGJhY2sgYnkgUGhpbGlwIENveCBpbiBoaXMgTmF2aTEwIGNoYW5nZSwgcHJvYmFibHkg
DQphY2NpZGVudGFsbHkgd2hpbGUgcmVzb2x2aW5nIGEgcmViYXNlIGNvbmZsaWN0LiBZb3UgY2Fu
IHByb2JhYmx5IHJlbW92ZSANCklTX1ZJIGFzIHdlbGwuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgN
Cg0KDQo+ICAgI2RlZmluZSBLRkRfSVNfU09DMTUoY2hpcCkgKChjaGlwKSA+PSBDSElQX1ZFR0Ex
MCkNCj4gICANCj4gICBzdHJ1Y3Qga2ZkX2V2ZW50X2ludGVycnVwdF9jbGFzcyB7DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
