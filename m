Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357C406939
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Sep 2021 11:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127B6E9AE;
	Fri, 10 Sep 2021 09:42:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2057.outbound.protection.outlook.com [40.107.100.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9B6E9AE
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Sep 2021 09:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C13WBnzto1f83XDQA4J/msfQXtq25cMlQ9PdEqWqa5bC0dN90igai5th46Q54Zim7SnhXfDBsL0IMlIfyGKCsXJHse4iU8ofcyglMTCvOoxzV2t8O8tP4spgxXLZ+2VS4zRnoxHuA3KfmozeKBvMhJDiK9SHwWZ1BE3ogGQQGJC2YIwNv/lXFDIIg7zdv+LxblL1qhOE3SP4mIS3ZHybNiXlmcIp7wjuHuwstlTVUNA17BjALLPLUJeZIeMh5fnmsL7K6GYqfa67oELS+9sRxFco58+YzcsV+V2PlIzz1286N/gh/ePomCM1cg0wDU8aRw8M4/VYCJ/z9SW9lEoh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=v/xdBAbmAExqM/tT7NB65/gnMvc4V7UwtW8gTIRR9e4=;
 b=L0oHkAcy9hmZXndgqzDbWo0ywpEbLmqDaDtZYFiEu5vUx2mmRnMpKPWxvhHkJsJkNPdVGqIJ94HIRx7U7o+hLW+gvnCvZ4x+D+uYsKG1mezs2hx83h9CEmiZgO9TWN24PapvMELOFgf8L+LHgkxPamcH0xxh4ItltRl9PzS3UdRT21PSDx76QLngTqqu2Amclyshql91alnO4cQdDkaV9symN6AUfnL8hQMRdeMfuRgUm3qq4Xts1doIlTANxdNjuWFggoqyM1QZpQ0HebcpuEmHBd1IST1vfPuBUu78Yml9XOqL8tuKDoyfqRcPcEElYMdZjtrQrM924xRxcA1VAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/xdBAbmAExqM/tT7NB65/gnMvc4V7UwtW8gTIRR9e4=;
 b=yKmVAKYaIVp8E8Hl34II7h0qFyIoi0lZGTYqKavkk9cjG6E0PXusPuOPi3+VKKva4r6jJiYbtgZgYIfTRQChL5pXPH6qlnlnQXOgMxZDXLg56n58QNkvWenCy8ujo2Yhw/yHRTDb++HfQTV2e+A1ow0TWK7sf+3VT5kUXUAtTkM=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM6PR12MB5517.namprd12.prod.outlook.com (2603:10b6:5:1be::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 09:42:29 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:42:29 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIDIvNF0gZHJtL2FtZGdwdTogVVZEIGF2b2lk?=
 =?gb2312?Q?_memory_allocation_during_IB_test?=
Thread-Topic: =?gb2312?B?u9i4tDogW1BBVENIIDIvNF0gZHJtL2FtZGdwdTogVVZEIGF2b2lkIG1lbW9y?=
 =?gb2312?Q?y_allocation_during_IB_test?=
Thread-Index: AQHXpdw4+GG6WouL6E2MLPJgzTmCUKuczTMAgAAe0PGAAAsOgIAACMlD
Date: Fri, 10 Sep 2021 09:42:29 +0000
Message-ID: <DM4PR12MB516591BAA84BA6798E40601E87D69@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210910003828.4013-1-xinhui.pan@amd.com>
 <20210910003828.4013-2-xinhui.pan@amd.com>
 <005bbb06-034d-6cdf-7c61-1d0339b2e54d@amd.com>
 <DM4PR12MB5165533F0F3EB7FE1F14CD6D87D69@DM4PR12MB5165.namprd12.prod.outlook.com>
 <9393c355-0d63-d4f5-1ecb-1ec9fa392a85@amd.com>
In-Reply-To: <9393c355-0d63-d4f5-1ecb-1ec9fa392a85@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-10T09:42:27.799Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: bef6c748-3336-3eb8-66f7-42cf4d180782
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35010838-26eb-416e-63d2-08d9743f4e3c
x-ms-traffictypediagnostic: DM6PR12MB5517:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB55173C38F64DDD985BF4D6B087D69@DM6PR12MB5517.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gIuTKib2bt5z6hKEsf+gQMwuNfhvaRSO1jvFZ2uKH44ddYZmkf8VwOTtHh4R6frIN0qTCzqVWoNYFtD/rHUrHreWYtXoBRvl0YQ7UUIJaoYeELdOOrs9bdkR1mp3rXmBRD0vCP+mkukRhaR63QEAsOfpR0pwu9k7VBYgQ0GL3wqVsn9yfDX5Nh0YngV3K/qkQaet3nxSJGmm/pLhu7dJ33BfAuUU/hbyNkKaxIqgZAkggBRHx3twifvpwnYOCMWQPsGIO8llS0odZob3ukpFaOgKhP8Rlz35ZlBq6TpwvPFx8PFW6jgkyE+PAf8wpKst4MAp7xShIYe7Z5srw1BN7uyQ5McLV+Uu5pjlurBjwMtwjnvR3tSOECnRi758avgR0mMH/0+ae8akB/pVU+RGoDz513yi37qxiaq2dBSDeAAc2G3/3F0F2Gl3V4bODSJet4lAgK5YSxZz9u4QZ7omhmrtql2gSlS42FbJ++cFAr7qgZTrJdtCctg0MPLZTt/T8iMa8KhPoFaz/0eec6OMFuWZXH3mdkpB79R15a7gKOjj5pkAE7apwkcB4sHMouBjPMIs0RQtU4JpfYe1xTSXHa1GjfE6qg7T/fD2O+pJYxfLq4MoZS1J8tVU4bvL2Em4glhwPrb6N88Cw+QYrLKWrSDMHaS/lZM0uzv9x1b5EW/Rz4Do8J+TB8QFLGBIeVlr5/wt58AUlG85n4Sr74W5bQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(52536014)(7696005)(38100700002)(30864003)(91956017)(38070700005)(66556008)(224303003)(66476007)(86362001)(71200400001)(9686003)(83380400001)(110136005)(186003)(6506007)(8936002)(33656002)(5660300002)(66446008)(64756008)(316002)(478600001)(66946007)(55016002)(2906002)(4326008)(122000001)(76116006)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dExUZVhtbHduZHBoTWhOTDNtK0hYQ09tSENtSUdQeFpSdHk4RkViNmU0eEh0?=
 =?gb2312?B?aDJxdmJQZUZKL3hZck13aFA5c21XcDU5Q2N1eEFFRENSZ0pwTnpYZUNwTUlZ?=
 =?gb2312?B?YlpZbFlFdlRVUmxxTGFJNFYzeFhrLy9pTWRaT1BscURuMHZhck1hdlE4VzV0?=
 =?gb2312?B?cVMzS2dVMFgxbGJCYXpkd3p4UVZlbjJNb1lPYUI2U0ZvZ05uZDNURVBqUFpy?=
 =?gb2312?B?Tk10T2JjREsvYXpRWUNCMXdwVU5aZVBlVjJkeHlRcTVDVVF4ajBNZ1Nua1RQ?=
 =?gb2312?B?UkcycHdKL2VwNG8zRGVBb1N4SkxFNE9XRHh4dFFOcm1NLzlDbEtnelF5M2JI?=
 =?gb2312?B?RWREUmMvbVlNc3JmTTk1MVhKU2RSUk1RanFhaE9wSW9tOFFFbTVJZVQrSHFS?=
 =?gb2312?B?UFJReTg3NUpYeVV5ZWNhRE5XVlYwMUorOUZZQm1xb3BHc05pc0xlNktOOHZv?=
 =?gb2312?B?SDF4bW9RUWM3ZDJPMHRjbnFnZEtjZktSOWhFRmI1WmFwaDk4V3JYMkJtWGdT?=
 =?gb2312?B?NTAyTXdRU0ZJOFQrcklTYS9Rc2V1a05NY2hZbTJjdmtWNzZtOFcvSDdjOVRi?=
 =?gb2312?B?dzdwSGpQdU5vUS9Ubm01aTE4NFIvYkVnN2JRWi80aTg4TURQd1IzZlVXS2No?=
 =?gb2312?B?L2VjRURCalJ6MTlJUEJzcXZCYTFyM01LdnF2RU4wc0hjQ0NGOVdPdkprSzVN?=
 =?gb2312?B?ajRVL3N0eUlEZGlFSDJNd3BTZmE2QmlUUitjRzNDUFRiQ3krdFRRanVRZDNX?=
 =?gb2312?B?TjBsTGNNbVBtVjlIeEVTaEZTNUY5djg0c2dQRERyZVd5RlBYOU9DTENzYi92?=
 =?gb2312?B?NHFwMUZGZTFqVmVONnFXOENuejhNR2N4eGZNSFgvS1RNVHdXUnNydXNDa0VQ?=
 =?gb2312?B?WU9hcUpSdlgveWJTS1FiQ2p1V2h6QTIvd0E4OFJGazRWY3N5ZngxL0U0bEFv?=
 =?gb2312?B?MllmNC9Pb0JLZ2NWU3duczVzbnc1UG0xaVJ5TUR2V0hiR09mZnVBMFpPUFdr?=
 =?gb2312?B?VUVJTHVwbWF4bUFJU2NoRzUwelRnbDlXNjgxeVMrMDdjMHdvYS9XMGZXVnBG?=
 =?gb2312?B?dHF3T2ZtdUtHOXF3Y0xQM1NacCtiWW8vbDlCNEk4a0tUejZnc3BMQ2dKMUhn?=
 =?gb2312?B?RVJoaDArZEd6Ny8yK1RURnZmR1BwU0JBUU9ZM1VmRUZUNUg2Um81TlVNaFI4?=
 =?gb2312?B?MkcxWXk5bnJEUVlJdTBOKzRMRXdBbkptOGlvd2JGbWorVkIrVEF1K0tueHd2?=
 =?gb2312?B?ME40eVpWMWpUaVJXQkZZTGJ5cDNTUThGWndmZTFQNmxJMzZpZFVaWEUzZDFq?=
 =?gb2312?B?M3h0NnJkQkFxbkJLWkJrNmk3R2xkTnB0UHpaOWpxK05Sa1dFYmRvZXJBYS80?=
 =?gb2312?B?cVZkNEo2SytwenM5elJGNWJoSnFuM0kvZUUrWjhpQWZXaEl6RStaeU9KcFE2?=
 =?gb2312?B?OXlsM2lyaXZveWo5S3FRYThxTW12UzB5blNGc1NpenBaN1ZrdldoSjVVRDFk?=
 =?gb2312?B?bjJiaTdId2NKTVo3TVBDM1dLTGp2VkIvaW9mekc0VlZseThxcjdjRys5QWM0?=
 =?gb2312?B?RFoyelUyTEZXMUIycTF2SUNoL3VZM1hHaC91bmhFajhSZVZNMkxBanQ2THEx?=
 =?gb2312?B?V0hOQldjVlFZMTIydVNIL2JUQ2MzSm4waUt5M2x4VkNpeC9TUjNHb3hxdUJj?=
 =?gb2312?B?RU85MW9qWVU2VG1XVWt0QkJuYytWQnFlM3RTb1hhWnpkRGRhNEtQcXNoblN2?=
 =?gb2312?Q?JqfD0z+tkqt2ggdgiNcU0XvVaFdcjeNEENqZtPB?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35010838-26eb-416e-63d2-08d9743f4e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 09:42:29.2872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E2vrqUURcePALDbl1TUxmqelkcOCID4h25PuJx/SCf/ZLkPa2t04cPC29pHPhoAK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5517
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0Kb2gsIGdvZC4gdXZkIGZyZWUgaGFuZGxlciBzdWJt
aXQgZGVsYXllZCBtc2cgd2hpY2ggZGVwZW5kcyBvbiBzY2hlZHVsZXIgd2l0aCByZXNlcnZhdGlv
biBsb2NrIGhvbGQuDQpUaGlzIGlzIG5vdCBhbGxvd2VkIGFzIGNvbW1pdCBjOGU0MmQ1Nzg1OWQg
ImRybS9hbWRncHU6IGltcGxlbWVudCBtb3JlIGliIHBvb2xzICh2MikiIHNheXMNCkFueSBqb2Jz
IHdoaWNoIHNjaGVkdWxlIElCcyB3aXRob3V0IGRlcGVuZGVuY2Ugb24gZ3B1IHNjaGVkdWxlciBz
aG91bGQgdXNlIERJUkVDVCBwb29sLg0KDQpMb29rcyBsaWtlIHdlIHNob3VsZCBvbmx5IHVzZSBy
ZXNlcnZlZCBCTyBmb3IgZGlyZWN0IElCIHN1Ym1pc3Npb24uDQpBcyBmb3IgZGVsYXllZCBJQiBz
dWJtaXNzaW9uLCB3ZSBjb3VsZCBhbGxvYyBhIG5ldyBvbmUgZHluYW1pY2x5Lg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBLb2VuaWcsIENocmlzdGlh
biA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0Kt6LLzcqxvOQ6IDIwMjHE6jnUwjEwyNUgMTY6
NTMNCsrVvP7IyzogUGFuLCBYaW5odWk7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQqz
rcvNOiBEZXVjaGVyLCBBbGV4YW5kZXINCtb3zOI6IFJlOiC72Li0OiBbUEFUQ0ggMi80XSBkcm0v
YW1kZ3B1OiBVVkQgYXZvaWQgbWVtb3J5IGFsbG9jYXRpb24gZHVyaW5nIElCIHRlc3QNCg0KSXQg
c2hvdWxkIG5vdCB1bmxlc3Mgd2UgYXJlIE9PTSB3aGljaCBzaG91bGQgbm90IGhhcHBlbiBkdXJp
bmcgZHJpdmVyDQppbml0aWFsaXphdGlvbi4NCg0KQnV0IHRoZXJlIGlzIGFub3RoZXIgcHJvYmxl
bSBJJ20gdGhpbmtpbmcgYWJvdXQ6IERvIHdlIHN0aWxsIHVzZSBVVkQgSUINCnN1Ym1pc3Npb25z
IHRvIGZvcmNlZnVsbHkgdGVhciBkb3duIFVWRCBzZXNzaW9ucyB3aGVuIGEgcHJvY2VzcyBjcmFz
aGVzPw0KDQpJZiB5ZXMgdGhhdCBzdHVmZiBjb3VsZCBlYXNpbHkgZGVhZGxvY2sgd2l0aCBhbiBJ
QiB0ZXN0IGV4ZWN1dGVkIGR1cmluZw0KR1BVIHJlc2V0Lg0KDQpDaHJpc3RpYW4uDQoNCkFtIDEw
LjA5LjIxIHVtIDEwOjE4IHNjaHJpZWIgUGFuLCBYaW5odWk6DQo+IFtBTUQgT2ZmaWNpYWwgVXNl
IE9ubHldDQo+DQo+IEkgYW0gd29uZGVyaW5nIGlmIGFtZGdwdV9ib19waW4gd291bGQgY2hhbmdl
IEJPJ3MgcGxhY2VtZW50IGluIHRoZSBmdXRydWUuDQo+IEZvciBub3csIHRoZSBuZXcgcGxhY2Vt
ZW50IGlzIGNhbGN1bGF0ZWQgYnkgbmV3ID0gb2xkIKHJIG5ldy4NCj4NCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiC3orz+yMs6IEtvZW5pZywgQ2hyaXN0aWFu
IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+ILeiy83KsbzkOiAyMDIxxOo51MIxMMjVIDE0
OjI0DQo+IMrVvP7IyzogUGFuLCBYaW5odWk7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ILOty806IERldWNoZXIsIEFsZXhhbmRlcg0KPiDW98ziOiBSZTogW1BBVENIIDIvNF0gZHJt
L2FtZGdwdTogVVZEIGF2b2lkIG1lbW9yeSBhbGxvY2F0aW9uIGR1cmluZyBJQiB0ZXN0DQo+DQo+
IEFtIDEwLjA5LjIxIHVtIDAyOjM4IHNjaHJpZWIgeGluaHVpIHBhbjoNCj4+IG1vdmUgQk8gYWxs
b2NhdGlvbiBpbiBzd19pbml0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhp
bmh1aS5wYW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3V2ZC5jIHwgNzUgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPj4gICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5oIHwgIDEgKw0KPj4gICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyAgIHwgIDggKy0tDQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jICAgfCAgOCArLS0NCj4+ICAgIDQgZmlsZXMg
Y2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYw0KPj4gaW5kZXggZDQ1MWMzNTk2MDZhLi5l
MmVhYWM5NDFkMzcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdXZkLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91
dmQuYw0KPj4gQEAgLTE0MSw2ICsxNDEsOCBAQCBpbnQgYW1kZ3B1X3V2ZF9zd19pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gICAgICAgIGNvbnN0IGNoYXIgKmZ3X25hbWU7DQo+
PiAgICAgICAgY29uc3Qgc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgKmhkcjsNCj4+ICAg
ICAgICB1bnNpZ25lZCBmYW1pbHlfaWQ7DQo+PiArICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9
IE5VTEw7DQo+PiArICAgICB2b2lkICphZGRyOw0KPj4gICAgICAgIGludCBpLCBqLCByOw0KPj4N
Cj4+ICAgICAgICBJTklUX0RFTEFZRURfV09SSygmYWRldi0+dXZkLmlkbGVfd29yaywgYW1kZ3B1
X3V2ZF9pZGxlX3dvcmtfaGFuZGxlcik7DQo+PiBAQCAtMjk4LDkgKzMwMCwzNCBAQCBpbnQgYW1k
Z3B1X3V2ZF9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gICAgICAgICAg
ICAgICAgYWRldi0+dXZkLmZpbHBbaV0gPSBOVUxMOw0KPj4gICAgICAgIH0NCj4+DQo+PiArICAg
ICByID0gYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZChhZGV2LCAxMjggPDwgMTAsIFBBR0VfU0la
RSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9HVFQsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgJmJvLCBOVUxMLCAmYWRkcik7DQo+PiArICAgICBpZiAocikN
Cj4+ICsgICAgICAgICAgICAgcmV0dXJuIHI7DQo+PiArDQo+PiAgICAgICAgLyogZnJvbSB1dmQg
djUuMCBIVyBhZGRyZXNzaW5nIGNhcGFjaXR5IGluY3JlYXNlZCB0byA2NCBiaXRzICovDQo+PiAt
ICAgICBpZiAoIWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfdmVyc2lvbl9jbXAoYWRldiwgQU1EX0lQ
X0JMT0NLX1RZUEVfVVZELCA1LCAwKSkNCj4+ICsgICAgIGlmICghYW1kZ3B1X2RldmljZV9pcF9i
bG9ja192ZXJzaW9uX2NtcChhZGV2LCBBTURfSVBfQkxPQ0tfVFlQRV9VVkQsIDUsIDApKSB7DQo+
PiAgICAgICAgICAgICAgICBhZGV2LT51dmQuYWRkcmVzc182NF9iaXQgPSB0cnVlOw0KPj4gKyAg
ICAgICAgICAgICBhbWRncHVfYm9fa3VubWFwKGJvKTsNCj4+ICsgICAgICAgICAgICAgYW1kZ3B1
X2JvX3VucGluKGJvKTsNCj4+ICsgICAgICAgICAgICAgciA9IGFtZGdwdV9ib19waW5fcmVzdHJp
Y3RlZChibywgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDAsIDI1NiA8PCAyMCk7DQo+IFBsZWFzZSBrZWVwIHVzaW5nIGFtZGdwdV91dmRf
Zm9yY2VfaW50b191dmRfc2VnbWVudCgpIGFuZCB2YWxpZGF0ZSBoZXJlLA0KPiBjYXVzZSBJIHdh
bnQgdG8gcmVtb3ZlIGFtZGdwdV9ib19waW5fcmVzdHJpY3RlZCgpIHNvb25lciBvciBsYXRlci4N
Cj4NCj4+ICsgICAgICAgICAgICAgaWYgKHIpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBh
bWRncHVfYm9fdW5yZXNlcnZlKGJvKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBhbWRncHVf
Ym9fdW5yZWYoJmJvKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcjsNCj4+ICsg
ICAgICAgICAgICAgfQ0KPj4gKyAgICAgICAgICAgICByID0gYW1kZ3B1X2JvX2ttYXAoYm8sICZh
ZGRyKTsNCj4+ICsgICAgICAgICAgICAgaWYgKHIpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICBhbWRncHVfYm9fdW5waW4oYm8pOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9i
b191bnJlc2VydmUoYm8pOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9ib191bnJl
ZigmYm8pOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByOw0KPj4gKyAgICAgICAg
ICAgICB9DQo+PiArICAgICB9DQo+PiArICAgICBhZGV2LT51dmQuaWJfYm8gPSBibzsNCj4+ICsg
ICAgIGFtZGdwdV9ib191bnJlc2VydmUoYm8pOw0KPj4NCj4+ICAgICAgICBzd2l0Y2ggKGFkZXYt
PmFzaWNfdHlwZSkgew0KPj4gICAgICAgIGNhc2UgQ0hJUF9UT05HQToNCj4+IEBAIC0zNDIsNiAr
MzY5LDcgQEAgaW50IGFtZGdwdV91dmRfc3dfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikNCj4+ICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBTURHUFVfTUFYX1VWRF9FTkNf
UklOR1M7ICsraSkNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X3JpbmdfZmluaSgm
YWRldi0+dXZkLmluc3Rbal0ucmluZ19lbmNbaV0pOw0KPj4gICAgICAgIH0NCj4+ICsgICAgIGFt
ZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+dXZkLmliX2JvLCBOVUxMLCBOVUxMKTsNCj4+ICAg
ICAgICByZWxlYXNlX2Zpcm13YXJlKGFkZXYtPnV2ZC5mdyk7DQo+Pg0KPj4gICAgICAgIHJldHVy
biAwOw0KPj4gQEAgLTEwODAsMjMgKzExMDgsMTAgQEAgc3RhdGljIGludCBhbWRncHVfdXZkX3Nl
bmRfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGFtZGdwdV9ibyAqYm8sDQo+
PiAgICAgICAgdW5zaWduZWQgb2Zmc2V0X2lkeCA9IDA7DQo+PiAgICAgICAgdW5zaWduZWQgb2Zm
c2V0WzNdID0geyBVVkRfQkFTRV9TSSwgMCwgMCB9Ow0KPj4NCj4+IC0gICAgIGFtZGdwdV9ib19r
dW5tYXAoYm8pOw0KPj4gLSAgICAgYW1kZ3B1X2JvX3VucGluKGJvKTsNCj4+IC0NCj4+IC0gICAg
IGlmICghcmluZy0+YWRldi0+dXZkLmFkZHJlc3NfNjRfYml0KSB7DQo+PiAtICAgICAgICAgICAg
IHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IHRydWUsIGZhbHNlIH07DQo+PiAtDQo+
PiAtICAgICAgICAgICAgIGFtZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4oYm8sIEFNREdQ
VV9HRU1fRE9NQUlOX1ZSQU0pOw0KPj4gLSAgICAgICAgICAgICBhbWRncHVfdXZkX2ZvcmNlX2lu
dG9fdXZkX3NlZ21lbnQoYm8pOw0KPj4gLSAgICAgICAgICAgICByID0gdHRtX2JvX3ZhbGlkYXRl
KCZiby0+dGJvLCAmYm8tPnBsYWNlbWVudCwgJmN0eCk7DQo+PiAtICAgICAgICAgICAgIGlmIChy
KQ0KPj4gLSAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPj4gLSAgICAgfQ0KPj4gLQ0K
Pj4gICAgICAgIHIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIoYWRldiwgNjQsIGRpcmVjdCA/
IEFNREdQVV9JQl9QT09MX0RJUkVDVCA6DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBBTURHUFVfSUJfUE9PTF9ERUxBWUVELCAmam9iKTsNCj4+ICAgICAgICBpZiAocikN
Cj4+IC0gICAgICAgICAgICAgZ290byBlcnI7DQo+PiArICAgICAgICAgICAgIHJldHVybiByOw0K
Pj4NCj4+ICAgICAgICBpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfVkVHQTEwKSB7DQo+PiAg
ICAgICAgICAgICAgICBvZmZzZXRfaWR4ID0gMSArIHJpbmctPm1lOw0KPj4gQEAgLTExNDgsOCAr
MTE2Myw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3V2ZF9zZW5kX21zZyhzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHN0cnVjdCBhbWRncHVfYm8gKmJvLA0KPj4gICAgICAgIH0NCj4+DQo+PiAgICAg
ICAgYW1kZ3B1X2JvX2ZlbmNlKGJvLCBmLCBmYWxzZSk7DQo+PiAtICAgICBhbWRncHVfYm9fdW5y
ZXNlcnZlKGJvKTsNCj4+IC0gICAgIGFtZGdwdV9ib191bnJlZigmYm8pOw0KPj4NCj4+ICAgICAg
ICBpZiAoZmVuY2UpDQo+PiAgICAgICAgICAgICAgICAqZmVuY2UgPSBkbWFfZmVuY2VfZ2V0KGYp
Ow0KPj4gQEAgLTExNTksMTAgKzExNzIsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV91dmRfc2VuZF9t
c2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBzdHJ1Y3QgYW1kZ3B1X2JvICpibywNCj4+DQo+
PiAgICBlcnJfZnJlZToNCj4+ICAgICAgICBhbWRncHVfam9iX2ZyZWUoam9iKTsNCj4+IC0NCj4+
IC1lcnI6DQo+PiAtICAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsNCj4+IC0gICAgIGFtZGdw
dV9ib191bnJlZigmYm8pOw0KPj4gICAgICAgIHJldHVybiByOw0KPj4gICAgfQ0KPj4NCj4+IEBA
IC0xMTczLDE2ICsxMTgyLDE1IEBAIGludCBhbWRncHVfdXZkX2dldF9jcmVhdGVfbXNnKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlLA0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpDQo+PiAgICB7DQo+PiAgICAg
ICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Ow0KPj4gLSAgICAgc3Ry
dWN0IGFtZGdwdV9ibyAqYm8gPSBOVUxMOw0KPj4gKyAgICAgc3RydWN0IGFtZGdwdV9ibyAqYm8g
PSBhZGV2LT51dmQuaWJfYm87DQo+PiAgICAgICAgdWludDMyX3QgKm1zZzsNCj4+ICAgICAgICBp
bnQgciwgaTsNCj4+DQo+PiAtICAgICByID0gYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZChhZGV2
LCAxMDI0LCBQQUdFX1NJWkUsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBBTURHUFVfR0VNX0RPTUFJTl9HVFQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmYm8sIE5VTEwsICh2b2lkICoqKSZtc2cpOw0KPj4gKyAgICAgciA9IHR0bV9ib19y
ZXNlcnZlKCZiby0+dGJvLCB0cnVlLCB0cnVlLCBOVUxMKTsNCj4+ICAgICAgICBpZiAocikNCj4+
ICAgICAgICAgICAgICAgIHJldHVybiByOw0KPj4NCj4+ICsgICAgIG1zZyA9IGFtZGdwdV9ib19r
cHRyKGJvKTsNCj4+ICAgICAgICAvKiBzdGl0Y2ggdG9nZXRoZXIgYW4gVVZEIGNyZWF0ZSBtc2cg
Ki8NCj4+ICAgICAgICBtc2dbMF0gPSBjcHVfdG9fbGUzMigweDAwMDAwZGU0KTsNCj4+ICAgICAg
ICBtc2dbMV0gPSBjcHVfdG9fbGUzMigweDAwMDAwMDAwKTsNCj4+IEBAIC0xMTk4LDIzICsxMjA2
LDI1IEBAIGludCBhbWRncHVfdXZkX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywgdWludDMyX3QgaGFuZGxlLA0KPj4gICAgICAgIGZvciAoaSA9IDExOyBpIDwgMTAyNDsg
KytpKQ0KPj4gICAgICAgICAgICAgICAgbXNnW2ldID0gY3B1X3RvX2xlMzIoMHgwKTsNCj4+DQo+
PiAtICAgICByZXR1cm4gYW1kZ3B1X3V2ZF9zZW5kX21zZyhyaW5nLCBibywgdHJ1ZSwgZmVuY2Up
Ow0KPj4gKyAgICAgciA9IGFtZGdwdV91dmRfc2VuZF9tc2cocmluZywgYm8sIHRydWUsIGZlbmNl
KTsNCj4+ICsNCj4+ICsgICAgIGFtZGdwdV9ib191bnJlc2VydmUoYm8pOw0KPj4gKyAgICAgcmV0
dXJuIHI7DQo+PiAgICB9DQo+Pg0KPj4gICAgaW50IGFtZGdwdV91dmRfZ2V0X2Rlc3Ryb3lfbXNn
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlLA0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBkaXJlY3QsIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5j
ZSkNCj4+ICAgIHsNCj4+ICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmct
PmFkZXY7DQo+PiAtICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IE5VTEw7DQo+PiArICAgICBz
dHJ1Y3QgYW1kZ3B1X2JvICpibyA9IGFkZXYtPnV2ZC5pYl9ibzsNCj4+ICAgICAgICB1aW50MzJf
dCAqbXNnOw0KPj4gICAgICAgIGludCByLCBpOw0KPj4NCj4+IC0gICAgIHIgPSBhbWRncHVfYm9f
Y3JlYXRlX3Jlc2VydmVkKGFkZXYsIDEwMjQsIFBBR0VfU0laRSwNCj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX0dUVCwNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZibywgTlVMTCwgKHZvaWQgKiopJm1zZyk7DQo+
PiArICAgICByID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRydWUsIHRydWUsIE5VTEwpOw0K
PiBQbGVhc2UgdXNlIGFtZGdwdV9ib19yZXNlcnZlKCkgaGVyZSBhbmQgZWxzZXdoZXJlIGFzIHdl
bGwganVzdCB0byBiZSBvbg0KPiB0aGUgY2xlYW4gc2lkZS4NCj4NCj4gTG9ja2RlcCB3aWxsIHNv
b25lciBvciBsYXRlciBjb21wbGFpbiB0aGF0IHdlIHJlc2VydmUgYSBCTyBpbiB0aGUgcmVzZXQN
Cj4gcGF0aCwgYnV0IHRoYXQgaXMgbW9zdGx5IGEgdGhlb3JldGljYWwgcHJvYmxlbSBhbmQgZXhp
c3RlZCBiZWZvcmUuIFNvDQo+IEknbSBmaW5lIHdpdGggc3RpY2tpbmcgd2l0aCB0aGF0IGZvciBu
b3cgY2F1c2UgdGhlIHByb2JsZW0gd2FzIHRoZXJlDQo+IGJlZm9yZSBhcyB3ZWxsLg0KPg0KPiBJ
dCdzIGp1c3QgdGhhdCB0cnlsb2NrIG1pZ2h0IG5vdCB3b3JrIGJlY2F1c2UgdGhlIEJPIGlzIGJ1
c3kgd2l0aA0KPiBpbmRpcmVjdCBzdWJtaXNzaW9uLg0KPg0KPiBBcGFydCBmcm9tIHRob3NlIHR3
byBtaW5vciBpc3N1ZXMgdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQo+DQo+IFRoYW5rcywN
Cj4gQ2hyaXN0aWFuLg0KPg0KPj4gICAgICAgIGlmIChyKQ0KPj4gICAgICAgICAgICAgICAgcmV0
dXJuIHI7DQo+Pg0KPj4gKyAgICAgbXNnID0gYW1kZ3B1X2JvX2twdHIoYm8pOw0KPj4gICAgICAg
IC8qIHN0aXRjaCB0b2dldGhlciBhbiBVVkQgZGVzdHJveSBtc2cgKi8NCj4+ICAgICAgICBtc2db
MF0gPSBjcHVfdG9fbGUzMigweDAwMDAwZGU0KTsNCj4+ICAgICAgICBtc2dbMV0gPSBjcHVfdG9f
bGUzMigweDAwMDAwMDAyKTsNCj4+IEBAIC0xMjIzLDcgKzEyMzMsMTAgQEAgaW50IGFtZGdwdV91
dmRfZ2V0X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFu
ZGxlLA0KPj4gICAgICAgIGZvciAoaSA9IDQ7IGkgPCAxMDI0OyArK2kpDQo+PiAgICAgICAgICAg
ICAgICBtc2dbaV0gPSBjcHVfdG9fbGUzMigweDApOw0KPj4NCj4+IC0gICAgIHJldHVybiBhbWRn
cHVfdXZkX3NlbmRfbXNnKHJpbmcsIGJvLCBkaXJlY3QsIGZlbmNlKTsNCj4+ICsgICAgIHIgPSBh
bWRncHVfdXZkX3NlbmRfbXNnKHJpbmcsIGJvLCBkaXJlY3QsIGZlbmNlKTsNCj4+ICsNCj4+ICsg
ICAgIGFtZGdwdV9ib191bnJlc2VydmUoYm8pOw0KPj4gKyAgICAgcmV0dXJuIHI7DQo+PiAgICB9
DQo+Pg0KPj4gICAgc3RhdGljIHZvaWQgYW1kZ3B1X3V2ZF9pZGxlX3dvcmtfaGFuZGxlcihzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3V2ZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3V2ZC5oDQo+PiBpbmRleCBlZGJiODE5NGVlODEuLjc2YWM5Njk5ODg1ZCAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuaA0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5oDQo+PiBAQCAtNjgsNiArNjgsNyBA
QCBzdHJ1Y3QgYW1kZ3B1X3V2ZCB7DQo+PiAgICAgICAgLyogc3RvcmUgaW1hZ2Ugd2lkdGggdG8g
YWRqdXN0IG5iIG1lbW9yeSBzdGF0ZSAqLw0KPj4gICAgICAgIHVuc2lnbmVkICAgICAgICAgICAg
ICAgIGRlY29kZV9pbWFnZV93aWR0aDsNCj4+ICAgICAgICB1aW50MzJfdCAgICAgICAgICAgICAg
ICBrZXlzZWxlY3Q7DQo+PiArICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICAgICAgICAqaWJfYm87DQo+
PiAgICB9Ow0KPj4NCj4+ICAgIGludCBhbWRncHVfdXZkX3N3X2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3V2ZF92Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jDQo+PiBp
bmRleCBiYzU3MTgzMzYzMmUuLjMwMWMwY2VhNzE2NCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCj4+IEBAIC0zMzIsMTIgKzMzMiwxMCBAQCBzdGF0aWMgaW50
IHV2ZF92Nl8wX2VuY19nZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLA0K
Pj4gICAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfcmluZ190ZXN0X2liKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgbG9uZyB0aW1lb3V0KQ0KPj4gICAgew0KPj4gICAgICAgIHN0cnVjdCBkbWFf
ZmVuY2UgKmZlbmNlID0gTlVMTDsNCj4+IC0gICAgIHN0cnVjdCBhbWRncHVfYm8gKmJvID0gTlVM
TDsNCj4+ICsgICAgIHN0cnVjdCBhbWRncHVfYm8gKmJvID0gcmluZy0+YWRldi0+dXZkLmliX2Jv
Ow0KPj4gICAgICAgIGxvbmcgcjsNCj4+DQo+PiAtICAgICByID0gYW1kZ3B1X2JvX2NyZWF0ZV9y
ZXNlcnZlZChyaW5nLT5hZGV2LCAxMjggKiAxMDI0LCBQQUdFX1NJWkUsDQo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLA0KPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmJvLCBOVUxMLCBOVUxMKTsNCj4+ICsg
ICAgIHIgPSB0dG1fYm9fcmVzZXJ2ZSgmYm8tPnRibywgdHJ1ZSwgdHJ1ZSwgTlVMTCk7DQo+PiAg
ICAgICAgaWYgKHIpDQo+PiAgICAgICAgICAgICAgICByZXR1cm4gcjsNCj4+DQo+PiBAQCAtMzU3
LDkgKzM1NSw3IEBAIHN0YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX3JpbmdfdGVzdF9pYihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkNCj4+DQo+PiAgICBlcnJvcjoNCj4+ICAg
ICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsNCj4+IC0gICAgIGFtZGdwdV9ib191bnBpbihibyk7
DQo+PiAgICAgICAgYW1kZ3B1X2JvX3VucmVzZXJ2ZShibyk7DQo+PiAtICAgICBhbWRncHVfYm9f
dW5yZWYoJmJvKTsNCj4+ICAgICAgICByZXR1cm4gcjsNCj4+ICAgIH0NCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMNCj4+IGluZGV4IGI2ZTgyZDc1NTYxZi4uZWZhMjcw
Mjg4MDI5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3
XzAuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYw0KPj4g
QEAgLTMzOCwxMiArMzM4LDEwIEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX2dldF9kZXN0cm95
X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsDQo+PiAgICBzdGF0
aWMgaW50IHV2ZF92N18wX2VuY19yaW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LCBsb25nIHRpbWVvdXQpDQo+PiAgICB7DQo+PiAgICAgICAgc3RydWN0IGRtYV9mZW5jZSAqZmVu
Y2UgPSBOVUxMOw0KPj4gLSAgICAgc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBOVUxMOw0KPj4gKyAg
ICAgc3RydWN0IGFtZGdwdV9ibyAqYm8gPSByaW5nLT5hZGV2LT51dmQuaWJfYm87DQo+PiAgICAg
ICAgbG9uZyByOw0KPj4NCj4+IC0gICAgIHIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKHJp
bmctPmFkZXYsIDEyOCAqIDEwMjQsIFBBR0VfU0laRSwNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmYm8sIE5VTEwsIE5VTEwpOw0KPj4gKyAgICAgciA9IHR0
bV9ib19yZXNlcnZlKCZiby0+dGJvLCB0cnVlLCB0cnVlLCBOVUxMKTsNCj4+ICAgICAgICBpZiAo
cikNCj4+ICAgICAgICAgICAgICAgIHJldHVybiByOw0KPj4NCj4+IEBAIC0zNjMsOSArMzYxLDcg
QEAgc3RhdGljIGludCB1dmRfdjdfMF9lbmNfcmluZ190ZXN0X2liKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgbG9uZyB0aW1lb3V0KQ0KPj4NCj4+ICAgIGVycm9yOg0KPj4gICAgICAgIGRtYV9m
ZW5jZV9wdXQoZmVuY2UpOw0KPj4gLSAgICAgYW1kZ3B1X2JvX3VucGluKGJvKTsNCj4+ICAgICAg
ICBhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsNCj4+IC0gICAgIGFtZGdwdV9ib191bnJlZigmYm8p
Ow0KPj4gICAgICAgIHJldHVybiByOw0KPj4gICAgfQ0KPj4NCg0K
