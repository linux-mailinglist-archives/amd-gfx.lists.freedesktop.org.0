Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4587193A5
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Jun 2023 08:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1673010E525;
	Thu,  1 Jun 2023 06:56:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6F810E05A
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Jun 2023 06:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqDlOqH5s3CR51XEffNda7g31KQo2nKmKgrHDtOYTiqS/02y2T2a2ZKgJi2LS5nzGez3eW5h7PTZaPy2sx2gMDCxq3x/Ibrl1ouVxePJjCJkJ7182RxYnuIe6NapbGG68PHoDS72XPKQkmb79tjzw+sZWdgnyxxdXyIr5pmqIajYzM3bEQWBzvOI77aogve1hosYjLw1qhFd90C+UcKcUjC7D8Yon2pGLrRbmGRyfmgEsM2bJrP4KrqzVNYFqSveDVQY9gqtu2LBOJPFa6WS/VKTle1F/eZ9tIOVpOiJDuwkpSHRbmuYkO4l0yLzIEZiK1jQRTukTciDYvS80su+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Pu4zIVX986g0LlN+KNar2j/oRPdrSPGrj2MXUYFHnk=;
 b=B8Q0u2xmxNr7P2+xfdQvVF9LKJq8BUxln/YygVnaRmb5Xja7ApI19YW009UIojs5J9ZzCui1GW6Rau/qbpOUdF33r50Yfjzc29hYU+uTlKzVAOZ4n9cOJ8qN0UkAvpmeBkF7UW6qiIXEphy6C5/09ZoNUIF2KnSWDDDxglMHT00IWeN7N5QfneLJVtgCojRhVyly4TYVWamtLdptBQ+EoqP49JvEnEs50nMgvW4CoCEHTyJ0xW1djxPHdcd/UFMsrf7bnfdWabytScOy/u3BJSCpgkre6NRD81JGQY7+DHyc/8dXdZsvgccWxZ2lIuFJySoYQVv+awFhddBeLepr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Pu4zIVX986g0LlN+KNar2j/oRPdrSPGrj2MXUYFHnk=;
 b=yaWehYJeK5+yTxIiaFR+BsAryZxci74uTMNHiQS5TZMEUvhrLpOPvtKdo4p5yaCho8CUMLGcl8yj/mnh10tCHVzMD4FkTgsrVnsUheoq03vJh66WK/6eGiOiFjnIemm8N+k3RCca0/XamwLm6yQ3ako9xeKuVhsUVR457OInfm0=
