Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79907448E
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 06:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E876E40B;
	Thu, 25 Jul 2019 04:56:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6BB6E40B
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 04:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m83rdY9CxFrsxyzzkcDurAZn5Udgfjf1UA9g/5u+H+PddoCq4EQijrenct9hXehizqtJMl+o7gEDbttHrsv7OV5H7WBLenP/YiPj/nLO6PwzH8v37+Im0bSpXcai4o83OUPX32AzUDUAh2ODQ778faZALXxkavsbR1lJXIQfKqoZinPCbwP39hQZ/RjXgfOEluYQiwVlqWrIrQ+gd3BEclLx48oCtAqKkkRQOt/zLKwfPI3LQSIKo7W/IIBvIr9HU+d7+qigd7ZPpvcn2WeQ3UrFi2QRbwgBS0vDGhnVUwJx01zxd1aBz7NR1KTbXeMniuxt/MXSj5KK3vBS/SRyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKL/oW+aQ8iUiBiWq830Ii4I2jKnTQU5a77QOboHpr8=;
 b=fxIj2XRGGl0bH8qCtQsLgHhdElaQVd07EOzr0Oih1FZ3NGHSWJgaTmybyngAD20OJS5+0MOLs+SsciI2po1UCU/M4hrcintX/BVMazhaxAAakFgIdu0gh9QazerNjmm7GVyudURoHSRcHTqds7kYQnsr7fAPUmfnG4SbV9vP8mdZ7xiQfzEn7YYaBS/0ZknOc7kt40pLzET/FFFltgCGFPkdzXqmS03AMxKwdmAGfNRz9Mhuy84PSKeoFhRoKVVwwQJ/MQs+eeN+YYIoSQLo1k7X6dQcnDAlhgI7XEgxTfVwUvhsCUkzyrMGdjBEPwbFO1bg/SgTVT+sOMjH+g2yAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3696.namprd12.prod.outlook.com (10.255.86.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 04:56:37 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 04:56:37 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIIDQvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IG1vdmUgc211?=
 =?gb2312?B?X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZSB0byB1cCBsZXZlbA==?=
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: move
 smu_feature_update_enable_state to up level
Thread-Index: AQHVQqVWDNKOPEsLhUiN5TTb51Djfw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 33
X-FaxNumberOfPages: 0
Date: Thu, 25 Jul 2019 04:56:37 +0000
Message-ID: <MN2PR12MB32965E852837FFA8FC637FADA2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb4e7ff3-5595-44f7-628f-08d710bc7973
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3696; 
x-ms-traffictypediagnostic: MN2PR12MB3696:
x-microsoft-antispam-prvs: <MN2PR12MB3696583C43DC17274A4279BFA2C10@MN2PR12MB3696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(316002)(6116002)(81156014)(68736007)(14444005)(71190400001)(4326008)(66946007)(66556008)(76116006)(86362001)(8936002)(53936002)(64756008)(2351001)(6506007)(71200400001)(66066001)(7696005)(2906002)(66476007)(478600001)(186003)(102836004)(5660300002)(6916009)(256004)(26005)(14454004)(3846002)(66446008)(2501003)(486006)(9686003)(476003)(99286004)(5640700003)(52536014)(81166006)(558084003)(7736002)(74316002)(55016002)(54906003)(6436002)(25786009)(33656002)(224303003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3696;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tRAV/CpJZtowylsu1miE3GNCslAbBDYoXGRVJbLMCaC2GGmF3VqkHa4IW63Y3IwBOwCSSUxPh6RbNKd7IMda0qOSkGbvP0HZzlUqZWmFVWAPIh5lqa8PEakWONyMsYE4na0FXDpLUTad3PO6BLLLl114BVnenX10XKWQAB156UiUjlboXQK2pe+6ujU2cwuN0kCG5TyThBtcHN99FBMx+BK5h2RR/C9+9m4uH0l1HJWkmSvPspp9dMJQ9Xwv2ywULnBw/zcFZAe3diM/FSqP7TiKptS8plLZpovgD8npPYK4S6I26jPZ4+GqdjWtIatWEulEAW1mkDs2h8Qzx8K9sA7J3oZb/pQvyjwgIhbZU+D+qB2vZx7pDzNG1XXeNE7cxpuHjfZteQejM6VshUtH5obuoWB6CCuMjA2rwqKX6Zo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4e7ff3-5595-44f7-628f-08d710bc7973
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 04:56:37.3065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKL/oW+aQ8iUiBiWq830Ii4I2jKnTQU5a77QOboHpr8=;
 b=dGS+/FtF9TyCEQy+khr99lJxwoUe4oNTLYRgauUduVqw53DoxCnEFBIRiActHGXmRUSsw41k97sznrIM3fd0YDkoedqqjMJmxRcohZV59kLe/Tqbyxf356u/I3a9CHc86ZH/FuNsOhQgwird3GgiZrxDUuyAHoVGIPWkwNHjFJs=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2FuZywgS2V2aW4oWWFuZykg5bCG5pKk5Zue6YKu5Lu24oCcW1BBVENIIDQvNV0gZHJtL2FtZC9w
b3dlcnBsYXk6IG1vdmUgc211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZSB0byB1cCBsZXZl
bOKAneOAggpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
