Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8E54C99D
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jun 2022 15:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DBC10E8BD;
	Wed, 15 Jun 2022 13:17:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E185F10E8E8
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jun 2022 13:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH8be4el7LHtT1+AEhnPsAtlI4y0FtCmIuWZRuPyoMcqKGSqmJoKPLNsep8NtYh0BWCQXc5xpkjyqnsMpt7rSm2QMCfLgKsnKmKzQjH88PC25UJV3vg4m8jk/Li+WYsYPPna2xURUfa31YGkXk7K+lQ3SnKCcwyip2gPSOAKINmU6fWJi38sHuo6WePQsbW9D2jmKhO5jejccGCFm6P1igmpRgSGgNqgHD0QCES6ad5FnImKg5s/IBaG/35P9nDpEsjZZsu2qbnoNspr1ym0EqVXegG+eolKw4EH8bnGA1SEz9vK0OqPppwKaBax+PQzBFIg/JshVnAxdhvqRf/83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgS1m22sySUKINA0nf5jwhEUYNoyGo8JuYfIoJRYmHg=;
 b=dzN4Dbgz0zL/0VlqH3YioBJ0j1YM7zbTGVHc/eNQSOX6upI+7Ft6r14ONB645wJ7YPHUIR2JG2ZgfZ/KGzXDqYfxDd7agSgbivXkuTnM0Bt3TB/B1cqpB15DpKUwwetiyg7AyvvGqEdSh4y/Jtu0XEOD5zArpuIK0tLnJdmyN0uyVqf0x4KOE3pBnCgT2dOC4P63LDlZDkQ5YEseGfgF8T9u0gIOugrxGFGpYU2ICvBhndFb86wc05xjECWlRuIQ927wQxbZTPDl5iSiXz/N1bZMOLpAeCJdyE0+K/LKn/hCA3JDwJsBzp0lrB08r94VUbEfwp5cy0WP3aDMQk2P1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgS1m22sySUKINA0nf5jwhEUYNoyGo8JuYfIoJRYmHg=;
 b=p882vMge4R5lbaHvw0DGIMfJYnbw21MQAHUud8vWpQ2ZQvUouBXPHHXfanybGPYrZ2w3+mwIbcIzFFmCiW81O1PIy0T1hqwYcwfIZ2oi7cTTdEZv+exEcC65TFG9hY/5JnHTk5Z/6eAE3Qqu9ucYGtbMsnVgM1vbuOV/Imeyd/A=
Received: from DM6PR12MB3067.namprd12.prod.outlook.com (2603:10b6:5:115::10)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Wed, 15 Jun
 2022 13:17:23 +0000
Received: from DM6PR12MB3067.namprd12.prod.outlook.com
 ([fe80::3d3a:523d:94fd:fa16]) by DM6PR12MB3067.namprd12.prod.outlook.com
 ([fe80::3d3a:523d:94fd:fa16%6]) with mapi id 15.20.5332.023; Wed, 15 Jun 2022
 13:17:21 +0000
From: "Sider, Graham" <Graham.Sider@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/3] drm/amdkfd: Enable GFX11 usermode queue
 oversubscription
Thread-Topic: [PATCH v3 2/3] drm/amdkfd: Enable GFX11 usermode queue
 oversubscription
Thread-Index: AQHYfzkX/nzgeGX8UkaVeB6hqEJG5q1QFKmAgABf93A=
Date: Wed, 15 Jun 2022 13:17:21 +0000
Message-ID: <DM6PR12MB30675F77909B21063CD01B8A8AAD9@DM6PR12MB3067.namprd12.prod.outlook.com>
References: <20220613152001.3045911-1-Graham.Sider@amd.com>
 <20220613152001.3045911-2-Graham.Sider@amd.com>
 <453d57bf-e1b1-9dcb-9022-21444d2c64a8@amd.com>
