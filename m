Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77B80F8D0
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Dec 2023 22:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C7210E6C4;
	Tue, 12 Dec 2023 21:00:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B904210E6C3
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Dec 2023 21:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ia9+jehK23eqT2qs9Al6iqJA9O1LsPUdDrjVt/UkxqelzioBFcVJO+YMRrlQbmVaUpWwpxyPltJWzfTf1pE49yUfG13lunw3dt9CW7S9SqmO1Dq+JuQqrE0ePRn0Q3gP/WQx//G+iGJxXN0WhyE2SSb0K+ZFEo7JGSHtY7ACXqPH6z9JEwTDwoOmbIqBprtXa/F/qh7GFaUKK4oa/o9IvYnVh1l4hwpgtxGNYSUeLyLMnbppedRic1taPOudSOWPSX9LPSy27J3E8sFhxwh1IZfIr7lfDLIa3nDmet8508g0f1QOka6+G9dtZOAGMBNCuLMWlrUh56VVORLZO9zLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHOp6HuXvvE2iggaWbfIo7jtqp1+/RvjgUJ4QyPffsk=;
 b=argDmc2Otz7Bruc8sGh7jO1v94v663P/vbuo0lgnSaZgLhha86/tDxhqS+60Y635mq5VqUx7tvlMwf6N35AwKLwl3sma/R1UN57wD9QixXN+kHF1bt3u5gU7nMJ4x9OhOZ4zRyomgZWEfri2D3pyqBx55s1OdGQmCyfpctonYAkTv3WsZiH1oFaDDs2+EvebWNXtha+Y1S1K5TTwKjzaZJUC1E1p+j4RrhzG+SK0OsyDKAFQA2Ik4358fJqqRNYG/F63wV6cRP2ob5IiUCe/jyrQu+4EddiaIBaOX0h0MjW4fyNhPPbc4eT8J9LnAGcTEYuGhRipd2IMR7bNiiPaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHOp6HuXvvE2iggaWbfIo7jtqp1+/RvjgUJ4QyPffsk=;
 b=SVJ+WtIAw6whChy+h3AWuIqF6zqySB5BrkjkghlBQi+7EAle55AnztdWHWNGRcSkej9Fu4iGC7C1DREstX1SG1ZtRy+kNM5JaY5S82yKkRpO22XnkkGksPIgzyvPBYSEnVdQ38+HZjCuLJoVcdnRi3MIDxQOoUwf/Z10ZD0Zlso=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 21:00:19 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::28b7:3ee9:2c4b:6ae]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::28b7:3ee9:2c4b:6ae%7]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 21:00:19 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>, "Kim, Jonathan"
 <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process management
Thread-Topic: [PATCH] drm/amdkfd: fix mes set shader debugger process
 management
Thread-Index: AQHaLHdTu1pi6XN9kEyuJkcz/NdpHLCl7iQAgAAzU6A=
Date: Tue, 12 Dec 2023 21:00:18 +0000
Message-ID: <CH0PR12MB5372AA024278ED7F7F078EEFF48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20231211211612.3109-1-Jonathan.Kim@amd.com>
 <c4fc2b14-07b1-4b27-b460-166dcb343d74@amd.com>
