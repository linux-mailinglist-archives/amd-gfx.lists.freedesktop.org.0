Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B68455E6E
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Nov 2021 15:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BE26E91F;
	Thu, 18 Nov 2021 14:43:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3606E91F
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Nov 2021 14:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB4TrI9drHmRyELT5S3R3OWj+55mQ0q0l6Aw910crg+pJdrI2qQPx+bnJtWS83ctuzT7N90yeLXUc31RR90J2UUUqpa5urVx793Of5ZbIRNQOMOCGuLnUKAbU+kciL99Oy7mOOwoppYjtJ/DK/obE/FMf8fnEI3EDLyGstEmzxY+V8MAUr0FXqMZP288pGXBBYJGFNdwcv4S7stAgJs84IPzkRMV2rdrOoN4y1Y/LIMc1zww+aLEWivH6+YVTQ3JO17grMq7PDM9S/5zajCTOvF+pytQiqKZy8qvjex4UfJVrJyRhbAfew1brPRNQOgXTum5CYpdEshf0dxiiGEoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdiVepJPsZTx2hLXe20P9W9RyHQZQQLQeEch4WoGMPI=;
 b=jE0I1kE27NuV/J4sNhfJMh/KPMw1NIxpw6KJJWr/dFhuLD6JHg8aujpE+TX9W/qcb38UxEPL1IaorUCZALuUE1yRJniASfeUe9qVxhwZ8lEuluX1LaVH5+PHqFQ/tGl1df4Qq/ipgoGnM13tpdwwpQ50HL4otaJUVW7OKtFFh5hDhgDNrsP37RpvzhQ3o7wYWKkUiHZBYpsseZ+kUwTE9rU2yk83THbFZkW+MjAnv+6OHPhInB+bFwAlwSUnPSCVCEhnrc4L4NQQTwCBeeRUgGMPbDbjQfy6IPx03TVXzw5AtFIyrEEyEcYF9zAee7yMCRva9vhhmMCzV0GY72BEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdiVepJPsZTx2hLXe20P9W9RyHQZQQLQeEch4WoGMPI=;
 b=Ly8NmPxsZmGd0oencmHTu65C+8DHxpFwXKoIDH8Jk6hC6g5vllXGkaJKGlJ1KeROoeXwCmftzSkOOeYI/4UBBv+c+ti+Dzqv0TOVEdbY7rgcqDZLFKdoUF+wYRmfn58L5Vk3kgOVt9rnkR84eZx7dcs5Yd37q1zFhOrXeNGj+1A=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 14:43:55 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::2919:f0f6:40a9:e1c0]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::2919:f0f6:40a9:e1c0%7]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 14:43:55 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Yang, Stanley"
 <Stanley.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Clements, John" <John.Clements@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Wang, Yang(Kevin)"
 <KevinYang.Wang@amd.com>
Subject: =?utf-8?B?UkU6IOWbnuWkjTogW1BBVENIIFJldmlldyAzLzRdIGRybS9hbWRncHU6IGFk?=
 =?utf-8?Q?d_message_smu_to_get_ecc=5Ftable_v2?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggUmV2aWV3IDMvNF0gZHJtL2FtZGdwdTogYWRkIG1l?=
 =?utf-8?Q?ssage_smu_to_get_ecc=5Ftable_v2?=
Thread-Index: AQHX3F9rksb0lk/soEiBGzEjEyNcO6wJJ0aAgAARiwCAACL4AIAAAMBw
Date: Thu, 18 Nov 2021 14:43:54 +0000
Message-ID: <BN9PR12MB5257A4EAE566DDA34C22B5DEFC9B9@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20211118093344.4361-1-Stanley.Yang@amd.com>
 <20211118093344.4361-3-Stanley.Yang@amd.com>
 <491af5a4-e6d9-6210-6819-1817f04d7700@amd.com>
 <BL1PR12MB53349DB7D7FC5FF559F1906E9A9B9@BL1PR12MB5334.namprd12.prod.outlook.com>
 <d7e8d2ca-e167-7c1b-3f18-45208b8ab4d5@amd.com>
