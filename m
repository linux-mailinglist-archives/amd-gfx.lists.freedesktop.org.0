Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACA5F93B
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 15:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CA66E34A;
	Thu,  4 Jul 2019 13:36:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780088.outbound.protection.outlook.com [40.107.78.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D226E34A
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 13:36:53 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1438.namprd12.prod.outlook.com (10.169.207.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 13:36:47 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6%9]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 13:36:47 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Disable ras features on all IPs before gpu
 reset
Thread-Topic: [PATCH] drm/amdgpu: Disable ras features on all IPs before gpu
 reset
Thread-Index: AdUyFb9pMVuXa1LORx+z1ctn/wLFlAAV7teA
Date: Thu, 4 Jul 2019 13:36:47 +0000
Message-ID: <a01e9182-9e6a-4c96-784d-927f0ad14b15@amd.com>
References: <SN6PR12MB2800A452CC9315AE18E83E9D87FA0@SN6PR12MB2800.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB2800A452CC9315AE18E83E9D87FA0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::26) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2daa97e6-109d-4ed9-cd41-08d70084a8ff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1438; 
x-ms-traffictypediagnostic: MWHPR12MB1438:
x-microsoft-antispam-prvs: <MWHPR12MB143815D6F84F6832649ED0C2EAFA0@MWHPR12MB1438.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(229853002)(99286004)(52116002)(478600001)(31686004)(68736007)(72206003)(76176011)(71190400001)(71200400001)(7736002)(5660300002)(64756008)(66556008)(31696002)(66446008)(4744005)(86362001)(305945005)(73956011)(14444005)(66476007)(256004)(66946007)(316002)(66066001)(6486002)(36756003)(110136005)(3846002)(446003)(2616005)(6512007)(11346002)(6116002)(6506007)(53546011)(8676002)(81166006)(386003)(81156014)(8936002)(476003)(6246003)(186003)(6436002)(4326008)(14454004)(25786009)(2906002)(26005)(486006)(53936002)(2501003)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1438;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PG3bqy06XrBgZ/uRsJ6SQJDwCnYW23TsDre313X+VKpI8hJMOSv6Q3aZSI8Ibl8qUvdbOz91/SlLk0dvDM18cTUTYVrgGKwnJPys2TQ1S1o1wJWhiYiKm7tzYUhvBgwauNWmwQmiXeqXlxtHG4OMzYJYuUcymCCT0fUCPABcOND7pMs7TxoHXNLOGt30fPWrapZ1WXSRfUeHSEG8e3b7/NMYK8GzLp3/j3V26QkiSuXekRJYcmoMsvuhxa21IVRf1WmrxUe9qRt28jmEkD2TBZgGQqJnknjiOUNX+QEXzSDm2li5RCymJz1vu39wcRtnD7gCf3SI5nYXUpOu1a1beof2uDlkPMpfdMDFIpI185DGYTgxECJMQuecef30hZv4b3DFOqNWEXlLJzP2tfSJC87nNqc4J+HQyjqMTXEHQwY=
Content-ID: <32FF346000C2F145A5E60D4445A0EB29@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daa97e6-109d-4ed9-cd41-08d70084a8ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 13:36:47.2788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1438
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0cG19ASjS2Dp2D/ZsFNglFGQjSlTSpurDm4xar6djM=;
 b=Cfe4ChEl8sH5RA0SK3TrKeSH7KFRHLhdRCWpPt88rSXtR0JZjRYRh5YJyHYh+ILBAjmjjNR2GbVp6wkxy8TXKH7zLkNHhIOnZw23NNvgaLrnoE1w2EkpruPJdY7jLXN5dWcWkt+OmhSUjmtBqUJTO4z0Xcj05cPamK62PFMF6eg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0K
DQpBbmRyZXkNCg0KT24gNy8zLzE5IDExOjA5IFBNLCBQYW4sIFhpbmh1aSB3cm90ZToNCj4gUGVy
Zm9ybSBhIHJhc19zdXNwZW5kIHRvIGRpc2FibGUgcmFzIG9uIGFsbCBJUHMgdG8gd29ya2Fyb3Vu
ZA0KPiBzb21lIFJPQ20gc3RhYmlsaXR5IGlzc3VlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiB4aW5o
dWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYw0KPiBpbmRleCA1MTMyYzU5YjQzOTcuLjk5MjA4ZmU2ODRhYSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBAQCAtMzc1OSw2ICsz
NzU5LDEwIEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KPiAgIA0KPiAgIAkvKiBibG9jayBhbGwgc2NoZWR1bGVycyBhbmQgcmVzZXQg
Z2l2ZW4gam9iJ3MgcmluZyAqLw0KPiAgIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcF9hZGV2LCBk
ZXZpY2VfbGlzdF9oYW5kbGUsIGdtYy54Z21pLmhlYWQpIHsNCj4gKwkJLyogZGlzYWJsZSByYXMg
b24gQUxMIElQcyAqLw0KPiArCQlpZiAoYW1kZ3B1X2RldmljZV9pcF9uZWVkX2Z1bGxfcmVzZXQo
dG1wX2FkZXYpKQ0KPiArCQkJYW1kZ3B1X3Jhc19zdXNwZW5kKHRtcF9hZGV2KTsNCj4gKw0KPiAg
IAkJZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhfUklOR1M7ICsraSkgew0KPiAgIAkJCXN0cnVj
dCBhbWRncHVfcmluZyAqcmluZyA9IHRtcF9hZGV2LT5yaW5nc1tpXTsNCj4gICANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