In-Reply-To: <c4fc2b14-07b1-4b27-b460-166dcb343d74@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=94bb03f2-2413-4bea-819e-0278552fb0f4;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-12-12T20:53:03Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5372:EE_|PH0PR12MB8800:EE_
x-ms-office365-filtering-correlation-id: c45f8dba-c1bb-4add-3c36-08dbfb555931
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mL75bGnCsjBY6zO9J+csZRLqb1AKNY9jPHTJhW3zvmfc0NmgzKmYmtzEQu7f2nhnLpSrPxkqFBsX+bJwVqzbrBI9+dtwZmPlkdhGPfXP2gHNG7Z9vzfqQJqSYwjzemu0wuPT9fu4kcsbrb8W2zVQ2r/kEDRA5rsF3SB6Mwb5aEkHTKEMig1iw7h5oZzsrF6vi5trZlzHt8D421uO52rjPSsUbPMed5ppI51tbOMjEzG+5x92nCA2ONsdd4FVVOWH/YAoFocDdtV90JHydcHeXiPKvHprnN4pHTkuW7Xt28ouenkmK1kBf8YAd7GI6Q50BpuQNPhW+egIe6k1F8VTRF+sS7iitt4ASjXNaJmp8ekdxvo9FxvnfNRMPzl0SLR1Ii6LCgxA2Qh43ExBAy0ijiDPPZLXUK1ifGu7+bBxEffV0lpkO3fIsPK+1P6IsadbYO75QKzsKEpfrEoTEWEY3oDhyA1ocuiBeJ8g6OcJ/SDiNF6FWEg0aNvDZvukPWQinrCxUpjyxjMQ4+6R73MhYgdKAF1Gn1Ti6COqIrT1bG3gceoSnH6bR+qDXAKtx/CriksnaEpGSl5n1ptqC6pUP0uLJZ9N5U3SHhTuqGXAxmV+Qke3tcBy2YriJeaj6s8I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(53546011)(6506007)(7696005)(478600001)(71200400001)(55016003)(316002)(66446008)(66556008)(64756008)(66946007)(66476007)(8676002)(54906003)(4326008)(86362001)(52536014)(76116006)(33656002)(38100700002)(122000001)(8936002)(83380400001)(26005)(110136005)(38070700009)(5660300002)(41300700001)(2906002)(4001150100001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGhYdGRNMWdHYWhhZjl4UHUyS0FBWVFOMjc0VnJFMGJ5aHpDWmJWT1JoMGxQ?=
 =?utf-8?B?OGlCU1o5bWJKdTFaOCs2ZldtdmVtMTNPZkFxOWJYZktFcThuSXBOWjVGcHJ5?=
 =?utf-8?B?bzhjTkZHRnl0dnFRVW54a0JZYS9TUGM2aXNpUGRuUC9Cb3dzdlFwOXZadTR0?=
 =?utf-8?B?c2cxa3Rlb2dmN1VSYXBkeGE5Myt6S2s5N1BlRmxTUmdCYjExSyswUEZhai9P?=
 =?utf-8?B?RExMejhxd1BpMjR4SDd3bFBOWDBaOER3VEhQa1VvQ01JU2ZDSHNqV2krMUpv?=
 =?utf-8?B?Y2pVSmVOYVg2UjhmY3NPMzRQYWJ4V0RlRUl5cEtGaTNXYXFYUy92WVJUclpM?=
 =?utf-8?B?VzJ1R2FLeXVQSHRwL1R5U29OTWNRUUFjaldIakxSRFpoMDFML2tTNUdyM2c5?=
 =?utf-8?B?TmMrNGtmZXRzdERGMHFTZUozVm1rMU1kOVhVbnJzbE1BT21TUm9LaE1yT0Mr?=
 =?utf-8?B?WHRnUEpCZjR4NkY3R211RUpMcnFXQ0tDWjdrek83ZU9vZ0NpTlpDRkZkNnBS?=
 =?utf-8?B?WXpOK1FsRUd6NXcwd0k0K2RCTUpsL3Yyckp1aWNEVU9VKzJoTXlKNmR2VTVp?=
 =?utf-8?B?dTlxVDZrRHJLN3JOUGt6Zk9RQkdpR0RtTWVpVEYwemhmM2ZSV3JHWnl6N0Q4?=
 =?utf-8?B?T2xaR2I1T3dUQ0tnNmxqU3dQSUwrYmNrZnM2cVdjQkZCUDZ0cnhkcThlSm9O?=
 =?utf-8?B?bVhDa3o2SnpFYUFDWXgvRlJEN0JyNVZrL3pMczhhT3p6UStpcWUxZGxOWFFL?=
 =?utf-8?B?V0pFL2RKMWN0Z0FqYXN6YVZvN1liUVFTdGFWR2dPL2N3eTVodUsrUzBWZUJ5?=
 =?utf-8?B?L3FIb2lVUXprMzVkYnR3VEhPWXVWMndwOXVrVUtOVWl1WDg5OHJPSGcyZ1FN?=
 =?utf-8?B?MGI0NWVMTS85WFArcFBaTEQxVkZNWXdkYUxpSjh0YndhWTBKU3V2eTFxZzM0?=
 =?utf-8?B?ZnJucW92S0tvdVlJUUl2dTN4Q2FiVDgvYWJGd2FGbGZHd0dnQUhnODhPMTZH?=
 =?utf-8?B?V01DS2h4ZC92aWlOV0dxTXVmMUgvakQ1Qkd5am1uVGJib3VxY2tLVW1uc0JY?=
 =?utf-8?B?OTJPUGZaUzR3Q0xENXBHcnBRbW9Jc3lLTUU1NWdOS1BNNmZwQVdZWnRYcEND?=
 =?utf-8?B?VDRnbytOb3Yyckc0SWFQNzVkQkcvSVg4VVg2aWNCdXA5TVMxWUxZVGlpY201?=
 =?utf-8?B?c3ZzUkRlN3ZoL2NGN2tUSzFZYVdURWQ2QXl6T3NPUGtveDhONFl5ZzMzZ01T?=
 =?utf-8?B?WjBKUzRwTXpWdFd6c3EzeG5Ldlc3U3M1K05YZHY0c1MyVUV5ekd0dkJ3YmZ5?=
 =?utf-8?B?N2FzMU02TTZ4cUFmTXlYRndJZW00NEFSVCtrYWc2ajRFMEY4ZlFWdEd3N05P?=
 =?utf-8?B?RlBkYjhzMVlqNUdqRk9aNTc4OHhGZ0tMSmtsV3hwM0g4LzVJRXhGdEk2ZjNN?=
 =?utf-8?B?V1M4dC9TeGdNSHk1WHRHdEVVLy8wbGZIMXlVamx2dGxid3dMSE8vU0pjNlZs?=
 =?utf-8?B?aVpiQW4yK05ndndBSWQ5eTY5VU5qQVJvOUY5QVNKYlkrczBZenJWU0tSQzRB?=
 =?utf-8?B?eGMrb1VTNHBXNzU3VXdWZ2lEa09aMktqWVJORWZkU0dNTzdpUE5GYWo1ckFy?=
 =?utf-8?B?c25TLzNOcmVvaEhsTVdzU3VTUjBUaTN4OGRWTUdjMGVickFYQmw4RFZhVi9n?=
 =?utf-8?B?ZjVWNUJOQmtZSUNMY3YzQ3NhZ2NIY0MzZWRXcFJET0RoaWRrTG5FRWIxRlNk?=
 =?utf-8?B?ZE1TUEhNaGMwQnF6cVBPbUcwZjNjSnp0NnFlL0F6ekNQK0JaTHhOQUt6OWZ6?=
 =?utf-8?B?V0ZvM3poNUdteStUQXZJeWRvcVorRithMkFWR2lCaUw1c3VTQXJTNldmS01T?=
 =?utf-8?B?S0xqZCtQNnFwWmVPWENaVTJ6a29IVGphZXY3OG0vZWd4TWV3dFQ1ZFhSYTNx?=
 =?utf-8?B?R0ZRbVUwa2d4eFZGc3lwY2JQd0tpNUVpQjJaSU15WGhvb3krZmE1ZCtybGFX?=
 =?utf-8?B?TDZUNXpYdkFmMEt6TFNZS051S1R0b01TYWs4RlBNeU53TGdDNk50NFNYVnFt?=
 =?utf-8?B?bDNLdlNjNlZVSElwbFUvOVg5MDJTWEMvTHJ3SkZ5cUE3SWVwVDI4cTNOUGZj?=
 =?utf-8?Q?oPTA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45f8dba-c1bb-4add-3c36-08dbfb555931
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 21:00:18.9866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrVzv0dLJinH2DPuI6gs3G6euYJCe4W4viND9roHMH7iYl1Gzujr2qRzckzgRIr143PuqoSx0HXfnPee03BXbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
Cc: "Wong, Alice" <Shiwei.Wong@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkRvZXMgdGhpcyByZXF1aXJlcyB0
aGUgIG5ldyBNRVMgRlcgZm9yIHRoaXMgcHJvY2Vzc19jdHhfZmx1c2ggIHJlcXVpcmVtZW50ID8g
IENhbiBkcml2ZXIgc2lkZSBhZGQgbG9naWMgdG8gZ3VhcmFudHkgd2hlbiAgY2FsbCBTRVRfU0hB
REVSX0RFQlVHR0VSLCB0aGUgcHJvY2VzcyBhZGRyZXNzICBpcyBhbHdheXMgdmFsaWQgPw0KDQpS
ZWdhcmRzDQpTaGFveXVuLmxpdQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgRXJpYyBIdWFuZw0KU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMTIsIDIwMjMgMTI6NDkg
UE0NClRvOiBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT47IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogV29uZywgQWxpY2UgPFNoaXdlaS5Xb25nQGFtZC5jb20+
OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLYXNpdmlzd2FuYXRo
YW4sIEhhcmlzaCA8SGFyaXNoLkthc2l2aXN3YW5hdGhhbkBhbWQuY29tPg0KU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL2FtZGtmZDogZml4IG1lcyBzZXQgc2hhZGVyIGRlYnVnZ2VyIHByb2Nlc3Mg
bWFuYWdlbWVudA0KDQoNCk9uIDIwMjMtMTItMTEgMTY6MTYsIEpvbmF0aGFuIEtpbSB3cm90ZToN
Cj4gTUVTIHByb3ZpZGVzIHRoZSBkcml2ZXIgYSBjYWxsIHRvIGV4cGxpY2l0bHkgZmx1c2ggc3Rh
bGUgcHJvY2Vzcw0KPiBtZW1vcnkgd2l0aGluIHRoZSBNRVMgdG8gYXZvaWQgYSByYWNlIGNvbmRp
dGlvbiB0aGF0IHJlc3VsdHMgaW4gYQ0KPiBmYXRhbCBtZW1vcnkgdmlvbGF0aW9uLg0KPg0KPiBX
aGVuIFNFVF9TSEFERVJfREVCVUdHRVIgaXMgY2FsbGVkLCB0aGUgZHJpdmVyIHBhc3NlcyBhIG1l
bW9yeSBhZGRyZXNzDQo+IHRoYXQgcmVwcmVzZW50cyBhIHByb2Nlc3MgY29udGV4dCBhZGRyZXNz
IE1FUyB1c2VzIHRvIGtlZXAgdHJhY2sgb2YNCj4gZnV0dXJlIHBlci1wcm9jZXNzIGNhbGxzLg0K
Pg0KPiBOb3JtYWxseSwgTUVTIHdpbGwgcHVyZ2UgaXRzIHByb2Nlc3MgY29udGV4dCBsaXN0IHdo
ZW4gdGhlIGxhc3QgcXVldWUNCj4gaGFzIGJlZW4gcmVtb3ZlZC4gIFRoZSBkcml2ZXIsIGhvd2V2
ZXIsIGNhbiBjYWxsIFNFVF9TSEFERVJfREVCVUdHRVINCj4gcmVnYXJkbGVzcyBvZiB3aGV0aGVy
IGEgcXVldWUgaGFzIGJlZW4gYWRkZWQgb3Igbm90Lg0KPg0KPiBJZiBTRVRfU0hBREVSX0RFQlVH
R0VSIGhhcyBiZWVuIGNhbGxlZCB3aXRoIG5vIHF1ZXVlcyBhcyB0aGUgbGFzdCBjYWxsDQo+IHBy
aW9yIHRvIHByb2Nlc3MgdGVybWluYXRpb24sIHRoZSBwYXNzZWQgcHJvY2VzcyBjb250ZXh0IGFk
ZHJlc3Mgd2lsbA0KPiBzdGlsbCByZXNpZGUgd2l0aGluIE1FUy4NCj4NCj4gT24gYSBuZXcgcHJv
Y2VzcyBjYWxsIHRvIFNFVF9TSEFERVJfREVCVUdHRVIsIHRoZSBkcml2ZXIgbWF5IGVuZCB1cA0K
PiBwYXNzaW5nIGFuIGlkZW50aWNhbCBwcm9jZXNzIGNvbnRleHQgYWRkcmVzcyB2YWx1ZSAoYmFz
ZWQgb24NCj4gcGVyLXByb2Nlc3MgZ3B1IG1lbW9yeSBhZGRyZXNzKSB0byBNRVMgYnV0IGlzIG5v
dyBwb2ludGluZyB0byBhIG5ldw0KPiBhbGxvY2F0ZWQgYnVmZmVyIG9iamVjdCBkdXJpbmcgS0ZE
IHByb2Nlc3MgY3JlYXRpb24uICBTaW5jZSB0aGUgTUVTIGlzDQo+IHVuYXdhcmUgb2YgdGhpcywg
YWNjZXNzIG9mIHRoZSBwYXNzZWQgYWRkcmVzcyBwb2ludHMgdG8gdGhlIHN0YWxlDQo+IG9iamVj
dCB3aXRoaW4gTUVTIGFuZCB0cmlnZ2VycyBhIGZhdGFsIG1lbW9yeSB2aW9sYXRpb24uDQo+DQo+
IFRoZSBzb2x1dGlvbiBpcyBmb3IgS0ZEIHRvIGV4cGxpY2l0bHkgZmx1c2ggdGhlIHByb2Nlc3Mg
Y29udGV4dA0KPiBhZGRyZXNzIGZyb20gTUVTIG9uIHByb2Nlc3MgdGVybWluYXRpb24uDQo+DQo+
IE5vdGUgdGhhdCB0aGUgZmx1c2ggY2FsbCBhbmQgdGhlIE1FUyBkZWJ1Z2dlciBjYWxscyB1c2Ug
dGhlIHNhbWUgTUVTDQo+IGludGVyZmFjZSBidXQgYXJlIHNlcGFyYXRlZCBhcyBLRkQgY2FsbHMg
dG8gYXZvaWQgY29uZmxpY3Rpbmcgd2l0aA0KPiBlYWNoIG90aGVyLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKb25hdGhhbiBLaW0gPGpvbmF0aGFuLmtpbUBhbWQuY29tPg0KPiBUZXN0ZWQtYnk6IEFs
aWNlIFdvbmcgPHNoaXdlaS53b25nQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogRXJpYyBIdWFuZyA8
amluaHVpZXJpYy5odWFuZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfbWVzLmMgICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oICAgICAgIHwgMTAgKysrLS0t
DQo+ICAgLi4uL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jICAgIHwgIDEg
Kw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9tZXNfdjExX2FwaV9kZWYuaCB8ICAz
ICstDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21l
cy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5jDQo+IGluZGV4
IGU1NDRiODIzYWJmNi4uZTk4ZGUyMzI1MGRjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X21lcy5jDQo+IEBAIC05MTYsNiArOTE2LDExIEBAIGludCBhbWRncHVfbWVz
X3NldF9zaGFkZXJfZGVidWdnZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgICAg
IG9wX2lucHV0Lm9wID0gTUVTX01JU0NfT1BfU0VUX1NIQURFUl9ERUJVR0dFUjsNCj4gICAgICAg
b3BfaW5wdXQuc2V0X3NoYWRlcl9kZWJ1Z2dlci5wcm9jZXNzX2NvbnRleHRfYWRkciA9IHByb2Nl
c3NfY29udGV4dF9hZGRyOw0KPiAgICAgICBvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLmZs
YWdzLnUzMmFsbCA9IGZsYWdzOw0KPiArDQo+ICsgICAgIC8qIHVzZSBhbWRncHUgbWVzX2ZsdXNo
X3NoYWRlcl9kZWJ1Z2dlciBpbnN0ZWFkICovDQo+ICsgICAgIGlmIChvcF9pbnB1dC5zZXRfc2hh
ZGVyX2RlYnVnZ2VyLmZsYWdzLnByb2Nlc3NfY3R4X2ZsdXNoKQ0KPiArICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiArDQo+ICAgICAgIG9wX2lucHV0LnNldF9zaGFkZXJfZGVidWdnZXIu
c3BpX2dkYmdfcGVyX3ZtaWRfY250bCA9IHNwaV9nZGJnX3Blcl92bWlkX2NudGw7DQo+ICAgICAg
IG1lbWNweShvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLnRjcF93YXRjaF9jbnRsLCB0Y3Bf
d2F0Y2hfY250bCwNCj4gICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihvcF9pbnB1dC5zZXRf
c2hhZGVyX2RlYnVnZ2VyLnRjcF93YXRjaF9jbnRsKSk7DQo+IEBAIC05MzUsNiArOTQwLDMyIEBA
IGludCBhbWRncHVfbWVzX3NldF9zaGFkZXJfZGVidWdnZXIoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsDQo+ICAgICAgIHJldHVybiByOw0KPiAgIH0NCj4NCj4gK2ludCBhbWRncHVfbWVzX2Zs
dXNoX3NoYWRlcl9kZWJ1Z2dlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBwcm9jZXNzX2NvbnRleHRfYWRk
cikgew0KPiArICAgICBzdHJ1Y3QgbWVzX21pc2Nfb3BfaW5wdXQgb3BfaW5wdXQgPSB7MH07DQo+
ICsgICAgIGludCByOw0KPiArDQo+ICsgICAgIGlmICghYWRldi0+bWVzLmZ1bmNzLT5taXNjX29w
KSB7DQo+ICsgICAgICAgICAgICAgRFJNX0VSUk9SKCJtZXMgZmx1c2ggc2hhZGVyIGRlYnVnZ2Vy
IGlzIG5vdCBzdXBwb3J0ZWQhXG4iKTsNCj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gKyAgICAgfQ0KPiArDQo+ICsgICAgIG9wX2lucHV0Lm9wID0gTUVTX01JU0NfT1BfU0VUX1NI
QURFUl9ERUJVR0dFUjsNCj4gKyAgICAgb3BfaW5wdXQuc2V0X3NoYWRlcl9kZWJ1Z2dlci5wcm9j
ZXNzX2NvbnRleHRfYWRkciA9IHByb2Nlc3NfY29udGV4dF9hZGRyOw0KPiArICAgICBvcF9pbnB1
dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLmZsYWdzLnByb2Nlc3NfY3R4X2ZsdXNoID0gdHJ1ZTsNCj4g
Kw0KPiArICAgICBhbWRncHVfbWVzX2xvY2soJmFkZXYtPm1lcyk7DQo+ICsNCj4gKyAgICAgciA9
IGFkZXYtPm1lcy5mdW5jcy0+bWlzY19vcCgmYWRldi0+bWVzLCAmb3BfaW5wdXQpOw0KPiArICAg
ICBpZiAocikNCj4gKyAgICAgICAgICAgICBEUk1fRVJST1IoImZhaWxlZCB0byBzZXRfc2hhZGVy
X2RlYnVnZ2VyXG4iKTsNCj4gKw0KPiArICAgICBhbWRncHVfbWVzX3VubG9jaygmYWRldi0+bWVz
KTsNCj4gKw0KPiArICAgICByZXR1cm4gcjsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyB2b2lkDQo+
ICAgYW1kZ3B1X21lc19yaW5nX3RvX3F1ZXVlX3Byb3BzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9t
ZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaA0KPiBpbmRl
eCA4OTRiOWIxMzMwMDAuLjdkNGY5M2ZlYTkzNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9tZXMuaA0KPiBAQCAtMjk2LDkgKzI5NiwxMCBAQCBzdHJ1Y3QgbWVzX21p
c2Nfb3BfaW5wdXQgew0KPiAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgcHJvY2Vzc19j
b250ZXh0X2FkZHI7DQo+ICAgICAgICAgICAgICAgICAgICAgICB1bmlvbiB7DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB7DQo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDY0X3Qgc2luZ2xlX21lbW9wIDogMTsNCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBzaW5nbGVfYWx1X29wIDogMTsNCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCByZXNlcnZlZDog
MzA7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc2lu
Z2xlX21lbW9wIDogMTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MzJfdCBzaW5nbGVfYWx1X29wIDogMTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCByZXNlcnZlZDogMjk7DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgcHJvY2Vzc19jdHhfZmx1c2g6IDE7DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IHUzMmFsbDsNCj4gICAgICAgICAgICAgICAgICAgICAgIH0gZmxhZ3M7DQo+
IEBAIC0zNzQsNyArMzc1LDggQEAgaW50IGFtZGdwdV9tZXNfc2V0X3NoYWRlcl9kZWJ1Z2dlcihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgdWludDMyX3QgKnRjcF93YXRjaF9jbnRsLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCBmbGFncywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vbCB0cmFwX2VuKTsNCj4gLQ0KPiAraW50IGFtZGdwdV9tZXNfZmx1c2hfc2hhZGVyX2Rl
YnVnZ2VyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50NjRfdCBwcm9jZXNzX2NvbnRleHRfYWRkcik7DQo+ICAgaW50IGFtZGdw
dV9tZXNfYWRkX3Jpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBnYW5nX2lkLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgaW50IHF1ZXVlX3R5cGUsIGludCBpZHgsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X21lc19jdHhfZGF0YSAqY3R4X2RhdGEsIGRp
ZmYgLS1naXQNCj4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1
ZV9tYW5hZ2VyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19x
dWV1ZV9tYW5hZ2VyLmMNCj4gaW5kZXggNzdmNDkzMjYyZTA1Li44ZTU1ZTc4ZmNlNGUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21h
bmFnZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19x
dWV1ZV9tYW5hZ2VyLmMNCj4gQEAgLTg3LDYgKzg3LDcgQEAgdm9pZCBrZmRfcHJvY2Vzc19kZXF1
ZXVlX2Zyb21fZGV2aWNlKHN0cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCkNCj4gICAgICAg
ICAgICAgICByZXR1cm47DQo+DQo+ICAgICAgIGRldi0+ZHFtLT5vcHMucHJvY2Vzc190ZXJtaW5h
dGlvbihkZXYtPmRxbSwgJnBkZC0+cXBkKTsNCj4gKyAgICAgYW1kZ3B1X21lc19mbHVzaF9zaGFk
ZXJfZGVidWdnZXIoZGV2LT5hZGV2LCBwZGQtPnByb2NfY3R4X2dwdV9hZGRyKTsNCj4gICAgICAg
cGRkLT5hbHJlYWR5X2RlcXVldWVkID0gdHJ1ZTsNCj4gICB9DQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gaW5kZXggMWZiZmQxYWE5
ODdlLi5lYzViOWFiNjdjNWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9tZXNfdjExX2FwaV9kZWYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gQEAgLTU3Miw3ICs1NzIsOCBAQCBzdHJ1Y3QgU0VUX1NI
QURFUl9ERUJVR0dFUiB7DQo+ICAgICAgICAgICAgICAgc3RydWN0IHsNCj4gICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IHNpbmdsZV9tZW1vcCA6IDE7ICAvKiBTUV9ERUJVRy5zaW5nbGVf
bWVtb3AgKi8NCj4gICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpbmdsZV9hbHVfb3Ag
OiAxOyAvKiBTUV9ERUJVRy5zaW5nbGVfYWx1X29wICovDQo+IC0gICAgICAgICAgICAgICAgICAg
ICB1aW50MzJfdCByZXNlcnZlZCA6IDMwOw0KPiArICAgICAgICAgICAgICAgICAgICAgdWludDMy
X3QgcmVzZXJ2ZWQgOiAyOTsNCj4gKyAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHByb2Nl
c3NfY3R4X2ZsdXNoIDogMTsNCj4gICAgICAgICAgICAgICB9Ow0KPiAgICAgICAgICAgICAgIHVp
bnQzMl90IHUzMmFsbDsNCj4gICAgICAgfSBmbGFnczsNCg0K