Received: from CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 06:56:50 +0000
Received: from CH2PR12MB4215.namprd12.prod.outlook.com
 ([fe80::d713:5815:3d4b:3db0]) by CH2PR12MB4215.namprd12.prod.outlook.com
 ([fe80::d713:5815:3d4b:3db0%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 06:56:49 +0000
From: "Chai, Thomas" <YiPeng.Chai@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: change reserved vram info print
Thread-Topic: [PATCH] drm/amdgpu: change reserved vram info print
Thread-Index: AQHZjuYQIROZCHajbE+Rp9cXmkReda91gq0AgAADIQCAAAibYA==
Date: Thu, 1 Jun 2023 06:56:49 +0000
Message-ID: <CH2PR12MB421519DD2C446F5C8149ACC5FC499@CH2PR12MB4215.namprd12.prod.outlook.com>
References: <20230525085026.1316196-1-YiPeng.Chai@amd.com>
 <de91def0-4de8-307f-dc89-b5c744506452@amd.com>
 <d42c6f18-1e0c-e4b2-08c7-873c44e141b6@gmail.com>
In-Reply-To: <d42c6f18-1e0c-e4b2-08c7-873c44e141b6@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1303959d-cfaa-4be9-9ba4-d8409fd104c4;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-01T06:55:52Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4215:EE_|SA1PR12MB7104:EE_
x-ms-office365-filtering-correlation-id: a705835e-72d0-48d1-dc61-08db626d5f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /dzN27AjpnR1P/6SnUdjdyNN+h3hcrT6hTsuc+JIUm+VeCb+YhSyeMv8u10KbqC4Mw8a0ZtqIf87li7s+eBPnLI161k9q71GnOOVt13J3HkgoSCdtTuxmlez42ndK58ALyZCB7KK0VxW4MNyuKrMeNoNPRwtmnWkn3eQ2lyBP94K/6uo5/exzNy3daR0olIJftg8kwwPg3jOu5hymkAZsDFGKL4grTrvKEr+jnPR+AAttMKG/6UuIwjG4pozP5L8dgLbKYBzt2it7lN+bWK4Vch4GB+zHnFLFIulclJJq0cxLbR5RYK7PNxv0b8otLDbpmURnv7hsPf+Hxb/p6rMAi+/q2uTNeRQXo+cQmjqCLEL1okib2QM71P2ruoYAPX7klc8wCSf/snxeakhzkWTwJ0uG1E0aGbpwid6VNSMmwSUBjWh5hv1nR7ZGwN/sn1xFI98i7jaZ10cHmIshgF0IWLUXY5XuJBGKbz/s22h1ahsW0yVOTRcInJK4dq6wVqPS3sGkwQkwtibS+NVknwkS+iKbLvp5jscCJvxpLT22v1FT0n/TeFB6Jds67r8psf01IddP3DVrnRRb7RikfN97jLOG3NeoRJ8+xAq7IMyMrXXzyUHajv9+3YC6+qlrohf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4215.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199021)(8676002)(83380400001)(186003)(66574015)(2906002)(64756008)(4326008)(66476007)(76116006)(71200400001)(66446008)(7696005)(316002)(66946007)(54906003)(478600001)(110136005)(66556008)(6506007)(52536014)(53546011)(5660300002)(9686003)(41300700001)(8936002)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHhMdnVpVnRwL1lSRkFHNGtrM2l2OWJHSUoyUUh2SDgrN2VUeml6MkM1eFY1?=
 =?utf-8?B?NzJTV0NQMW4zYkw4akt6SVFickpkV1ZzNWVBY0FWN1VhVDBKZ0NvWnBrNFp3?=
 =?utf-8?B?VlpkOEFvVjBGNG5DOU5qMHVIcTRrT0FYaFFqYVJCbXdTL3FOOWpteG9nRnJv?=
 =?utf-8?B?THZnMFJzOTRGRjlWOW16N3BSVHA1YlZOeUZhSHRpQ2R3SVRmOGJURTNQcjQ0?=
 =?utf-8?B?eGZPc0lUM0lQbUI4SVJraUZQK29TVDVsdlQyQ29PbkRSY3pXelhIa0JJNjds?=
 =?utf-8?B?YkdYRXovZWZiZk1pMjZCZ2dEWHFEaDUvcm5Za04xZlZVMDRhanMzTktPQW9s?=
 =?utf-8?B?em1Zc0piWWxjWEt6OVNsSG5BZHVPRnNUQlRjS1Y1a21PN1JTdzRZM2ZoZm9a?=
 =?utf-8?B?NS83a1Vzb1FBWjZUaGllSWVuaUY2b0o4NURoZVFFSFB3bm5MZ0tFZTVua0Jp?=
 =?utf-8?B?UDJ0aktiUS9HNW1uZ0Q4amk1Rm5ldEUwb2dtNFgvTHJiZGw1dStiVzQ5Y2FO?=
 =?utf-8?B?VklFeFB6K1VBZXFwU3JRRG1BQ1cycVFNSDBaVEV4NkpyQk9wc254Z2pIR1hL?=
 =?utf-8?B?SmdoaWd5bGpnaG5KTkpvYVJUWk5zMHlNbHJYbVJKSUVtemJCeXd0ZmVPclMw?=
 =?utf-8?B?RnhaT3J3eXNCMitjNHphZFNwNGdyYUxrNmRERjNIRzdqZ3ZFNEpYYXh6cjlK?=
 =?utf-8?B?S2NLMVFiRnBscHVYODVBNnpNNGcvN0JBOXBORTJwWG0wVjhKYTV3cEUzZE1r?=
 =?utf-8?B?OVVzNXVhTDBud3U1alVwQU5yMVhrL1RqMzZpdnhvb2tiOTlTaEdwQWZLcjNi?=
 =?utf-8?B?NHlmTVBKMHlCQ2R2VVZUMGVkUHEvc2s0cVZVMnlQSkhvdmo1Ny9MNktZVTNU?=
 =?utf-8?B?THkveEZDeWFheDBPQVNnc1pIb2ErdjdZdmZhaUI5QXI4Q1RrNjBoZEFCanpt?=
 =?utf-8?B?dGRURHErS3RDejZESHBVOXlUVmMyODNGK2hmbWRXZERHREthQmpEWitkL2ls?=
 =?utf-8?B?SnVyRHFSOFV4aDBnV3hSZmJyWnZ3cTNqUUpwNXlodFpZTm5JdlJXMUNMVHBV?=
 =?utf-8?B?QTI0b2FqWGFuTXhOenVJa3RaeGloa1dmSTJHVnF3cFJFRDQyb1Rvdk5Gakx0?=
 =?utf-8?B?Sk5ZR05MMTR0ay9XMnVudzEzV1g2S1dOUGhEZHJxY1JwbjZuK3dsRVFmS0gv?=
 =?utf-8?B?WXpROTNkdDRHZmNHMlV1ZWZZbkV0OVNFbzNxV1hrdWFiMnpyVUlKS3JKRVlC?=
 =?utf-8?B?ckhWckZxQ1gyMHRmSlo2V2xpeGQ0c1VqZ3lpWVhzNENKY1FsVTBpQnF1bWdX?=
 =?utf-8?B?QnZOaWRidG5ESXB6aDdLTDIreUtjcnZxckhkSW5XWHBCWStnNWx2TFVlTkNl?=
 =?utf-8?B?NDREYmpvR1kzcUpYckkvTDdiVFcyN0dISVdEUlB6eVZzcmovM2xHL1FsRTBC?=
 =?utf-8?B?dnNqSWJNZk1XU1N5K2ViNkRmOEd3MG0rUW5iL0ttOHZvdWRxSzZKM01DVmxS?=
 =?utf-8?B?U09TOXRZcUxaaHI2Qm5vMWxjY2hUZEc5Z0RDUU45M1R1elNJbGw2SkNWMkY2?=
 =?utf-8?B?RFZzNWVKTnplYUZaNjZJdTRPSDl5Nmo2V2dna1pXdkdxd1c5SzRsTmFIS3lk?=
 =?utf-8?B?cVc2akFMM0N1STNmeFBJR2Z6d1lySjVGSG1KWGpObkIrTmsvRU9XRHB0S3Qx?=
 =?utf-8?B?OVliRVFzOEY1emRySkZIcjZWZkg1NEY3YnZzcDg0Y2ZHWkhpOGwxOVEzK3d1?=
 =?utf-8?B?WGg0OW12NzJ5QWcwdXBaY1ExSmptYTNpaVI0Y3JraE9CaXdOMTRmZk5WZFB2?=
 =?utf-8?B?QWhOL0NQb1hQK0ZwUklSY2RhWTZGcHplMVltVFIrUkpBS3MyeHJpdmV0UFpi?=
 =?utf-8?B?MlM3K0dHdERXRDFpM2xnUGg3UE94WDVCZFExSFFUSEZiTmpJalV5VC8wQVFW?=
 =?utf-8?B?czlocXJHMFJ3TG0wVGNrelR2eTNpeldmVHMxTGtsTSt2aVNrdHNrdmVyWHIv?=
 =?utf-8?B?OFZreitqY3praGpWZVJjQnFNOTNGWENKV3ozTFg4bWx5N3pqcFRpT0podXJo?=
 =?utf-8?B?NHhKcENiTW1KUFo3QlU2WEZPeDZjd28vTlVWdnMrRjJuQkdWaEJaazQyeGJI?=
 =?utf-8?B?WW5reFNkYS90emRaOHBUNnZnbjBSeTNLZy90bHFOeHpLMDNrZjlaRmJqRGFQ?=
 =?utf-8?Q?8anWcH08A5Pb/3nc576mM6s=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH2PR12MB421519DD2C446F5C8149ACC5FC499CH2PR12MB4215namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4215.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a705835e-72d0-48d1-dc61-08db626d5f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 06:56:49.5992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZTn++sPsHe6rjyR21fmFlNF8eb2z+th/Qju7dymHwblE0XWIIwGHAqOKB9BRR3V+FrI0+31YjiboD2Dqa94ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Yang, Stanley" <Stanley.Yang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Li, Candice" <Candice.Li@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_CH2PR12MB421519DD2C446F5C8149ACC5FC499CH2PR12MB4215namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCk9LLCB0aGFua3MhDQoNCg0KLS0t
LS0tLS0tLS0tLS0tLS0NCkJlc3QgUmVnYXJkcywNClRob21hcw0KDQpGcm9tOiBDaHJpc3RpYW4g
S8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NClNlbnQ6IFRodXJzZGF5
LCBKdW5lIDEsIDIwMjMgMjoyNSBQTQ0KVG86IFBhbmVlciBTZWx2YW0sIEFydW5wcmF2aW4gPEFy
dW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20+OyBDaGFpLCBUaG9tYXMgPFlpUGVuZy5DaGFp
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFpob3UxLCBUYW8g
PFRhby5aaG91MUBhbWQuY29tPjsgWWFuZywgU3RhbmxleSA8U3RhbmxleS5ZYW5nQGFtZC5jb20+
OyBDaGFpLCBUaG9tYXMgPFlpUGVuZy5DaGFpQGFtZC5jb20+OyBMaSwgQ2FuZGljZSA8Q2FuZGlj
ZS5MaUBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQpTdWJqZWN0OiBSZTog
W1BBVENIXSBkcm0vYW1kZ3B1OiBjaGFuZ2UgcmVzZXJ2ZWQgdnJhbSBpbmZvIHByaW50DQoNCklm
IHlvdSBoYXZlbid0IGFscmVhZHkgcHVzaGVkIGl0IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+PG1haWx0bzpjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+IGFzIHdlbGwuDQoNCllvdSBtaWdodCB3YW50IHRvIGFkZCBhIENDOiBzdGFibGUuLi4g
dGFnIHNvIHRoYXQgaXQgZ2V0cyBiYWNrcG9ydGVkLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0K
QW0gMDEuMDYuMjMgdW0gMDg6MTMgc2NocmllYiBBcnVucHJhdmluIFBhbmVlciBTZWx2YW06DQoN
ClJldmlld2VkLWJ5OiBBcnVucHJhdmluIFBhbmVlciBTZWx2YW0gPEFydW5wcmF2aW4uUGFuZWVy
U2VsdmFtQGFtZC5jb208bWFpbHRvOkFydW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20+Pg0K
DQpPbiA1LzI1LzIwMjMgMjoyMCBQTSwgWWlQZW5nIENoYWkgd3JvdGUNCg0KVGhlIGxpbmsgb2Jq
ZWN0IG9mIG1nci0+cmVzZXJ2ZWRfcGFnZXMgaXMgdGhlIGJsb2Nrcw0KDQp2YXJpYWJsZSBpbiBz
dHJ1Y3QgYW1kZ3B1X3ZyYW1fcmVzZXJ2YXRpb24sIG5vdCB0aGUNCg0KbGluayB2YXJpYWJsZSBp
biBzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrLg0KDQoNCg0KU2lnbmVkLW9mZi1ieTogWWlQZW5nIENo
YWkgPFlpUGVuZy5DaGFpQGFtZC5jb20+PG1haWx0bzpZaVBlbmcuQ2hhaUBhbWQuY29tPg0KDQot
LS0NCg0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgNyAr
KysrLS0tDQoNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KDQoNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMN
Cg0KaW5kZXggODlkMzVkMTk0ZjJjLi5jNzA4NWE3NDdiMDMgMTAwNjQ0DQoNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQoNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQoNCkBAIC04MzksNyArODM5LDcg
QEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZyYW1fbWdyX2RlYnVnKHN0cnVjdCB0dG1fcmVzb3VyY2Vf
bWFuYWdlciAqbWFuLA0KDQogew0KDQogICBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyICptZ3IgPSB0
b192cmFtX21ncihtYW4pOw0KDQogICBzdHJ1Y3QgZHJtX2J1ZGR5ICptbSA9ICZtZ3ItPm1tOw0K
DQotICBzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICpibG9jazsNCg0KKyAgc3RydWN0IGFtZGdwdV92
cmFtX3Jlc2VydmF0aW9uICpyc3Y7DQoNCg0KDQogICBkcm1fcHJpbnRmKHByaW50ZXIsICIgIHZp
cyB1c2FnZTolbGx1XG4iLA0KDQogICAgICAgICAgICAgIGFtZGdwdV92cmFtX21ncl92aXNfdXNh
Z2UobWdyKSk7DQoNCkBAIC04NTEsOCArODUxLDkgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZyYW1f
bWdyX2RlYnVnKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLA0KDQogICBkcm1fYnVk
ZHlfcHJpbnQobW0sIHByaW50ZXIpOw0KDQoNCg0KICAgZHJtX3ByaW50ZihwcmludGVyLCAicmVz
ZXJ2ZWQ6XG4iKTsNCg0KLSAgbGlzdF9mb3JfZWFjaF9lbnRyeShibG9jaywgJm1nci0+cmVzZXJ2
ZWRfcGFnZXMsIGxpbmspDQoNCi0gICAgIGRybV9idWRkeV9ibG9ja19wcmludChtbSwgYmxvY2ss
IHByaW50ZXIpOw0KDQorICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHJzdiwgJm1nci0+cmVzZXJ2ZWRf
cGFnZXMsIGJsb2NrcykNCg0KKyAgICAgICAgICBkcm1fcHJpbnRmKHByaW50ZXIsICIlIzAxOGxs
eC0lIzAxOGxseDogJWxsdVxuIiwNCg0KKyAgICAgICAgICAgICAgICAgIHJzdi0+c3RhcnQsIHJz
di0+c3RhcnQgKyByc3YtPnNpemUsIHJzdi0+c2l6ZSk7DQoNCiAgIG11dGV4X3VubG9jaygmbWdy
LT5sb2NrKTsNCg0KIH0NCg0KDQoNCg0K

--_000_CH2PR12MB421519DD2C446F5C8149ACC5FC499CH2PR12MB4215namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAx
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlxARGVuZ1hpYW4i
Ow0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseTpDb25zb2xhczsNCglwYW5vc2UtMToyIDExIDYgOSAyIDIgNCAzIDIgNDt9DQovKiBTdHls
ZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1h
bA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUt
cHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30N
CnByZQ0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJbXNvLXN0eWxlLWxpbms6IkhUTUwgUHJl
Zm9ybWF0dGVkIENoYXIiOw0KCW1hcmdpbjowaW47DQoJZm9udC1zaXplOjEwLjBwdDsNCglmb250
LWZhbWlseToiQ291cmllciBOZXciO30NCnNwYW4uSFRNTFByZWZvcm1hdHRlZENoYXINCgl7bXNv
LXN0eWxlLW5hbWU6IkhUTUwgUHJlZm9ybWF0dGVkIENoYXIiOw0KCW1zby1zdHlsZS1wcmlvcml0
eTo5OTsNCgltc28tc3R5bGUtbGluazoiSFRNTCBQcmVmb3JtYXR0ZWQiOw0KCWZvbnQtZmFtaWx5
OkNvbnNvbGFzO30NCnNwYW4uRW1haWxTdHlsZTIxDQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFs
LXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRv
d3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJ
Zm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4w
aW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjEN
Cgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHht
bD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3ht
bD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6
ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBl
bGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxp
bms9ImJsdWUiIHZsaW5rPSJwdXJwbGUiIHN0eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+DQo8
cCBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Zm9udC1zaXplOjEwcHQ7Y29sb3I6IzAwMDBGRjtt
YXJnaW46NXB0OyIgYWxpZ249IkxlZnQiPg0KW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVy
YWxdPGJyPg0KPC9wPg0KPGJyPg0KPGRpdj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5PSywgdGhhbmtzITxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tLS0tLS0t
LS0tLS0tLS0tLTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+QmVzdCBSZWdh
cmRzLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhvbWFzPG86cD48L286
cD48L3A+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFF
MSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxiPkZyb206PC9iPiBDaHJpc3RpYW4gS8O2bmlnICZsdDtja29lbmlnLmxlaWNodHp1bWVya2Vu
QGdtYWlsLmNvbSZndDsNCjxicj4NCjxiPlNlbnQ6PC9iPiBUaHVyc2RheSwgSnVuZSAxLCAyMDIz
IDI6MjUgUE08YnI+DQo8Yj5Ubzo8L2I+IFBhbmVlciBTZWx2YW0sIEFydW5wcmF2aW4gJmx0O0Fy
dW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20mZ3Q7OyBDaGFpLCBUaG9tYXMgJmx0O1lpUGVu
Zy5DaGFpQGFtZC5jb20mZ3Q7OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxicj4NCjxi
PkNjOjwvYj4gWmhvdTEsIFRhbyAmbHQ7VGFvLlpob3UxQGFtZC5jb20mZ3Q7OyBZYW5nLCBTdGFu
bGV5ICZsdDtTdGFubGV5LllhbmdAYW1kLmNvbSZndDs7IENoYWksIFRob21hcyAmbHQ7WWlQZW5n
LkNoYWlAYW1kLmNvbSZndDs7IExpLCBDYW5kaWNlICZsdDtDYW5kaWNlLkxpQGFtZC5jb20mZ3Q7
OyBLb2VuaWcsIENocmlzdGlhbiAmbHQ7Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tJmd0OzsgWmhh
bmcsIEhhd2tpbmcgJmx0O0hhd2tpbmcuWmhhbmdAYW1kLmNvbSZndDs8YnI+DQo8Yj5TdWJqZWN0
OjwvYj4gUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogY2hhbmdlIHJlc2VydmVkIHZyYW0gaW5mbyBw
cmludDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdp
bi1ib3R0b206MTIuMHB0Ij5JZiB5b3UgaGF2ZW4ndCBhbHJlYWR5IHB1c2hlZCBpdCBSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZw0KPGEgaHJlZj0ibWFpbHRvOmNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbSI+Jmx0O2NocmlzdGlhbi5rb2VuaWdAYW1kLmNvbSZndDs8L2E+IGFzIHdlbGwuPGJy
Pg0KPGJyPg0KWW91IG1pZ2h0IHdhbnQgdG8gYWRkIGEgQ0M6IHN0YWJsZS4uLiB0YWcgc28gdGhh
dCBpdCBnZXRzIGJhY2twb3J0ZWQuPGJyPg0KPGJyPg0KUmVnYXJkcyw8YnI+DQpDaHJpc3RpYW4u
PG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+QW0gMDEuMDYuMjMg
dW0gMDg6MTMgc2NocmllYiBBcnVucHJhdmluIFBhbmVlciBTZWx2YW06PG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4tdG9wOjUuMHB0O21hcmdpbi1ib3R0
b206NS4wcHQiPg0KPHAgc3R5bGU9Im1hcmdpbjowaW4iPlJldmlld2VkLWJ5OiBBcnVucHJhdmlu
IFBhbmVlciBTZWx2YW0gJmx0OzxhIGhyZWY9Im1haWx0bzpBcnVucHJhdmluLlBhbmVlclNlbHZh
bUBhbWQuY29tIj5BcnVucHJhdmluLlBhbmVlclNlbHZhbUBhbWQuY29tPC9hPiZndDs8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDUvMjUvMjAyMyAyOjIwIFBNLCBZaVBlbmcgQ2hh
aSB3cm90ZTxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2lu
LXRvcDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxwcmU+VGhlIGxpbmsgb2JqZWN0IG9m
IG1nci0mZ3Q7cmVzZXJ2ZWRfcGFnZXMgaXMgdGhlIGJsb2NrczxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPnZhcmlhYmxlIGluIHN0cnVjdCBhbWRncHVfdnJhbV9yZXNlcnZhdGlvbiwgbm90IHRoZTxv
OnA+PC9vOnA+PC9wcmU+DQo8cHJlPmxpbmsgdmFyaWFibGUgaW4gc3RydWN0IGRybV9idWRkeV9i
bG9jay48bzpwPjwvbzpwPjwvcHJlPg0KPHByZT48bzpwPiZuYnNwOzwvbzpwPjwvcHJlPg0KPHBy
ZT5TaWduZWQtb2ZmLWJ5OiBZaVBlbmcgQ2hhaSA8YSBocmVmPSJtYWlsdG86WWlQZW5nLkNoYWlA
YW1kLmNvbSI+Jmx0O1lpUGVuZy5DaGFpQGFtZC5jb20mZ3Q7PC9hPjxvOnA+PC9vOnA+PC9wcmU+
DQo8cHJlPi0tLTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDcgKysrKy0tLTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJl
PiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKTxvOnA+PC9v
OnA+PC9wcmU+DQo8cHJlPjxvOnA+Jm5ic3A7PC9vOnA+PC9wcmU+DQo8cHJlPmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jPG86cD48L286cD48L3ByZT4NCjxw
cmU+aW5kZXggODlkMzVkMTk0ZjJjLi5jNzA4NWE3NDdiMDMgMTAwNjQ0PG86cD48L286cD48L3By
ZT4NCjxwcmU+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdy
LmM8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdnJhbV9tZ3IuYzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPkBAIC04MzksNyArODM5
LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZyYW1fbWdyX2RlYnVnKHN0cnVjdCB0dG1fcmVzb3Vy
Y2VfbWFuYWdlciAqbWFuLDxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiB7PG86cD48L286cD48L3By
ZT4NCjxwcmU+ICZuYnNwOyBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyICptZ3IgPSB0b192cmFtX21n
cihtYW4pOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiAmbmJzcDsgc3RydWN0IGRybV9idWRkeSAq
bW0gPSAmYW1wO21nci0mZ3Q7bW07PG86cD48L286cD48L3ByZT4NCjxwcmU+LSZuYnNwOyBzdHJ1
Y3QgZHJtX2J1ZGR5X2Jsb2NrICpibG9jazs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rJm5ic3A7
IHN0cnVjdCBhbWRncHVfdnJhbV9yZXNlcnZhdGlvbiAqcnN2OzxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPiA8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsmbmJzcDsgZHJtX3ByaW50Zihwcmlu
dGVyLCAmcXVvdDsmbmJzcDsgdmlzIHVzYWdlOiVsbHVcbiZxdW90Oyw8bzpwPjwvbzpwPjwvcHJl
Pg0KPHByZT4gJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwO2FtZGdwdV92cmFtX21ncl92aXNfdXNhZ2UobWdyKSk7
PG86cD48L286cD48L3ByZT4NCjxwcmU+QEAgLTg1MSw4ICs4NTEsOSBAQCBzdGF0aWMgdm9pZCBh
bWRncHVfdnJhbV9tZ3JfZGVidWcoc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sPG86
cD48L286cD48L3ByZT4NCjxwcmU+ICZuYnNwOyBkcm1fYnVkZHlfcHJpbnQobW0sIHByaW50ZXIp
OzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiA8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsm
bmJzcDsgZHJtX3ByaW50ZihwcmludGVyLCAmcXVvdDtyZXNlcnZlZDpcbiZxdW90Oyk7PG86cD48
L286cD48L3ByZT4NCjxwcmU+LSZuYnNwOyBsaXN0X2Zvcl9lYWNoX2VudHJ5KGJsb2NrLCAmYW1w
O21nci0mZ3Q7cmVzZXJ2ZWRfcGFnZXMsIGxpbmspPG86cD48L286cD48L3ByZT4NCjxwcmU+LSZu
YnNwOyAmbmJzcDsmbmJzcDsgZHJtX2J1ZGR5X2Jsb2NrX3ByaW50KG1tLCBibG9jaywgcHJpbnRl
cik7PG86cD48L286cD48L3ByZT4NCjxwcmU+KyZuYnNwOyBsaXN0X2Zvcl9lYWNoX2VudHJ5KHJz
diwgJmFtcDttZ3ItJmd0O3Jlc2VydmVkX3BhZ2VzLCBibG9ja3MpPG86cD48L286cD48L3ByZT4N
CjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBkcm1fcHJpbnRmKHByaW50ZXIsICZxdW90OyUjMDE4bGx4LSUjMDE4bGx4OiAlbGx1XG4m
cXVvdDssPG86cD48L286cD48L3ByZT4NCjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyByc3YtJmd0O3N0YXJ0LCByc3YtJmd0O3N0YXJ0ICsgcnN2LSZn
dDtzaXplLCByc3YtJmd0O3NpemUpOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiAmbmJzcDsgbXV0
ZXhfdW5sb2NrKCZhbXA7bWdyLSZndDtsb2NrKTs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4gfTxv
OnA+PC9vOnA+PC9wcmU+DQo8cHJlPiA8bzpwPjwvbzpwPjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Jsb2NrcXVvdGU+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_CH2PR12MB421519DD2C446F5C8149ACC5FC499CH2PR12MB4215namp_--