In-Reply-To: <d7e8d2ca-e167-7c1b-3f18-45208b8ab4d5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-18T14:43:52Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=42579af7-5540-40f1-93d3-451ef5c959dd;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50af54bb-4c83-4175-a308-08d9aaa1d8aa
x-ms-traffictypediagnostic: BN9PR12MB5129:
x-microsoft-antispam-prvs: <BN9PR12MB512983CF56EC56F6E5A8D44CFC9B9@BN9PR12MB5129.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z8cDADN6F3jkO071iipftHUD60yrKUPADsXjX5h6VA+xPqKzm6k5/9VUSk5LfH/2u9phhOKSkt7BqFXD6mA54Ge2+0J+uV5jorft1Vts1jX44TbeFhnrBIXPTXm8iTEaAdxyYSCLITbSjz/PTKzOh4CnjNXWkocojQn5v3RuvvW/+RtmumYh2iL+tlBgRWLtX/mD3nrazl4v5UHfVXg7dAdO7n5W/+F08H4/1KfNqHzIxuTnotroaRVYEBBUcv9j9Gt3Imtf5Esl0KAaudABRpsErvOKhh9wVdz2B5jLPtDc5sNWMdS0pknlNv2QfxnU3+zeCL9jMrfR8h3XwAg8fWwcZ8BBhaW9Jp9sWkf5215xU13Mrkw8sfJHiry8IKeUoEIE+IaMR5HG7koN0RpSLCV2LPTbJiy9hAbKn/0+Uqa1PpiP9Il/26uoACbBW0iFqJqP+/Js1seZTnd1t1a6OzjGUZV27YELEouLUr5Um9P+p2aVP+jlDUFm4ibwXItDmFo1fiOFlzn4Xt6Iya9XsSNOFO87FpJtivoswj7ibk8a7DKmroLFTxI7ng7Mic92K88wyKcfL7mYV5/jlEcw5QRc+Bz1evK5oihMlS/rLUCryZKpJ3RosoxRFCLIq6G/DCaVMJGQUoGQGf+dULwwLnX+gPDtmdKlisDfhDTCWtfoKmZYzUKijpJMYutI9USpXXdaL5gSVhz6tDJucHtaXxynXfySNgT4BfUnHoyavvg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(52536014)(6506007)(508600001)(53546011)(110136005)(921005)(5660300002)(38100700002)(71200400001)(66946007)(66476007)(66446008)(66556008)(64756008)(38070700005)(76116006)(316002)(55016002)(7696005)(224303003)(15650500001)(2906002)(83380400001)(9686003)(186003)(6636002)(86362001)(122000001)(26005)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0xnOEljZW1ONU5Rc1JqVmFWalp1a3ltaXlaR3JWODBNcm1GeThONG56aVdU?=
 =?utf-8?B?K3NtTHRnTDYra2RYYjdCb1B4Q015NUtPeUUzTHd2dFltQUl5cGpUTkpzL01V?=
 =?utf-8?B?UmxxN3NGTDJuTWRqcUxnbmFhZEhIYzhGaEdmUllpa1Q0V0NYLzJSdktscDhQ?=
 =?utf-8?B?UTVaK3BTTk12Y1gwdHlFcnJOY0hpdmt3V2tZVi90NTU1ZHFKaEdpV1hGN2N4?=
 =?utf-8?B?MU5NT1VTYVJtUHR1THVKS3I1aER5WlNTZzg3dVF5S09USGpiNlltTzlMUk5v?=
 =?utf-8?B?T0VCejhVVCtmengwVHRSMDFXaFNIOUFkanVMRHZKL1JRenJRS093TGwwNkVS?=
 =?utf-8?B?b1Q4QjZvWnNVT0Q3bVl4MWNvV3gzc2prMlRiaWw4UDlOcDhXdVRnYlZQRGxI?=
 =?utf-8?B?a1dqU1NMTkcvNWcvNU9KRTdFWEhyZmV5VFVuMWt3TGNrRE5lLzAwVDJGVGxt?=
 =?utf-8?B?Q1VNLytWWngrZWI4UUhzMUhrTk14dWIrcmh2RHJQeTVoQXp2aHg1Q1A4b0Vw?=
 =?utf-8?B?WUI5MC9COXdSM0JZVjFZVXhmWnNFeUR5cGJOMWtNMEVjY3kxdUtyYkpKMGJl?=
 =?utf-8?B?Y3lENHp5YmJYK3h3KzZ3UTE2Qk5HSm1mclZKMVlveGRXd3R1dHZBU3I0dzIw?=
 =?utf-8?B?dGZaWERSQ2lpN1M2UDh1dTZodmZuTnl1Q3FrVFlKd052Rmc2R2l6SGhYa0Iw?=
 =?utf-8?B?bU5wR09oMmQ2RlZPOXNtZTlFb3htRGRqeDRxWlFSZWtEYU5Qb3kxVTRvRlV2?=
 =?utf-8?B?bkRZa3g3YlpVMEhvenlud0JKSnFZbGhJUC9yN2Y3dTVGcDE5S3hDQlZSMXNr?=
 =?utf-8?B?cVUvZGNJTUdrSXlVK1l4ZHllaWQ1dEVBaXpGOVgzNFh4OEFUeWVkdE5aUHZx?=
 =?utf-8?B?VjYwdWoraVJvcEhSekx5bGtCbHptRWRqN0hTN0d1aGRNVW5OSXdZQkF0dHBt?=
 =?utf-8?B?STVVcVQ3dW44K3cvcGdXMVJTcjV1M0dyeWE5eWpTNTlhQk54YUU2ZGE0RnZJ?=
 =?utf-8?B?WE1BN3hGME9ZK3ZaZHhFOUQ5YTVoSURhS3dDejBuMy9IYWFMdmRrVUpaU2Rk?=
 =?utf-8?B?WTZPZDRBOHR4WG9yalhmU2ZwcjgrcHl4Z0p5cGdKTGtwTXRrRXhGYkJ3UmZK?=
 =?utf-8?B?MmhCNVl4L09aVng2eXdpRFkxcm02SXZnUTZtTWlXOWhSOUdFUUJvSlBaQ1ky?=
 =?utf-8?B?MnJQclFac3Eyd2piQ0QyNHJTZk5hbk5uenpLd0dQc1RqN2NGT3oyM2xDL0Rz?=
 =?utf-8?B?akh6NElJYThScXlMaHVUWnNzWlVDNHFWR0swTC9aZzFUMFAwbGZ4cUhHcWRv?=
 =?utf-8?B?VUZiMktmUEFhVEp3WGdBYUtPVUE3VEpESjVVZWZRUDNMQmNsaVlDZUFobWU0?=
 =?utf-8?B?WTYwYWt0WEhKUkhXVDRNTVA1M1YrS1pUQUJoNVVDTXc1TC9UejRoZVVFQmE3?=
 =?utf-8?B?ekFXUE4zNU1OaVVSR25PYlhhNzV5ZDk5T0VERjNmZ2VrTGwzN24zYTEzOVUy?=
 =?utf-8?B?M1Fmdm1UQVpTRGNDcnBkdHNFYldkVHRNcWlna2t4VzFxblc5bWRkTm9YaHg0?=
 =?utf-8?B?TVA3ZlBJejN2Z1I1TDBNaDVicXo0clZ2RGFKRXNPZ29SNzIwU2V2M1VWYVMx?=
 =?utf-8?B?UXZOa2xDTmFzV1A2NWNYV3BkSk1tcjVUZnFBN25mNFhHWDJQempXMVRCZXRu?=
 =?utf-8?B?Y1M2WmZtOU5udWZYZGpSYUoydGZHQ1BhblZSZnVPdWp3SHgyRXJlQ2F0RVRm?=
 =?utf-8?B?Y2pWVktyQXp1djBKZ1BQT0pZU212YWMrbE9iTzk4K1owMW15Ymx0VjREbFpF?=
 =?utf-8?B?WHlLZzZJalRPOXdMcE1uei85T1B2dW41WVRlbXdPb2ZoOFY2bTZ5TGVYZ1Q5?=
 =?utf-8?B?TTl3RDVSZlUwVnVYZmVhaDFnZGpqZjZzUE4zZG1GQWIrdFBQZ21uTTg5ZWhi?=
 =?utf-8?B?Q2w0d25lQUk2QlZuSmY5ODMvYUtLSXVPWnBJZEs3SGdZb0NTYWw0OUlySmFD?=
 =?utf-8?B?dDZjUG82RC8rYjFQS1BJRmtXTkNwYXh4ODkxQWZKdWVCSEJySTE3STVUUlhx?=
 =?utf-8?B?d2pZMFhScjZFRTVXdGY4YWZiOHV5bXVoeit2UDkwU1VVT1FaeHJKbXh5dFZL?=
 =?utf-8?B?d0lEVllkREkxYXBCTUphOFhVdTluL1M1VjYxQnE5V21OQlBtVGJ6ZU9NTlBV?=
 =?utf-8?Q?qrTz6wDoITzMQOMqVIjoPGA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50af54bb-4c83-4175-a308-08d9aaa1d8aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 14:43:54.8386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYoqLlo5aKenPhAFfOgODG8FLOOr0yxU3hPafCgwkgQub0ac4JDkpD5SjVJis/Vpz3YqZDhMlGoiwuYTV7HHow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5129
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KU2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUuDQoNClJl
dmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQoNClJlZ2Fy
ZHMsDQpIYXdraW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMYXphciwg
TGlqbyA8TGlqby5MYXphckBhbWQuY29tPiANClNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxOCwg
MjAyMSAyMjo0MQ0KVG86IFlhbmcsIFN0YW5sZXkgPFN0YW5sZXkuWWFuZ0BhbWQuY29tPjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+OyBDbGVtZW50cywgSm9obiA8Sm9obi5DbGVtZW50c0BhbWQuY29tPjsgUXVhbiwg
RXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBXYW5nLCBZYW5nKEtldmluKSA8S2V2aW5ZYW5nLldh
bmdAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiDlm57lpI06IFtQQVRDSCBSZXZpZXcgMy80XSBkcm0v
YW1kZ3B1OiBhZGQgbWVzc2FnZSBzbXUgdG8gZ2V0IGVjY190YWJsZSB2Mg0KDQoNCg0KT24gMTEv
MTgvMjAyMSA2OjA1IFBNLCBZYW5nLCBTdGFubGV5IHdyb3RlOg0KPiBbQU1EIE9mZmljaWFsIFVz
ZSBPbmx5XQ0KPiANCj4gDQo+IA0KPj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPj4g5Y+R5Lu2
5Lq6OiBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPg0KPj4g5Y+R6YCB5pe26Ze0OiBU
aHVyc2RheSwgTm92ZW1iZXIgMTgsIDIwMjEgNzozMyBQTQ0KPj4g5pS25Lu25Lq6OiBZYW5nLCBT
dGFubGV5IDxTdGFubGV5LllhbmdAYW1kLmNvbT47IGFtZC0gDQo+PiBnZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgDQo+PiBD
bGVtZW50cywgSm9obiA8Sm9obi5DbGVtZW50c0BhbWQuY29tPjsgUXVhbiwgRXZhbiANCj4+IDxF
dmFuLlF1YW5AYW1kLmNvbT47IFdhbmcsIFlhbmcoS2V2aW4pIDxLZXZpbllhbmcuV2FuZ0BhbWQu
Y29tPg0KPj4g5Li76aKYOiBSZTogW1BBVENIIFJldmlldyAzLzRdIGRybS9hbWRncHU6IGFkZCBt
ZXNzYWdlIHNtdSB0byBnZXQgDQo+PiBlY2NfdGFibGUgdjINCj4+DQo+Pg0KPj4NCj4+IE9uIDEx
LzE4LzIwMjEgMzowMyBQTSwgU3RhbmxleS5ZYW5nIHdyb3RlOg0KPj4+IHN1cHBvcnQgRUNDIFRB
QkxFIG1lc3NhZ2UsIHRoaXMgdGFibGUgaW5jbHVkZSB1bWMgcmFzIGVycm9yIGNvdW50IA0KPj4+
IGFuZCBlcnJvciBhZGRyZXNzDQo+Pj4NCj4+PiB2MjoNCj4+PiAgICAgICBhZGQgc211IHZlcnNp
b24gY2hlY2sgdG8gcXVlcnkgd2hldGhlciBzdXBwb3J0IGVjY3RhYmxlDQo+Pj4gICAgICAgY2Fs
bCBzbXVfY21uX3VwZGF0ZV90YWJsZSB0byBnZXQgZWNjdGFibGUgZGlyZWN0bHkNCj4+Pg0KPj4+
IFNpZ25lZC1vZmYtYnk6IFN0YW5sZXkuWWFuZyA8U3RhbmxleS5ZYW5nQGFtZC5jb20+DQo+Pj4g
LS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X3NtdS5oICAgICAg
IHwgIDggKysrDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9hbWRncHVfc211
LmMgICAgIHwgMTQgKysrKw0KPj4+ICAgIC4uLi9kcm0vYW1kL3BtL3N3c211L3NtdTEzL2FsZGVi
YXJhbl9wcHQuYyAgICB8IDcwDQo+PiArKysrKysrKysrKysrKysrKysrDQo+Pj4gICAgLi4uL2dw
dS9kcm0vYW1kL3BtL3N3c211L3NtdTEzL3NtdV92MTNfMC5jICAgIHwgIDIgKw0KPj4+ICAgIDQg
ZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdwdV9zbXUuaA0KPj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X3NtdS5oDQo+Pj4gaW5kZXggMzU1N2Y0ZTdmYzMwLi43YTA2
MDIxYTU4ZjAgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1k
Z3B1X3NtdS5oDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X3Nt
dS5oDQo+Pj4gQEAgLTMyNCw2ICszMjQsNyBAQCBlbnVtIHNtdV90YWJsZV9pZA0KPj4+ICAgIAlT
TVVfVEFCTEVfT1ZFUkRSSVZFLA0KPj4+ICAgIAlTTVVfVEFCTEVfSTJDX0NPTU1BTkRTLA0KPj4+
ICAgIAlTTVVfVEFCTEVfUEFDRSwNCj4+PiArCVNNVV9UQUJMRV9FQ0NJTkZPLA0KPj4+ICAgIAlT
TVVfVEFCTEVfQ09VTlQsDQo+Pj4gICAgfTsNCj4+Pg0KPj4+IEBAIC0zNDAsNiArMzQxLDcgQEAg
c3RydWN0IHNtdV90YWJsZV9jb250ZXh0DQo+Pj4gICAgCXZvaWQJCQkJKm1heF9zdXN0YWluYWJs
ZV9jbG9ja3M7DQo+Pj4gICAgCXN0cnVjdCBzbXVfYmlvc19ib290X3VwX3ZhbHVlcwlib290X3Zh
bHVlczsNCj4+PiAgICAJdm9pZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAqZHJpdmVyX3Bw
dGFibGU7DQo+Pj4gKwl2b2lkICAgICAgICAgICAgICAgICAgICAgICAgICAgICplY2NfdGFibGU7
DQo+Pj4gICAgCXN0cnVjdCBzbXVfdGFibGUJCXRhYmxlc1tTTVVfVEFCTEVfQ09VTlRdOw0KPj4+
ICAgIAkvKg0KPj4+ICAgIAkgKiBUaGUgZHJpdmVyIHRhYmxlIGlzIGp1c3QgYSBzdGFnaW5nIGJ1
ZmZlciBmb3IgQEAgLTEyNjEsNg0KPj4+ICsxMjYzLDExIEBAIHN0cnVjdCBwcHRhYmxlX2Z1bmNz
IHsNCj4+PiAgICAJICoNCj4+IAkJb2YgU01VQlVTIHRhYmxlLg0KPj4+ICAgIAkgKi8NCj4+PiAg
ICAJaW50ICgqc2VuZF9oYm1fYmFkX3BhZ2VzX251bSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
DQo+PiB1aW50MzJfdA0KPj4+IHNpemUpOw0KPj4+ICsNCj4+PiArCS8qKg0KPj4+ICsJICogQGdl
dF9lY2NfdGFibGU6ICBtZXNzYWdlIFNNVSB0byBnZXQgRUNDIElORk8gdGFibGUuDQo+Pj4gKwkg
Ki8NCj4+PiArCXNzaXplX3QgKCpnZXRfZWNjX2luZm8pKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LCB2b2lkICp0YWJsZSk7DQo+Pj4gICAgfTsNCj4+Pg0KPj4+ICAgIHR5cGVkZWYgZW51bSB7DQo+
Pj4gQEAgLTEzOTcsNiArMTQwNCw3IEBAIGludCBzbXVfc2V0X2xpZ2h0X3NicihzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgDQo+Pj4gYm9vbCBlbmFibGUpOw0KPj4+DQo+Pj4gICAgaW50IHNtdV93
YWl0X2Zvcl9ldmVudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgZW51bQ0KPj4gc211X2V2
ZW50X3R5cGUgZXZlbnQsDQo+Pj4gICAgCQkgICAgICAgdWludDY0X3QgZXZlbnRfYXJnKTsNCj4+
PiAraW50IHNtdV9nZXRfZWNjX2luZm8oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHZvaWQgKnVt
Y19lY2MpOw0KPj4+DQo+Pj4gICAgI2VuZGlmDQo+Pj4gICAgI2VuZGlmDQo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvYW1kZ3B1X3NtdS5jDQo+Pj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2FtZGdwdV9zbXUuYw0KPj4+IGluZGV4IDAxMTY4Yjg5
NTViZi4uZmQzYjZiNDYwYjEyIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vc3dzbXUvYW1kZ3B1X3NtdS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9z
d3NtdS9hbWRncHVfc211LmMNCj4+PiBAQCAtMzA3Miw2ICszMDcyLDIwIEBAIGludCBzbXVfc2V0
X2xpZ2h0X3NicihzdHJ1Y3Qgc211X2NvbnRleHQgDQo+Pj4gKnNtdSwNCj4+IGJvb2wgZW5hYmxl
KQ0KPj4+ICAgIAlyZXR1cm4gcmV0Ow0KPj4+ICAgIH0NCj4+Pg0KPj4+ICtpbnQgc211X2dldF9l
Y2NfaW5mbyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdm9pZCAqdW1jX2VjYykgew0KPj4+ICsJ
aW50IHJldCA9IC1FT1BOT1RTVVBQOw0KPj4+ICsNCj4+PiArCW11dGV4X2xvY2soJnNtdS0+bXV0
ZXgpOw0KPj4+ICsJaWYgKHNtdS0+cHB0X2Z1bmNzICYmDQo+Pj4gKwkJc211LT5wcHRfZnVuY3Mt
PmdldF9lY2NfaW5mbykNCj4+PiArCQlyZXQgPSBzbXUtPnBwdF9mdW5jcy0+Z2V0X2VjY19pbmZv
KHNtdSwgdW1jX2VjYyk7DQo+Pj4gKwltdXRleF91bmxvY2soJnNtdS0+bXV0ZXgpOw0KPj4+ICsN
Cj4+PiArCXJldHVybiByZXQ7DQo+Pj4gKw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICAgIHN0YXRpYyBp
bnQgc211X2dldF9wcnZfYnVmZmVyX2RldGFpbHModm9pZCAqaGFuZGxlLCB2b2lkICoqYWRkciwg
DQo+Pj4gc2l6ZV90DQo+PiAqc2l6ZSkNCj4+PiAgICB7DQo+Pj4gICAgCXN0cnVjdCBzbXVfY29u
dGV4dCAqc211ID0gaGFuZGxlOyBkaWZmIC0tZ2l0IA0KPj4+IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9zbXUxMy9hbGRlYmFyYW5fcHB0LmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vc3dzbXUvc211MTMvYWxkZWJhcmFuX3BwdC5jDQo+Pj4gaW5kZXggZjgzNWQ4NmNjMmY1
Li40YzIxNjA5Y2NlYTUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9z
d3NtdS9zbXUxMy9hbGRlYmFyYW5fcHB0LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3N3c211L3NtdTEzL2FsZGViYXJhbl9wcHQuYw0KPj4+IEBAIC03OCw2ICs3OCwxMiBAQA0K
Pj4+DQo+Pj4gICAgI2RlZmluZSBzbW5QQ0lFX0VTTV9DVFJMCQkJMHgxMTEwMDNEMA0KPj4+DQo+
Pj4gKy8qDQo+Pj4gKyAqIFNNVSBzdXBwb3J0IEVDQ1RBQkxFIHNpbmNlIHZlcnNpb24gNjguNDIu
MCwNCj4+PiArICogdXNlIHRoaXMgdG8gY2hlY2sgRUNDVEFMRSBmZWF0dXJlIHdoZXRoZXIgc3Vw
cG9ydCAgKi8gI2RlZmluZSANCj4+PiArU1VQUE9SVF9FQ0NUQUJMRV9TTVVfVkVSU0lPTiAweDAw
NDQyYTAwDQo+Pj4gKw0KPj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211X3RlbXBlcmF0dXJl
X3JhbmdlIHNtdTEzX3RoZXJtYWxfcG9saWN5W10gPQ0KPj4+ICAgIHsNCj4+PiAgICAJey0yNzMx
NTAsICA5OTAwMCwgOTkwMDAsIC0yNzMxNTAsIDk5MDAwLCA5OTAwMCwgLTI3MzE1MCwgOTkwMDAs
IA0KPj4+IDk5MDAwfSwgQEAgLTE5MCw2ICsxOTYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNt
bjJhc2ljX21hcHBpbmcNCj4+IGFsZGViYXJhbl90YWJsZV9tYXBbU01VX1RBQkxFX0NPVU5UXSA9
IHsNCj4+PiAgICAJVEFCX01BUChTTVVfTUVUUklDUyksDQo+Pj4gICAgCVRBQl9NQVAoRFJJVkVS
X1NNVV9DT05GSUcpLA0KPj4+ICAgIAlUQUJfTUFQKEkyQ19DT01NQU5EUyksDQo+Pj4gKwlUQUJf
TUFQKEVDQ0lORk8pLA0KPj4+ICAgIH07DQo+Pj4NCj4+PiAgICBzdGF0aWMgY29uc3QgdWludDhf
dCBhbGRlYmFyYW5fdGhyb3R0bGVyX21hcFtdID0geyBAQCAtMjIzLDYgDQo+Pj4gKzIzMCw5IEBA
IHN0YXRpYyBpbnQgYWxkZWJhcmFuX3RhYmxlc19pbml0KHN0cnVjdCBzbXVfY29udGV4dCAqc211
KQ0KPj4+ICAgIAlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9JMkNfQ09NTUFORFMs
DQo+PiBzaXplb2YoU3dJMmNSZXF1ZXN0X3QpLA0KPj4+ICAgIAkJICAgICAgIFBBR0VfU0laRSwg
QU1ER1BVX0dFTV9ET01BSU5fVlJBTSk7DQo+Pj4NCj4+PiArCVNNVV9UQUJMRV9JTklUKHRhYmxl
cywgU01VX1RBQkxFX0VDQ0lORk8sDQo+PiBzaXplb2YoRWNjSW5mb1RhYmxlX3QpLA0KPj4+ICsJ
CSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOw0KPj4+ICsNCj4+PiAg
ICAJc211X3RhYmxlLT5tZXRyaWNzX3RhYmxlID0ga3phbGxvYyhzaXplb2YoU211TWV0cmljc190
KSwNCj4+IEdGUF9LRVJORUwpOw0KPj4+ICAgIAlpZiAoIXNtdV90YWJsZS0+bWV0cmljc190YWJs
ZSkNCj4+PiAgICAJCXJldHVybiAtRU5PTUVNOw0KPj4+IEBAIC0yMzUsNiArMjQ1LDEwIEBAIHN0
YXRpYyBpbnQgYWxkZWJhcmFuX3RhYmxlc19pbml0KHN0cnVjdCANCj4+PiBzbXVfY29udGV4dA0K
Pj4gKnNtdSkNCj4+PiAgICAJCXJldHVybiAtRU5PTUVNOw0KPj4+ICAgIAl9DQo+Pj4NCj4+PiAr
CXNtdV90YWJsZS0+ZWNjX3RhYmxlID0ga3phbGxvYyh0YWJsZXNbU01VX1RBQkxFX0VDQ0lORk9d
LnNpemUsDQo+PiBHRlBfS0VSTkVMKTsNCj4+PiArCWlmICghc211X3RhYmxlLT5lY2NfdGFibGUp
DQo+Pj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+Pj4gKw0KPj4+ICAgIAlyZXR1cm4gMDsNCj4+PiAg
ICB9DQo+Pj4NCj4+PiBAQCAtMTc2NSw2ICsxNzc5LDYxIEBAIHN0YXRpYyBzc2l6ZV90IA0KPj4+
IGFsZGViYXJhbl9nZXRfZ3B1X21ldHJpY3Moc3RydWN0DQo+PiBzbXVfY29udGV4dCAqc211LA0K
Pj4+ICAgIAlyZXR1cm4gc2l6ZW9mKHN0cnVjdCBncHVfbWV0cmljc192MV8zKTsNCj4+PiAgICB9
DQo+Pj4NCj4+PiArc3RhdGljIGludCBhbGRlYmFyYW5fY2hlY2tfZWNjX3RhYmxlX3N1cHBvcnQo
c3RydWN0IHNtdV9jb250ZXh0IA0KPj4+ICsqc211KSB7DQo+Pj4gKwl1aW50MzJfdCBpZl92ZXJz
aW9uID0gMHhmZiwgc211X3ZlcnNpb24gPSAweGZmOw0KPj4+ICsJaW50IHJldCA9IDA7DQo+Pj4g
Kw0KPj4+ICsJcmV0ID0gc211X2Ntbl9nZXRfc21jX3ZlcnNpb24oc211LCAmaWZfdmVyc2lvbiwg
JnNtdV92ZXJzaW9uKTsNCj4+PiArCWlmIChyZXQpDQo+Pj4gKwkJcmV0ID0gLUVPUE5PVFNVUFA7
CS8vIHJldHVybiBub3Qgc3VwcG9ydCBpZiBmYWlsZWQgZ2V0DQoNCk5pdHBpY2sgLSBjb21tZW50
IHN0eWxlDQoNCj4+IHNtdV92ZXJzaW9uDQo+Pj4gKw0KPj4+ICsJaWYgKHNtdV92ZXJzaW9uIDwg
U1VQUE9SVF9FQ0NUQUJMRV9TTVVfVkVSU0lPTikNCj4+PiArCQlyZXQgPSAtRU9QTk9UU1VQUDsN
Cj4+PiArDQo+Pj4gKwlyZXR1cm4gcmV0Ow0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgc3Np
emVfdCBhbGRlYmFyYW5fZ2V0X2VjY19pbmZvKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KPj4+
ICsJCQkJCSB2b2lkICp0YWJsZSkNCj4+PiArew0KPj4+ICsJc3RydWN0IHNtdV90YWJsZV9jb250
ZXh0ICpzbXVfdGFibGUgPSAmc211LT5zbXVfdGFibGU7DQo+Pj4gKwlFY2NJbmZvVGFibGVfdCAq
ZWNjX3RhYmxlID0gTlVMTDsNCj4+PiArCXN0cnVjdCBlY2NfaW5mb19wZXJfY2ggKmVjY19pbmZv
X3Blcl9jaGFubmVsID0gTlVMTDsNCj4+PiArCWludCBpLCByZXQgPSAwOw0KPj4+ICsJc3RydWN0
IHVtY19lY2NfaW5mbyAqZWNjaW5mbyA9IChzdHJ1Y3QgdW1jX2VjY19pbmZvICopdGFibGU7DQo+
Pj4gKw0KPj4NCj4+IE1pc3NlZCB0byBhc2sgbGFzdCB0aW1lLiBTaW5jZSB1bWNfZWNjX2luZm8g
aXMgYSBjb21tb24gc3RydWN0LCBkbyANCj4+IHlvdSBhbHNvIHdhbnQgdG8gcGFzcyBiYWNrIHRo
ZSBudW1iZXIgb2YgY2hhbm5lbHMgaGF2aW5nIGRhdGE/DQo+Pg0KPj4gTm93IHRoaXMgc3RydWN0
IGNhbiBob2xkIG1heCBvZiAzMiBjaGFubmVsIGRhdGEuIExldCdzIHNheSBpZiB0aGUgDQo+PiBz
YW1lIGludGVyZmFjZSBpcyBnb2luZyB0byBiZSB1c2VkIG9uIGFub3RoZXIgQVNJQyBYIGhhdmlu
ZyBvbmx5IDE2IGNoYW5uZWxzLg0KPj4gVGhlbiB0aGUgY2FsbGJhY2sgZm9yIEFTSUMgWCBmaWxs
cyBkYXRhIG9ubHkgZm9yIDE2IGNoYW5uZWxzLiBPciwgeW91IA0KPj4gZXhwZWN0IHRoYXQgdG8g
YmUgdGFrZW4gY2FyZSBhdCB0aGUgY2FsbGVyIHNpZGU/DQo+IA0KPiBbWWFuZywgU3RhbmxleV0g
OiBJZiBBU0lDIFggaGF2ZSBvbmx5IDE2IGNoYW5uZWxzLCB0aGUgY2FsbGJhY2sgb25seSBmaWxs
IGRhdGEgZm9yIDE2IGNoYW5uZWxzLCBhbmQgY2FsbGVyIHNpZGUgYWxzbyBuZWVkIGNvbnNpZGVy
IGl0cyBvd24gY2hhbm5lbCBudW1iZXIgdG8gaGFuZGxlIHdpdGggdW1jX2VjY19pbmZvLg0KPiAN
Cg0KVGhhbmtzIGZvciB0aGUgZGV0YWlscy4gV2l0aCB0aGUgbml0cGljayBhYm92ZSBhbmQgRXZh
bidzIGNvbW1lbnRzIG9uIHRoZSBwYXRjaCBzdWJqZWN0IGFkZHJlc3NlZCwgcGF0Y2hlcyAxIGFu
ZCAzIGFyZQ0KDQpSZXZpZXdlZC1ieTogTGlqbyBMYXphciA8bGlqby5sYXphckBhbWQuY29tPg0K
DQoyIGFuZCA0IGxvb2sgZ29vZCB0byBtZS4gSGF3a2luZyBvciBKb2huIHNob3VsZCBhIHRha2Ug
bG9vayB0aG91Z2guDQoNClRoYW5rcywNCkxpam8NCg0KPj4NCj4+IFRoYW5rcywNCj4+IExpam8N
Cj4+DQo+Pj4gKwlyZXQgPSBhbGRlYmFyYW5fY2hlY2tfZWNjX3RhYmxlX3N1cHBvcnQoc211KTsN
Cj4+PiArCWlmIChyZXQpDQo+Pj4gKwkJcmV0dXJuIHJldDsNCj4+PiArDQo+Pj4gKwlyZXQgPSBz
bXVfY21uX3VwZGF0ZV90YWJsZShzbXUsDQo+Pj4gKwkJCSAgICAgICBTTVVfVEFCTEVfRUNDSU5G
TywNCj4+PiArCQkJICAgICAgIDAsDQo+Pj4gKwkJCSAgICAgICBzbXVfdGFibGUtPmVjY190YWJs
ZSwNCj4+PiArCQkJICAgICAgIGZhbHNlKTsNCj4+PiArCWlmIChyZXQpIHsNCj4+PiArCQlkZXZf
aW5mbyhzbXUtPmFkZXYtPmRldiwgIkZhaWxlZCB0byBleHBvcnQgU01VIGVjYw0KPj4gdGFibGUh
XG4iKTsNCj4+PiArCQlyZXR1cm4gcmV0Ow0KPj4+ICsJfQ0KPj4+ICsNCj4+PiArCWVjY190YWJs
ZSA9IChFY2NJbmZvVGFibGVfdCAqKXNtdV90YWJsZS0+ZWNjX3RhYmxlOw0KPj4+ICsNCj4+PiAr
CWZvciAoaSA9IDA7IGkgPCBBTERFQkFSQU5fVU1DX0NIQU5ORUxfTlVNOyBpKyspIHsNCj4+PiAr
CQllY2NfaW5mb19wZXJfY2hhbm5lbCA9ICYoZWNjaW5mby0+ZWNjW2ldKTsNCj4+PiArCQllY2Nf
aW5mb19wZXJfY2hhbm5lbC0+Y2VfY291bnRfbG9fY2hpcCA9DQo+Pj4gKwkJCWVjY190YWJsZS0+
RWNjSW5mb1tpXS5jZV9jb3VudF9sb19jaGlwOw0KPj4+ICsJCWVjY19pbmZvX3Blcl9jaGFubmVs
LT5jZV9jb3VudF9oaV9jaGlwID0NCj4+PiArCQkJZWNjX3RhYmxlLT5FY2NJbmZvW2ldLmNlX2Nv
dW50X2hpX2NoaXA7DQo+Pj4gKwkJZWNjX2luZm9fcGVyX2NoYW5uZWwtPm1jYV91bWNfc3RhdHVz
ID0NCj4+PiArCQkJZWNjX3RhYmxlLT5FY2NJbmZvW2ldLm1jYV91bWNfc3RhdHVzOw0KPj4+ICsJ
CWVjY19pbmZvX3Blcl9jaGFubmVsLT5tY2FfdW1jX2FkZHIgPQ0KPj4+ICsJCQllY2NfdGFibGUt
PkVjY0luZm9baV0ubWNhX3VtY19hZGRyOw0KPj4+ICsJfQ0KPj4+ICsNCj4+PiArCXJldHVybiBy
ZXQ7DQo+Pj4gK30NCj4+PiArDQo+Pj4gICAgc3RhdGljIGludCBhbGRlYmFyYW5fbW9kZTFfcmVz
ZXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpDQo+Pj4gICAgew0KPj4+ICAgIAl1MzIgc211X3Zl
cnNpb24sIGZhdGFsX2VyciwgcGFyYW07IEBAIC0xOTY3LDYgKzIwMzYsNyBAQCBzdGF0aWMgDQo+
Pj4gY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MNCj4+IGFsZGViYXJhbl9wcHRfZnVuY3MgPSB7
DQo+Pj4gICAgCS5pMmNfaW5pdCA9IGFsZGViYXJhbl9pMmNfY29udHJvbF9pbml0LA0KPj4+ICAg
IAkuaTJjX2ZpbmkgPSBhbGRlYmFyYW5faTJjX2NvbnRyb2xfZmluaSwNCj4+PiAgICAJLnNlbmRf
aGJtX2JhZF9wYWdlc19udW0gPQ0KPj4gYWxkZWJhcmFuX3NtdV9zZW5kX2hibV9iYWRfcGFnZV9u
dW0sDQo+Pj4gKwkuZ2V0X2VjY19pbmZvID0gYWxkZWJhcmFuX2dldF9lY2NfaW5mbywNCj4+PiAg
ICB9Ow0KPj4+DQo+Pj4gICAgdm9pZCBhbGRlYmFyYW5fc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSkgZGlmZiAtLWdpdCANCj4+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
c3dzbXUvc211MTMvc211X3YxM18wLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTMvc211X3YxM18wLmMNCj4+PiBpbmRleCA0ZDk2MDk5YTliYjEuLjU1NDIxZWE2MjJm
YiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEzL3Nt
dV92MTNfMC5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMy9z
bXVfdjEzXzAuYw0KPj4+IEBAIC00MjgsOCArNDI4LDEwIEBAIGludCBzbXVfdjEzXzBfZmluaV9z
bWNfdGFibGVzKHN0cnVjdA0KPj4gc211X2NvbnRleHQgKnNtdSkNCj4+PiAgICAJa2ZyZWUoc211
X3RhYmxlLT5oYXJkY29kZV9wcHRhYmxlKTsNCj4+PiAgICAJc211X3RhYmxlLT5oYXJkY29kZV9w
cHRhYmxlID0gTlVMTDsNCj4+Pg0KPj4+ICsJa2ZyZWUoc211X3RhYmxlLT5lY2NfdGFibGUpOw0K
Pj4+ICAgIAlrZnJlZShzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUpOw0KPj4+ICAgIAlrZnJlZShz
bXVfdGFibGUtPndhdGVybWFya3NfdGFibGUpOw0KPj4+ICsJc211X3RhYmxlLT5lY2NfdGFibGUg
PSBOVUxMOw0KPj4+ICAgIAlzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUgPSBOVUxMOw0KPj4+ICAg
IAlzbXVfdGFibGUtPndhdGVybWFya3NfdGFibGUgPSBOVUxMOw0KPj4+ICAgIAlzbXVfdGFibGUt
Pm1ldHJpY3NfdGltZSA9IDA7DQo+Pj4NCg==