In-Reply-To: <453d57bf-e1b1-9dcb-9022-21444d2c64a8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-15T13:17:20Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ee828d5b-956e-4961-a63f-81e264adedcf;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-15T13:17:20Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 09956723-5424-46e1-823f-eb6baa1a5c2e
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51b4cd67-9e7f-494a-2ad7-08da4ed16137
x-ms-traffictypediagnostic: PH0PR12MB5466:EE_
x-microsoft-antispam-prvs: <PH0PR12MB546648436A9EF87B9ECB9E938AAD9@PH0PR12MB5466.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MseODtV54oSx9FXOYqJzEpg4fv8ILb4GT0QzcblzptO8FJP6XcrEHUlr4EcTAa4Dr5dLflsw2UCx8l50Nw+Q2VVOD75dTJSUQb40Zk4Vo41OuHLm7j9GlkG7xuKfCRAGtV85CdI35uj1fwWYVm00xXSyJGDmObdTN3pFpkFYDUsXHOpt0mdMazcPmT5lOWeSQJBXHSn4wCBtgurxsQnHhg451locPbR56VMt7BLLeWmK48Pc1yCFdNvYIUPkU0WOaFKmRDc+++3RBTpAWXIUUN57jE4c5vT0789Ta9wIHY12QmPS1Zbyvb2UNLwal+KWwSz0hrDKC7z9VUdG0Xp+0jvq8TsQyogewIINmWZHuXw9UWLyskDEG8mQwia7rE41yFL34teB3Qj41usDgYPmLiOBsP1S5N0i+9uCDkfQohiSE75bo/79WosdNAsBbQa2OpuWYmUazxmbgPPLnrrnMHz6A3sQiBXGaFulPehU7rSJIJuE+b8bkz1R70z/6yXpB9wnJaaAwFXZ2O0HOnKtj82kM5F6O8En/X9H6/jiSW1EG+M+ErOPA/CWD/7rlsdGxwnDKl81wxqq43xd4+/6vgzVsopsPkenoNIpO9UHcIhAw6j17CpCYRtAZRsV6B9ZZOohjBdV3uKYgLbfg6jsfo3Uv/eshlWjObaYoq8TmlbwzO57b0+L3g7xjNMvx4m5KVXfEUaq6Lg2vopB5LLIMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3067.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(53546011)(38100700002)(7696005)(52536014)(6506007)(9686003)(2906002)(5660300002)(55016003)(33656002)(26005)(30864003)(8936002)(110136005)(54906003)(71200400001)(8676002)(66946007)(66476007)(508600001)(66556008)(64756008)(86362001)(66446008)(186003)(76116006)(4326008)(83380400001)(316002)(122000001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1o4RE5RZ1dlMDk1Rmlrc0VHcDBNMGQ5M1JQdldxcFBlL3VqTUYzTGU0TUdK?=
 =?utf-8?B?Vkw4VzJVSzY2d2RLWS9oek9KNzJlNDRwOGxTWmJvNGtCK0VnWHBoZGdHeC85?=
 =?utf-8?B?QmwrTlF5Y1dFUExUbU9SdGk3Q083ZFZ1NU9KQW01MVV6ZWtWNE54eXcxWmd5?=
 =?utf-8?B?R3dlUHhLSG01K1VpY0l0WjFFMlpJaWZaTGgzS0FYUjlFNGpkQmhuTmY3V2pL?=
 =?utf-8?B?bm1ycE5iS1NVeVdiUU04eHg1RUMvdkZ1S2FQU1k4Z0hzNkpaUDFTOUhBNC80?=
 =?utf-8?B?N01PZWdOVU5MdW9HVm44a09SelFydk1Vc2ZoQnhUUFZ4M1FHdk0wcjVOWVZm?=
 =?utf-8?B?aDB5dFdGbnVkZWZhcmdxTTRkNVhzNC9pNFBsSVdvU1A5YTVCQzJscjZxSmZx?=
 =?utf-8?B?WW8yalF0WTEwdVFRZVc0Y0ZPVEZlbG51ZUFMNHAyaStyQ0lsUWNHbDB4WDdB?=
 =?utf-8?B?L2RxT0J6WGFNSCtJbkNhUTVpUEdwYjV1cW5UYTlkVTU0ZUlFQXYyRklDRHhM?=
 =?utf-8?B?TCszdExrZU1IT0ZZQVNqK2tnd1c4ZTRESTFsalltWXZ0NHFOT0ZZQ0FFVUdw?=
 =?utf-8?B?KzNUZndvMk9Vdk14K0MzcVpoYjJkUjFWN2NFSnJNRmpLM21IM1cvOWFXMktq?=
 =?utf-8?B?aEFUS0VrWWJpRDZ2dE9YNndsbFBKZ2xTRXlwM2Fublp5T0psZ2ZHUHZxbkVo?=
 =?utf-8?B?eGJPZVdpNUpzQW9ZbHVadEljQm1rZjdHOUVud1RLbXlxa3dlYWJjQW5hUW1z?=
 =?utf-8?B?UzhEOVB4d3hqUjdpdE1sQis4ZU5BUWZaZ0xyVldDcXVXcEo1WmJsTkFWdGpI?=
 =?utf-8?B?NVVpT3ltbitKYUphV3VrRjFXK2VwSVBVcUNmYTk1aGJMMjRyYXFSek5iUFB5?=
 =?utf-8?B?N2h3eEdxYUhrRWovbjF2Z2RDU0Z2VUZXK2phRXJrWklaaUJzczRPbUJxMkl6?=
 =?utf-8?B?K2lwVDlMRGtEVys0ZTJ0WDBoOVVKNFJaYXZGelJtbXdKdFk5dE5GSG53Ykln?=
 =?utf-8?B?MUY4aTNSSTVneFZIeGZxS3Q2M0JPa3MzRzFFckU5eVd5anVwYnR1UWR3bDB0?=
 =?utf-8?B?MWl6bDhoM3RmQ1J4WXhaMCtzSkh0cmgxZWlqOVNjL3doK2dhbGpHcHRzYmhP?=
 =?utf-8?B?NTFWaUROTk9oemkwU1F6OThVd1BuSUsvb0VrajR2NitNM3lMK0UrRklJaDJO?=
 =?utf-8?B?VWFVemxkSWFqRFR1MEZXMHhoOGlrc0dWRE1ZMnl3YlRLRDBZOENQNnNQRHd6?=
 =?utf-8?B?Ukl6RXNEWmFZck5yK0JQRXpoTk55RDBKeWtpQXlpYzFmMWNISGVvUFlkOXFm?=
 =?utf-8?B?am5SMWVCZ1QyNWpYY0dMR0s4QkVyVEdYcG9RK01xK2VTQjBIOXd5bFhMVHUz?=
 =?utf-8?B?T0JEMXBYS2R6TTByZ3c5aGpzZkM4K3FJSUt1WlZMQUlnOTgrejBFMmxHa0Ex?=
 =?utf-8?B?VFVJVkF0N3lFeVVKbHFXT05weWVjM0FFSUR1SVRyUFlhZWpqamF0VmxDVjZX?=
 =?utf-8?B?V0RhWjFFL21KV1RieGJ5S3ZSM0RLWmZta3lDbUNETjg0M3dwRWE4NGJWaGgr?=
 =?utf-8?B?RjRjYUhwc3hXclJpSFYrdHROb3I2Sm02d1RlN284YUVxelZKV1ZhS0sxSlM5?=
 =?utf-8?B?aVdHM3YrN3dqaXlCdFFSVVVqVVZMQ1pHVmdFUytmdFNWLzF6SHlRaWl2VDFZ?=
 =?utf-8?B?eldNanR2U0puem9SdHZOcUlYUWlFUUEyVEFmZ2ZBSmVvN2VvOFpIVkhsc2xP?=
 =?utf-8?B?dWtGTWRJK2lBaHJXMFdTT0hrTWFBQllRMWJSQ04wT3VpZFgwSGhIbHQrUUNn?=
 =?utf-8?B?SHJ4d0JkTmx6RzhVSVlGd0gyUkRFd2JjbkcrWVhuSVZyZmxiT00wS3pMS1F0?=
 =?utf-8?B?czBVTUQvMTdjZzI3d2w1Q3B3anZ3VUJEaTlmc3d0d0pVZGx6MkNlZHBUbGVm?=
 =?utf-8?B?ZUdYVlNsUEZCZGJ5TDUvSGg4S09sbHMxOHJ3d3gwSDkzdyt1US82ZFJCVHox?=
 =?utf-8?B?aTh5clpJM1Ridm5Xc3VDSTJIUmE1RmxPVDV4RmptNy9sSE94YXRqSHZZaGZx?=
 =?utf-8?B?bmdLMEJPRnlkQTVCT3BvbnVCdjllYlRoNFcyRCtDRWRLVjhKTjMrNkdtek04?=
 =?utf-8?B?VUJ3d2p6QjliNmNLU1gwWlU5RXJmdGJ1T3VGNmNWMDR3cFl1WXp6T3VYVlVB?=
 =?utf-8?B?SkRkMjNZVWhpeWZRaFJuSUZ1SUtCQ1g3RHBIcHlYTStLeTIxejYvam1VQ0ky?=
 =?utf-8?B?eW5pWmliQUkyc1cydU5PUVlFWEhTOTNTelBjWFNrQ1lyanRXZGg5WERyRkdq?=
 =?utf-8?Q?QF9PvFJEwPiA9Vcg4Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3067.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b4cd67-9e7f-494a-2ad7-08da4ed16137
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 13:17:21.2170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Js1J48MWos1RSNyxAz67AZnamBwkPRd+jiZrXpn4p1Gg3hqZ6zLTfTrnt+d/sbVx4DC/qmqlTYZcjLTsagJ5bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466
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
Cc: "Joshi, Mukul" <Mukul.Joshi@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1k
LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDE1LCAyMDIyIDM6MjkgQU0NCj4gVG86IFNp
ZGVyLCBHcmFoYW0gPEdyYWhhbS5TaWRlckBhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBKb3NoaSwgTXVrdWwgPE11a3VsLkpvc2hpQGFtZC5jb20+OyBL
dWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBZYW5nLCBQaGlsaXAg
PFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8zXSBkcm0v
YW1ka2ZkOiBFbmFibGUgR0ZYMTEgdXNlcm1vZGUgcXVldWUNCj4gb3ZlcnN1YnNjcmlwdGlvbg0K
PiANCj4gDQo+IA0KPiBBbSAxMy4wNi4yMiB1bSAxNzoyMCBzY2hyaWViIEdyYWhhbSBTaWRlcjoN
Cj4gPiBTdGFydGluZyB3aXRoIEdGWDExLCBNRVMgcmVxdWlyZXMgd3B0ciBCT3MgdG8gYmUgR1RU
IGFsbG9jYXRlZC9tYXBwZWQNCj4gPiB0byBHQVJUIGZvciB1c2VybW9kZSBxdWV1ZXMgaW4gb3Jk
ZXIgdG8gc3VwcG9ydCBvdmVyc3Vic2NyaXB0aW9uLiBJbg0KPiA+IHRoZSBjYXNlIHRoYXQgd29y
ayBpcyBzdWJtaXR0ZWQgdG8gYW4gdW5tYXBwZWQgcXVldWUsIE1FUyBtdXN0IGhhdmUgYQ0KPiA+
IEdBUlQgd3B0ciBhZGRyZXNzIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBxdWV1ZSBzaG91bGQg
YmUgbWFwcGVkLg0KPiA+DQo+ID4gVGhpcyBjaGFuZ2UgaXMgYWNjb21wYW5pZWQgd2l0aCBjaGFu
Z2VzIGluIE1FUyBhbmQgaXMgYXBwbGljYWJsZSBmb3INCj4gPiBNRVNfVkVSU0lPTiA+PSAzLg0K
PiA+DQo+ID4gdjI6DQo+ID4gLSBVcGRhdGUgTUVTX1ZFUlNJT04gY2hlY2sgZnJvbSAyIHRvIDMu
DQo+ID4gdjM6DQo+ID4gLSBVc2UgYW1kZ3B1X3ZtX2JvX2xvb2t1cF9tYXBwaW5nIGZvciB3cHRy
X2JvIG1hcHBpbmcgbG9va3VwDQo+ID4gLSBNb3ZlIHdwdHJfYm8gcmVmY291bnQgaW5jcmVtZW50
IHRvDQo+IGFtZGdwdV9hbWRrZmRfbWFwX2d0dF9ib190b19nYXJ0DQo+ID4gLSBSZW1vdmUgbGlz
dF9kZWxfaW5pdCBmcm9tIGFtZGdwdV9hbWRrZmRfbWFwX2d0dF9ib190b19nYXJ0DQo+ID4gLSBD
bGVhbnVwL2ZpeCBjcmVhdGVfcXVldWUgd3B0cl9ibyBlcnJvciBoYW5kbGluZw0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogR3JhaGFtIFNpZGVyIDxHcmFoYW0uU2lkZXJAYW1kLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCAgICB8
ICAxICsNCj4gPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
ICB8IDQ5DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICB8IDM3ICsrKysrKysrKysrKystDQo+ID4gICAuLi4v
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAgOSArKystDQo+ID4g
ICAuLi4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTEuYyAgfCAgMiArDQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAgICAgICAgfCAgMyAr
Kw0KPiA+ICAgLi4uL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jICAgIHwg
MTcgKysrKystLQ0KPiA+ICAgNyBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmQuaA0KPiA+IGluZGV4IDQyOWIxNmJhMTBiZi4uZGJhMjZkMWUzYmU5IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KPiA+
IEBAIC0zMDEsNiArMzAxLDcgQEAgaW50DQo+IGFtZGdwdV9hbWRrZmRfZ3B1dm1fbWFwX2d0dF9i
b190b19rZXJuZWwoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYsDQo+ID4gICAJCXN0cnVj
dCBrZ2RfbWVtICptZW0sIHZvaWQgKiprcHRyLCB1aW50NjRfdCAqc2l6ZSk7DQo+ID4gICB2b2lk
IGFtZGdwdV9hbWRrZmRfZ3B1dm1fdW5tYXBfZ3R0X2JvX2Zyb21fa2VybmVsKHN0cnVjdA0KPiBh
bWRncHVfZGV2aWNlICphZGV2LA0KPiA+ICAgCQlzdHJ1Y3Qga2dkX21lbSAqbWVtKTsNCj4gPiAr
aW50IGFtZGdwdV9hbWRrZmRfbWFwX2d0dF9ib190b19nYXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LA0KPiA+ICtzdHJ1Y3QgYW1kZ3B1X2JvICpibyk7DQo+ID4NCj4gPiAgIGludCBhbWRn
cHVfYW1ka2ZkX2dwdXZtX3Jlc3RvcmVfcHJvY2Vzc19ib3Modm9pZCAqcHJvY2Vzc19pbmZvLA0K
PiA+ICAgCQkJCQkgICAgc3RydWN0IGRtYV9mZW5jZSAqKmVmKTsNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gPiBpbmRl
eCBlZmFiOTIzMDU2ZjQuLjg4OGQwODEyOGE5NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gPiBAQCAtMjAzMCw2
ICsyMDMwLDU1IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX3N5bmNfbWVtb3J5KA0KPiA+ICAg
CXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIGFtZGdwdV9hbWRr
ZmRfbWFwX2d0dF9ib190b19nYXJ0IC0gTWFwIEJPIHRvIEdBUlQgYW5kDQo+IGluY3JlbWVudA0K
PiA+ICtyZWZlcmVuY2UgY291bnQNCj4gPiArICogQGFkZXY6IERldmljZSB0byB3aGljaCBhbGxv
Y2F0ZWQgQk8gYmVsb25ncw0KPiA+ICsgKiBAYm86IEJ1ZmZlciBvYmplY3QgdG8gYmUgbWFwcGVk
DQo+ID4gKyAqDQo+ID4gKyAqIEJlZm9yZSByZXR1cm4sIGJvIHJlZmVyZW5jZSBjb3VudCBpcyBp
bmNyZW1lbnRlZC4gVG8gcmVsZWFzZSB0aGUNCj4gPiArcmVmZXJlbmNlIGFuZCB1bnBpbi8NCj4g
PiArICogdW5tYXAgdGhlIEJPLCBjYWxsIGFtZGdwdV9hbWRrZmRfZnJlZV9ndHRfbWVtLg0KPiA+
ICsgKi8NCj4gPiAraW50IGFtZGdwdV9hbWRrZmRfbWFwX2d0dF9ib190b19nYXJ0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LA0KPiA+ICtzdHJ1Y3QgYW1kZ3B1X2JvICpibykgew0KPiA+ICsJ
aW50IHJldDsNCj4gPiArDQo+ID4gKwlyZXQgPSBhbWRncHVfYm9fcmVzZXJ2ZShibywgdHJ1ZSk7
DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJcHJfZXJyKCJGYWlsZWQgdG8gcmVzZXJ2ZSBiby4g
cmV0ICVkXG4iLCByZXQpOw0KPiA+ICsJCWdvdG8gZXJyX3Jlc2VydmVfYm9fZmFpbGVkOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCXJldCA9IGFtZGdwdV9ib19waW4oYm8sIEFNREdQVV9HRU1fRE9N
QUlOX0dUVCk7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJcHJfZXJyKCJGYWlsZWQgdG8gcGlu
IGJvLiByZXQgJWRcbiIsIHJldCk7DQo+ID4gKwkJZ290byBlcnJfcGluX2JvX2ZhaWxlZDsNCj4g
PiArCX0NCj4gDQo+IA0KPiBPaCEgSXMgdGhhdCBzb21ldGhpbmcgd2UgZG8gZm9yIGV2ZXJ5IE1R
RD8gV2hlbiB5ZXMgdGhhdCBoZXJlIGlzIHByZXR0eQ0KPiBtdWNoIGEgTkFLLg0KPiANCj4gV2Ug
Y2FuJ3QgZG8gdGhpcyBvciBjcmVhdGUgYSB0cml2aWFsIGRlbnkgb2Ygc2VydmljZSBhdHRhY2sg
YWdhaW5zdCB0aGUga2VybmVsDQo+IGRyaXZlci4NCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlh
bi4NCj4gDQoNCkhpIENocmlzdGlhbiwgY291bGQgeW91IGVsYWJvcmF0ZSBvbiB0aGlzPyBSaWdo
dCBub3cgdGhpcyBpcyBvbmx5IGJlaW5nIHVzZWQgdG8gcGluIHRoZSBxdWV1ZSB3cHRyIEJPLg0K
DQpCZXN0LA0KR3JhaGFtDQoNCj4gPiArDQo+ID4gKwlyZXQgPSBhbWRncHVfdHRtX2FsbG9jX2dh
cnQoJmJvLT50Ym8pOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCXByX2VycigiRmFpbGVkIHRv
IGJpbmQgYm8gdG8gR0FSVC4gcmV0ICVkXG4iLCByZXQpOw0KPiA+ICsJCWdvdG8gZXJyX21hcF9i
b19nYXJ0X2ZhaWxlZDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlhbWRncHVfYW1ka2ZkX3JlbW92
ZV9ldmljdGlvbl9mZW5jZSgNCj4gPiArCQlibywgYm8tPmtmZF9iby0+cHJvY2Vzc19pbmZvLT5l
dmljdGlvbl9mZW5jZSk7DQo+ID4gKwlsaXN0X2RlbF9pbml0KCZiby0+a2ZkX2JvLT52YWxpZGF0
ZV9saXN0LmhlYWQpOw0KPiA+ICsNCj4gPiArCWFtZGdwdV9ib191bnJlc2VydmUoYm8pOw0KPiA+
ICsNCj4gPiArCWJvID0gYW1kZ3B1X2JvX3JlZihibyk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7
DQo+ID4gKw0KPiA+ICtlcnJfbWFwX2JvX2dhcnRfZmFpbGVkOg0KPiA+ICsJYW1kZ3B1X2JvX3Vu
cGluKGJvKTsNCj4gPiArZXJyX3Bpbl9ib19mYWlsZWQ6DQo+ID4gKwlhbWRncHVfYm9fdW5yZXNl
cnZlKGJvKTsNCj4gPiArZXJyX3Jlc2VydmVfYm9fZmFpbGVkOg0KPiA+ICsNCj4gPiArCXJldHVy
biByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gICBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9tYXBf
Z3R0X2JvX3RvX2tlcm5lbChzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiAgIAkJ
c3RydWN0IGtnZF9tZW0gKm1lbSwgdm9pZCAqKmtwdHIsIHVpbnQ2NF90ICpzaXplKQ0KPiA+ICAg
ew0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+ID4g
aW5kZXggZTk3NjZlMTY1YzM4Li4xNzg5ZWQ4Yjc5ZjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4gPiBAQCAtMjg5LDYgKzI4OSw3IEBAIHN0
YXRpYyBpbnQga2ZkX2lvY3RsX2NyZWF0ZV9xdWV1ZShzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+IHN0
cnVjdCBrZmRfcHJvY2VzcyAqcCwNCj4gPiAgIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpw
ZGQ7DQo+ID4gICAJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgcV9wcm9wZXJ0aWVzOw0KPiA+ICAg
CXVpbnQzMl90IGRvb3JiZWxsX29mZnNldF9pbl9wcm9jZXNzID0gMDsNCj4gPiArCXN0cnVjdCBh
bWRncHVfYm8gKndwdHJfYm8gPSBOVUxMOw0KPiA+DQo+ID4gICAJbWVtc2V0KCZxX3Byb3BlcnRp
ZXMsIDAsIHNpemVvZihzdHJ1Y3QgcXVldWVfcHJvcGVydGllcykpOw0KPiA+DQo+ID4gQEAgLTMx
NiwxMiArMzE3LDQxIEBAIHN0YXRpYyBpbnQga2ZkX2lvY3RsX2NyZWF0ZV9xdWV1ZShzdHJ1Y3Qg
ZmlsZQ0KPiAqZmlsZXAsIHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwNCj4gPiAgIAkJZ290byBlcnJf
YmluZF9wcm9jZXNzOw0KPiA+ICAgCX0NCj4gPg0KPiA+ICsJLyogU3RhcnRpbmcgd2l0aCBHRlgx
MSwgd3B0ciBCT3MgbXVzdCBiZSBtYXBwZWQgdG8gR0FSVCBmb3IgTUVTDQo+IHRvIGRldGVybWlu
ZSB3b3JrDQo+ID4gKwkgKiBvbiB1bm1hcHBlZCBxdWV1ZXMgZm9yIHVzZXJtb2RlIHF1ZXVlIG92
ZXJzdWJzY3JpcHRpb24gKG5vDQo+IGFnZ3JlZ2F0ZWQgZG9vcmJlbGwpDQo+ID4gKwkgKi8NCj4g
PiArCWlmIChkZXYtPnNoYXJlZF9yZXNvdXJjZXMuZW5hYmxlX21lcyAmJiAoZGV2LT5hZGV2LQ0K
PiA+bWVzLnNjaGVkX3ZlcnNpb24gJiAweGZmKSA+PSAzKSB7DQo+ID4gKwkJc3RydWN0IGFtZGdw
dV9ib192YV9tYXBwaW5nICp3cHRyX21hcHBpbmc7DQo+ID4gKwkJc3RydWN0IGFtZGdwdV92bSAq
d3B0cl92bTsNCj4gPiArDQo+ID4gKwkJd3B0cl92bSA9IGRybV9wcml2X3RvX3ZtKHBkZC0+ZHJt
X3ByaXYpOw0KPiA+ICsJCWVyciA9IGFtZGdwdV9ib19yZXNlcnZlKHdwdHJfdm0tPnJvb3QuYm8s
IGZhbHNlKTsNCj4gPiArCQlpZiAoZXJyKQ0KPiA+ICsJCQlnb3RvIGVycl93cHRyX21hcF9nYXJ0
Ow0KPiA+ICsNCj4gPiArCQl3cHRyX21hcHBpbmcgPSBhbWRncHVfdm1fYm9fbG9va3VwX21hcHBp
bmcoDQo+ID4gKwkJCQl3cHRyX3ZtLCBhcmdzLT53cml0ZV9wb2ludGVyX2FkZHJlc3MgPj4NCj4g
UEFHRV9TSElGVCk7DQo+ID4gKwkJYW1kZ3B1X2JvX3VucmVzZXJ2ZSh3cHRyX3ZtLT5yb290LmJv
KTsNCj4gPiArCQlpZiAoIXdwdHJfbWFwcGluZykgew0KPiA+ICsJCQlwcl9lcnIoIkZhaWxlZCB0
byBsb29rdXAgd3B0ciBib1xuIik7DQo+ID4gKwkJCWVyciA9IC1FSU5WQUw7DQo+ID4gKwkJCWdv
dG8gZXJyX3dwdHJfbWFwX2dhcnQ7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQl3cHRyX2JvID0g
d3B0cl9tYXBwaW5nLT5ib192YS0+YmFzZS5ibzsNCj4gPiArCQllcnIgPSBhbWRncHVfYW1ka2Zk
X21hcF9ndHRfYm9fdG9fZ2FydChkZXYtPmFkZXYsDQo+IHdwdHJfYm8pOw0KPiA+ICsJCWlmIChl
cnIpIHsNCj4gPiArCQkJcHJfZXJyKCJGYWlsZWQgdG8gbWFwIHdwdHIgYm8gdG8gR0FSVFxuIik7
DQo+ID4gKwkJCWdvdG8gZXJyX3dwdHJfbWFwX2dhcnQ7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiAgIAlwcl9kZWJ1ZygiQ3JlYXRpbmcgcXVldWUgZm9yIFBBU0lEIDB4JXggb24gZ3B1
IDB4JXhcbiIsDQo+ID4gICAJCQlwLT5wYXNpZCwNCj4gPiAgIAkJCWRldi0+aWQpOw0KPiA+DQo+
ID4gLQllcnIgPSBwcW1fY3JlYXRlX3F1ZXVlKCZwLT5wcW0sIGRldiwgZmlsZXAsICZxX3Byb3Bl
cnRpZXMsDQo+ICZxdWV1ZV9pZCwgTlVMTCwgTlVMTCwgTlVMTCwNCj4gPiAtCQkJJmRvb3JiZWxs
X29mZnNldF9pbl9wcm9jZXNzKTsNCj4gPiArCWVyciA9IHBxbV9jcmVhdGVfcXVldWUoJnAtPnBx
bSwgZGV2LCBmaWxlcCwgJnFfcHJvcGVydGllcywNCj4gJnF1ZXVlX2lkLCB3cHRyX2JvLA0KPiA+
ICsJCQlOVUxMLCBOVUxMLCBOVUxMLCAmZG9vcmJlbGxfb2Zmc2V0X2luX3Byb2Nlc3MpOw0KPiA+
ICAgCWlmIChlcnIgIT0gMCkNCj4gPiAgIAkJZ290byBlcnJfY3JlYXRlX3F1ZXVlOw0KPiA+DQo+
ID4gQEAgLTM1NCw2ICszODQsOSBAQCBzdGF0aWMgaW50IGtmZF9pb2N0bF9jcmVhdGVfcXVldWUo
c3RydWN0IGZpbGUgKmZpbGVwLA0KPiBzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsDQo+ID4gICAJcmV0
dXJuIDA7DQo+ID4NCj4gPiAgIGVycl9jcmVhdGVfcXVldWU6DQo+ID4gKwlpZiAod3B0cl9ibykN
Cj4gPiArCQlhbWRncHVfYW1ka2ZkX2ZyZWVfZ3R0X21lbShkZXYtPmFkZXYsIHdwdHJfYm8pOw0K
PiA+ICtlcnJfd3B0cl9tYXBfZ2FydDoNCj4gPiAgIGVycl9iaW5kX3Byb2Nlc3M6DQo+ID4gICBl
cnJfcGRkOg0KPiA+ICAgCW11dGV4X3VubG9jaygmcC0+bXV0ZXgpOw0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMNCj4gPiBpbmRleCBiMzlkODljNTI4ODcuLmQ4ZGUyZmJkZmM3ZCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5jDQo+ID4gQEAgLTIwOCw2ICsyMDgsNyBAQCBzdGF0aWMgaW50IGFkZF9xdWV1ZV9tZXMo
c3RydWN0DQo+IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVjdCBxdWV1ZSAqcSwNCj4g
PiAgIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQgPSBxcGRfdG9fcGRkKHFwZCk7DQo+
ID4gICAJc3RydWN0IG1lc19hZGRfcXVldWVfaW5wdXQgcXVldWVfaW5wdXQ7DQo+ID4gICAJaW50
IHIsIHF1ZXVlX3R5cGU7DQo+ID4gKwl1aW50NjRfdCB3cHRyX2FkZHJfb2ZmOw0KPiA+DQo+ID4g
ICAJaWYgKGRxbS0+aXNfaHdzX2hhbmcpDQo+ID4gICAJCXJldHVybiAtRUlPOw0KPiA+IEBAIC0y
MjcsNyArMjI4LDEzIEBAIHN0YXRpYyBpbnQgYWRkX3F1ZXVlX21lcyhzdHJ1Y3QNCj4gZGV2aWNl
X3F1ZXVlX21hbmFnZXIgKmRxbSwgc3RydWN0IHF1ZXVlICpxLA0KPiA+DQo+IAlBTURHUFVfTUVT
X1BSSU9SSVRZX0xFVkVMX05PUk1BTDsNCj4gPiAgIAlxdWV1ZV9pbnB1dC5kb29yYmVsbF9vZmZz
ZXQgPSBxLT5wcm9wZXJ0aWVzLmRvb3JiZWxsX29mZjsNCj4gPiAgIAlxdWV1ZV9pbnB1dC5tcWRf
YWRkciA9IHEtPmdhcnRfbXFkX2FkZHI7DQo+ID4gLQlxdWV1ZV9pbnB1dC53cHRyX2FkZHIgPSAo
dWludDY0X3QpcS0+cHJvcGVydGllcy53cml0ZV9wdHI7DQo+ID4gKw0KPiA+ICsJaWYgKHEtPndw
dHJfYm8pIHsNCj4gPiArCQl3cHRyX2FkZHJfb2ZmID0gKHVpbnQ2NF90KXEtPnByb3BlcnRpZXMu
d3JpdGVfcHRyIC0NCj4gKHVpbnQ2NF90KXEtPndwdHJfYm8tPmtmZF9iby0+dmE7DQo+ID4gKwkJ
cXVldWVfaW5wdXQud3B0cl9hZGRyID0gKCh1aW50NjRfdClxLT53cHRyX2JvLQ0KPiA+dGJvLnJl
c291cmNlLT5zdGFydCA8PCBQQUdFX1NISUZUKSArIHdwdHJfYWRkcl9vZmY7DQo+ID4gKwl9IGVs
c2UNCj4gPiArCQlxdWV1ZV9pbnB1dC53cHRyX2FkZHIgPSAodWludDY0X3QpcS0NCj4gPnByb3Bl
cnRpZXMud3JpdGVfcHRyOw0KPiA+ICsNCj4gPiAgIAlxdWV1ZV9pbnB1dC5wYWdpbmcgPSBmYWxz
ZTsNCj4gPiAgIAlxdWV1ZV9pbnB1dC50YmFfYWRkciA9IHFwZC0+dGJhX2FkZHI7DQo+ID4gICAJ
cXVldWVfaW5wdXQudG1hX2FkZHIgPSBxcGQtPnRtYV9hZGRyOyBkaWZmIC0tZ2l0DQo+ID4gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjExLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTEuYw0KPiA+IGluZGV4
IGYxNjU0YjRkYTg1Ni4uMzVlNzRiZGQ4MWRhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTEuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTEuYw0KPiA+IEBAIC0zNzcsNiAr
Mzc3LDggQEAgc3RhdGljIHZvaWQgdXBkYXRlX21xZF9zZG1hKHN0cnVjdCBtcWRfbWFuYWdlcg0K
PiAqbW0sIHZvaWQgKm1xZCwNCj4gPiAgIAltLT5zZG1heF9ybGN4X3JiX2Jhc2VfaGkgPSB1cHBl
cl8zMl9iaXRzKHEtPnF1ZXVlX2FkZHJlc3MgPj4NCj4gOCk7DQo+ID4gICAJbS0+c2RtYXhfcmxj
eF9yYl9ycHRyX2FkZHJfbG8gPSBsb3dlcl8zMl9iaXRzKCh1aW50NjRfdClxLQ0KPiA+cmVhZF9w
dHIpOw0KPiA+ICAgCW0tPnNkbWF4X3JsY3hfcmJfcnB0cl9hZGRyX2hpID0NCj4gPiB1cHBlcl8z
Ml9iaXRzKCh1aW50NjRfdClxLT5yZWFkX3B0cik7DQo+ID4gKwltLT5zZG1heF9ybGN4X3JiX3dw
dHJfcG9sbF9hZGRyX2xvID0gbG93ZXJfMzJfYml0cygodWludDY0X3QpcS0NCj4gPndyaXRlX3B0
cik7DQo+ID4gKwltLT5zZG1heF9ybGN4X3JiX3dwdHJfcG9sbF9hZGRyX2hpID0NCj4gPiArdXBw
ZXJfMzJfYml0cygodWludDY0X3QpcS0+d3JpdGVfcHRyKTsNCj4gPiAgIAltLT5zZG1heF9ybGN4
X2Rvb3JiZWxsX29mZnNldCA9DQo+ID4gICAJCXEtPmRvb3JiZWxsX29mZiA8PA0KPiBTRE1BMF9R
VUVVRTBfRE9PUkJFTExfT0ZGU0VUX19PRkZTRVRfX1NISUZUOw0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gPiBpbmRleCBhNWQzOTYzNTM3ZDcuLmRj
ZGRlZTBkNmYwNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfcHJpdi5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYu
aA0KPiA+IEBAIC02MzksNiArNjM5LDggQEAgc3RydWN0IHF1ZXVlIHsNCj4gPiAgIAl2b2lkICpn
YW5nX2N0eF9ibzsNCj4gPiAgIAl1aW50NjRfdCBnYW5nX2N0eF9ncHVfYWRkcjsNCj4gPiAgIAl2
b2lkICpnYW5nX2N0eF9jcHVfcHRyOw0KPiA+ICsNCj4gPiArCXN0cnVjdCBhbWRncHVfYm8gKndw
dHJfYm87DQo+ID4gICB9Ow0KPiA+DQo+ID4gICBlbnVtIEtGRF9NUURfVFlQRSB7DQo+ID4gQEAg
LTE0MDQsNiArMTQwNiw3IEBAIGludCBwcW1fY3JlYXRlX3F1ZXVlKHN0cnVjdA0KPiBwcm9jZXNz
X3F1ZXVlX21hbmFnZXIgKnBxbSwNCj4gPiAgIAkJCSAgICBzdHJ1Y3QgZmlsZSAqZiwNCj4gPiAg
IAkJCSAgICBzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyAqcHJvcGVydGllcywNCj4gPiAgIAkJCSAg
ICB1bnNpZ25lZCBpbnQgKnFpZCwNCj4gPiArCQkJICAgIHN0cnVjdCBhbWRncHVfYm8gKndwdHJf
Ym8sDQo+ID4gICAJCQkgICAgY29uc3Qgc3RydWN0IGtmZF9jcml1X3F1ZXVlX3ByaXZfZGF0YSAq
cV9kYXRhLA0KPiA+ICAgCQkJICAgIGNvbnN0IHZvaWQgKnJlc3RvcmVfbXFkLA0KPiA+ICAgCQkJ
ICAgIGNvbnN0IHZvaWQgKnJlc3RvcmVfY3RsX3N0YWNrLCBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0K
PiA+IGluZGV4IGY5OWUwOWRjNDNlYS4uM2ExN2MxZWJjNTI3IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFn
ZXIuYw0KPiA+IEBAIC0xOTAsNyArMTkwLDggQEAgdm9pZCBwcW1fdW5pbml0KHN0cnVjdCBwcm9j
ZXNzX3F1ZXVlX21hbmFnZXINCj4gKnBxbSkNCj4gPiAgIHN0YXRpYyBpbnQgaW5pdF91c2VyX3F1
ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwNCj4gPiAgIAkJCQlzdHJ1Y3Qg
a2ZkX2RldiAqZGV2LCBzdHJ1Y3QgcXVldWUgKipxLA0KPiA+ICAgCQkJCXN0cnVjdCBxdWV1ZV9w
cm9wZXJ0aWVzICpxX3Byb3BlcnRpZXMsDQo+ID4gLQkJCQlzdHJ1Y3QgZmlsZSAqZiwgdW5zaWdu
ZWQgaW50IHFpZCkNCj4gPiArCQkJCXN0cnVjdCBmaWxlICpmLCBzdHJ1Y3QgYW1kZ3B1X2JvICp3
cHRyX2JvLA0KPiA+ICsJCQkJdW5zaWduZWQgaW50IHFpZCkNCj4gPiAgIHsNCj4gPiAgIAlpbnQg
cmV0dmFsOw0KPiA+DQo+ID4gQEAgLTIyMSw2ICsyMjIsNyBAQCBzdGF0aWMgaW50IGluaXRfdXNl
cl9xdWV1ZShzdHJ1Y3QNCj4gcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sDQo+ID4gICAJCQln
b3RvIGNsZWFudXA7DQo+ID4gICAJCX0NCj4gPiAgIAkJbWVtc2V0KCgqcSktPmdhbmdfY3R4X2Nw
dV9wdHIsIDAsDQo+IEFNREdQVV9NRVNfR0FOR19DVFhfU0laRSk7DQo+ID4gKwkJKCpxKS0+d3B0
cl9ibyA9IHdwdHJfYm87DQo+ID4gICAJfQ0KPiA+DQo+ID4gICAJcHJfZGVidWcoIlBRTSBBZnRl
ciBpbml0IHF1ZXVlIik7DQo+ID4gQEAgLTIzNyw2ICsyMzksNyBAQCBpbnQgcHFtX2NyZWF0ZV9x
dWV1ZShzdHJ1Y3QNCj4gcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sDQo+ID4gICAJCQkgICAg
c3RydWN0IGZpbGUgKmYsDQo+ID4gICAJCQkgICAgc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnBy
b3BlcnRpZXMsDQo+ID4gICAJCQkgICAgdW5zaWduZWQgaW50ICpxaWQsDQo+ID4gKwkJCSAgICBz
dHJ1Y3QgYW1kZ3B1X2JvICp3cHRyX2JvLA0KPiA+ICAgCQkJICAgIGNvbnN0IHN0cnVjdCBrZmRf
Y3JpdV9xdWV1ZV9wcml2X2RhdGEgKnFfZGF0YSwNCj4gPiAgIAkJCSAgICBjb25zdCB2b2lkICpy
ZXN0b3JlX21xZCwNCj4gPiAgIAkJCSAgICBjb25zdCB2b2lkICpyZXN0b3JlX2N0bF9zdGFjaywg
QEAgLTI5OSw3ICszMDIsNw0KPiBAQCBpbnQNCj4gPiBwcW1fY3JlYXRlX3F1ZXVlKHN0cnVjdCBw
cm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwNCj4gPiAgIAkJICogYWxsb2NhdGVfc2RtYV9xdWV1
ZSgpIGluIGNyZWF0ZV9xdWV1ZSgpIGhhcyB0aGUNCj4gPiAgIAkJICogY29ycmVzcG9uZGluZyBj
aGVjayBsb2dpYy4NCj4gPiAgIAkJICovDQo+ID4gLQkJcmV0dmFsID0gaW5pdF91c2VyX3F1ZXVl
KHBxbSwgZGV2LCAmcSwgcHJvcGVydGllcywgZiwgKnFpZCk7DQo+ID4gKwkJcmV0dmFsID0gaW5p
dF91c2VyX3F1ZXVlKHBxbSwgZGV2LCAmcSwgcHJvcGVydGllcywgZiwNCj4gd3B0cl9ibywNCj4g
PiArKnFpZCk7DQo+ID4gICAJCWlmIChyZXR2YWwgIT0gMCkNCj4gPiAgIAkJCWdvdG8gZXJyX2Ny
ZWF0ZV9xdWV1ZTsNCj4gPiAgIAkJcHFuLT5xID0gcTsNCj4gPiBAQCAtMzIwLDcgKzMyMyw3IEBA
IGludCBwcW1fY3JlYXRlX3F1ZXVlKHN0cnVjdA0KPiBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBx
bSwNCj4gPiAgIAkJCWdvdG8gZXJyX2NyZWF0ZV9xdWV1ZTsNCj4gPiAgIAkJfQ0KPiA+DQo+ID4g
LQkJcmV0dmFsID0gaW5pdF91c2VyX3F1ZXVlKHBxbSwgZGV2LCAmcSwgcHJvcGVydGllcywgZiwg
KnFpZCk7DQo+ID4gKwkJcmV0dmFsID0gaW5pdF91c2VyX3F1ZXVlKHBxbSwgZGV2LCAmcSwgcHJv
cGVydGllcywgZiwNCj4gd3B0cl9ibywNCj4gPiArKnFpZCk7DQo+ID4gICAJCWlmIChyZXR2YWwg
IT0gMCkNCj4gPiAgIAkJCWdvdG8gZXJyX2NyZWF0ZV9xdWV1ZTsNCj4gPiAgIAkJcHFuLT5xID0g
cTsNCj4gPiBAQCAtNDU3LDkgKzQ2MCwxMyBAQCBpbnQgcHFtX2Rlc3Ryb3lfcXVldWUoc3RydWN0
DQo+IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkKQ0KPiA+ICAg
CQkJcGRkLT5xcGQubnVtX2d3cyA9IDA7DQo+ID4gICAJCX0NCj4gPg0KPiA+IC0JCWlmIChkZXYt
PnNoYXJlZF9yZXNvdXJjZXMuZW5hYmxlX21lcykNCj4gPiArCQlpZiAoZGV2LT5zaGFyZWRfcmVz
b3VyY2VzLmVuYWJsZV9tZXMpIHsNCj4gPiAgIAkJCWFtZGdwdV9hbWRrZmRfZnJlZV9ndHRfbWVt
KGRldi0+YWRldiwNCj4gPiAgIAkJCQkJCSAgIHBxbi0+cS0+Z2FuZ19jdHhfYm8pOw0KPiA+ICsJ
CQlpZiAocHFuLT5xLT53cHRyX2JvKQ0KPiA+ICsJCQkJYW1kZ3B1X2FtZGtmZF9mcmVlX2d0dF9t
ZW0oZGV2LQ0KPiA+YWRldiwgcHFuLT5xLT53cHRyX2JvKTsNCj4gPiArDQo+ID4gKwkJfQ0KPiA+
ICAgCQl1bmluaXRfcXVldWUocHFuLT5xKTsNCj4gPiAgIAl9DQo+ID4NCj4gPiBAQCAtOTAwLDcg
KzkwNyw3IEBAIGludCBrZmRfY3JpdV9yZXN0b3JlX3F1ZXVlKHN0cnVjdCBrZmRfcHJvY2VzcyAq
cCwNCj4gPg0KPiA+ICAgCXByaW50X3F1ZXVlX3Byb3BlcnRpZXMoJnFwKTsNCj4gPg0KPiA+IC0J
cmV0ID0gcHFtX2NyZWF0ZV9xdWV1ZSgmcC0+cHFtLCBwZGQtPmRldiwgTlVMTCwgJnFwLA0KPiAm
cXVldWVfaWQsIHFfZGF0YSwgbXFkLCBjdGxfc3RhY2ssDQo+ID4gKwlyZXQgPSBwcW1fY3JlYXRl
X3F1ZXVlKCZwLT5wcW0sIHBkZC0+ZGV2LCBOVUxMLCAmcXAsDQo+ICZxdWV1ZV9pZCwNCj4gPiAr
TlVMTCwgcV9kYXRhLCBtcWQsIGN0bF9zdGFjaywNCj4gPiAgIAkJCQlOVUxMKTsNCj4gPiAgIAlp
ZiAocmV0KSB7DQo+ID4gICAJCXByX2VycigiRmFpbGVkIHRvIGNyZWF0ZSBuZXcgcXVldWUgZXJy
OiVkXG4iLCByZXQpOw0K
