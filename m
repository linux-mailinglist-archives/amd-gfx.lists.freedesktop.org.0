Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D8BEDE9
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B176EE4B;
	Thu, 26 Sep 2019 08:56:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730063.outbound.protection.outlook.com [40.107.73.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080D6EE4B
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8iLlllOcJHyiBHOAqnSf4cytdhDBTOC+GCntz8IJndeGoh7MpsNV0WIPbQYH5I7ip3vIDAXoN5NYGDw8ZV+DnFLQ00wBsAgCVAgOSMac8CQu4octGwitDtUt/q/XJCKmlcRUA/RgTnfeUFkApdpeC/Yjkg9MggU/+N9IzSCSgErydg4ydfapEcXl6FCvLxSji4ex3/gI15l6nZqALwGg+vSmpDd2BxgsoqWo/ukaxzkg0W9Et19jUmyWrkxwhAlp308ryco9bmJsxSvgJCPJ334NPtMWyHvKOBW88RTs3JpAU0ogOwacca1wdxOzcfmcO1km8KdrtpQ6OWHPjIfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn0F+ifWoeuw5klcF+o65TrkljfEkaYj9WWlykIjHK8=;
 b=LwnCB8olFIqm++oXXq0/MQD8zGm2O4Pz1P+tKsLkKIh2qVx3ELHSEUx1yx0Q0tTvZ1lvoAhAZwt4PInw8EaH7bpXmjQFqfd5xPoCzCV6wB7NyC9IbzVA2EcVKEYOp5j8CKda/j5uj+NZC5bwpiJOvR8OkA9i0V5St/9+y4CEzE7Kw6nlE5tyQq2PXc+Pl/bCtxpVkR9ds+46xXsfYwRHGdn/K71YPOHd/yW3dz3eIud8DzmPpiSz0b9ZUhuQJpmE9tiWy82kzleBywrnxvWpuDBBpsJyt6dhI6/Yq2Ie6rAr+x2YQrFGKYkN1ve8k97a96STv0lZ7sj0kGo45NIaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3581.namprd12.prod.outlook.com (20.178.242.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 26 Sep 2019 08:56:23 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 08:56:22 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: change metrics update period from 1ms
 to 100ms
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: change metrics update period from
 1ms to 100ms
Thread-Index: AQHVdEhFodwsBR02MEScx1CYEsgSqA==
Date: Thu, 26 Sep 2019 08:56:22 +0000
Message-ID: <20190926085607.2510-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0051.apcprd04.prod.outlook.com
 (2603:1096:202:14::19) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3697c804-c9ed-4adb-d359-08d7425f679a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3581; 
x-ms-traffictypediagnostic: MN2PR12MB3581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB358195A9BCBECB4FE2BD0105A2860@MN2PR12MB3581.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(189003)(199004)(102836004)(54906003)(66946007)(66476007)(64756008)(66556008)(5660300002)(6486002)(186003)(66446008)(2616005)(6436002)(52116002)(26005)(1076003)(476003)(4744005)(5640700003)(386003)(6506007)(316002)(486006)(2501003)(14454004)(25786009)(6512007)(66066001)(4326008)(8676002)(478600001)(81156014)(81166006)(6916009)(305945005)(50226002)(2351001)(8936002)(15650500001)(256004)(14444005)(36756003)(3846002)(2906002)(86362001)(71190400001)(71200400001)(7736002)(99286004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3581;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 61iax+mchyg1d+uLAY3MTY4AP3OxCep5Hdhf1c53Au1iNue7QWgr65zZJ1i91H9Fsu/6+ejjEgJYG3Orxjz4+Rx97Kti2l0KghbDcwC1v1zDtw4zoIWM8HveF6MrFPmn9hEsw5tA66moxwEC/j2LVvxi1bKV6Cy5BbYAgSrlDFUjn9SLB8KDd7DwfVhptf31hIJv9bk8ZeI+oFLj3nxaRd4HpGrnKiuAemSv8qyS2Pyn9/ZgcpEocC3nNqyQKl6TEHd7pP3nXnbHHaYBGhyziwAeB+AKo8k9YLR3x0asb0bDx948kwmpDkEvvP/uF6hDH1ytCr7c8kyUvZwTQRdYSQOIFYr1KntIot6d4VEYa6VmiCJjZS3Z0LB22AP7bpsObUQqDABcbMG/3QVBOODIY1U1LnXd8vIIkQ2ifvI82CE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3697c804-c9ed-4adb-d359-08d7425f679a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:56:22.8697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7E2i3KdJ3ya0viVppTSx/Tq6cVSAMyHajQ+tfRCyHvkemJR7CYfwaNaLNW/RMBhg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn0F+ifWoeuw5klcF+o65TrkljfEkaYj9WWlykIjHK8=;
 b=twsAvX0T4RpM3IqUp/NT6dbQ8+a1Hlf7BOgJYmHgxwPfeWpB7n6td+oB2iJSnn3vlEcgpWLzcvnnNl5VKQcRxXNf/RtB05FXiRBH3yXf36CJwVo6GnAej081dvhVWwZxmPPfkANAgMumjG5Vy7dPziobgYzK9Moo6DWWArzD2Pg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dG9vIGhpZ2ggZnJlcXVlbmNlIHRvIHVwZGF0ZSBtZXJ0cmljcyB0YWJsZSB3aWxsIGNhdXNlIHNt
dSBmaXJtd2FyZQplcnJvcixzbyBjaGFuZ2UgbWVydHJpY3MgdGFibGUgdXBkYXRlIHBlcmlvZCBm
cm9tIDFtcyB0byAxMDBtcwoobmF2aTEwLCAxMiwgMTQpCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBX
YW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YwppbmRleCA0YzI4YWFkZWY1MDQuLmRiMmUxODFiYTQ1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtNTQ4LDcgKzU0OCw3IEBAIHN0YXRpYyBpbnQg
bmF2aTEwX2dldF9tZXRyaWNzX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCXN0cnVj
dCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlPSAmc211LT5zbXVfdGFibGU7CiAJaW50IHJl
dCA9IDA7CiAKLQlpZiAoIXNtdV90YWJsZS0+bWV0cmljc190aW1lIHx8IHRpbWVfYWZ0ZXIoamlm
Zmllcywgc211X3RhYmxlLT5tZXRyaWNzX3RpbWUgKyBIWiAvIDEwMDApKSB7CisJaWYgKCFzbXVf
dGFibGUtPm1ldHJpY3NfdGltZSB8fCB0aW1lX2FmdGVyKGppZmZpZXMsIHNtdV90YWJsZS0+bWV0
cmljc190aW1lICsgbXNlY3NfdG9famlmZmllcygxMCkpKSB7CiAJCXJldCA9IHNtdV91cGRhdGVf
dGFibGUoc211LCBTTVVfVEFCTEVfU01VX01FVFJJQ1MsIDAsCiAJCQkJKHZvaWQgKilzbXVfdGFi
bGUtPm1ldHJpY3NfdGFibGUsIGZhbHNlKTsKIAkJaWYgKHJldCkgewotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
