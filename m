Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6E66D115
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Jan 2023 22:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F93B10E4E5;
	Mon, 16 Jan 2023 21:49:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A5610E4E4;
 Mon, 16 Jan 2023 21:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHFca7UT6JhbUIH13M4QucQnxhqvXad0pcHwnGi9wb5frri8dqWgVlDUE0ejXajmuMhzf0KNDzHdiYMgnlTcCohG5Tq5EvS0dKhWWUKqkqetQPtx0NMdJyHwVef3zxuyadiE6lfzCG57tVdJobPArsnPN5t0jz9Nj1bEx67qYgDdgGEBOdKOpfp7s771rXLI72ZrxD0Z4UIx7KEpVlJ4YWdx/qpOf/pQR2JtP5VzK6HFGkJISX75LYsx//+jynGbUvV4LqFl9qSKG/F2IsE+gkZfWVo2H0FTdX1xA6ay7Ii7YvptsmSChY8qGpL2VPCrmPO0yQuD43i4LkZkYv9nEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tR+vHva9koSEauncjLC6KRC/DXTtal6dwmjjCPqvlLY=;
 b=ZPKXWhpKWKvNSXhpfgAeUxzxlGxfxq3lfBveRBlb8OLwvu5LQKPrbypJot8ni4Qb5cxxU6LZcTIVle4ssZ4rubdcCw27vDDBP6ADRgCU+mN068jgx9JuFdNxoGVHWUQLDrTr/x3qs+DV9plWLOySUuD2qT6SPUSKvux87ZWxK6pwi+7hb/vfH+dq+nf8Olc+pMrfEwuUIzA3kzr6sTf0Q6OIuyDwQR7AFX3DxzCJiX9qfHh5rWJiK4tN50sPZ2gi/Pk2rK9KlsF/w23KQgsZTRxzYkikBBJ3ZxIXrLTYf9FII9NPxc5GqsoFfI4/TOleSjN5OCO9CqLL4TnoF/NmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tR+vHva9koSEauncjLC6KRC/DXTtal6dwmjjCPqvlLY=;
 b=I6To88lLY7vJIz8qLYOU+HjLSPJfa4F2TNZR+nez5CNUXV7IS+pR5OzNwaoSdhuWmq3hD6rcltJkwUZH1bhc/D/urLC/aG6GP26D3L9UOERQ7ew0pXGIYvtSVP9fid58yZp1eDW42YQ0LiP9Tak+TmKU0XsnlAdizn5piqpFUSM=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8212.namprd12.prod.outlook.com (2603:10b6:610:120::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 21:49:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%8]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 21:49:04 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
Subject: RE: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking
 code
Thread-Topic: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking
 code
Thread-Index: AQHZKfBniOhRmnIod0ePcFbgBpBW7a6hkroAgAAAdrA=
Date: Mon, 16 Jan 2023 21:49:04 +0000
Message-ID: <MN0PR12MB6101142C0E3653D7DA57866EE2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-2-gpiccoli@igalia.com>
 <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
In-Reply-To: <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-16T21:49:02Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1ceeb318-4b49-436c-9a45-501a30ba3326;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-16T21:49:02Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 7b4ddc82-038b-4e1a-a6a2-7b41bcc11265
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH3PR12MB8212:EE_
x-ms-office365-filtering-correlation-id: 2979c7d7-1358-4aeb-5133-08daf80b7c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gAaeRW8gQMvZqKYgc7m1T/mE62/UEVsowgSKjrJeqpITBXphYAvPABikPTdRnRYX5t0cSe2n75uUZliPJ/N09tV2wYp9H8+OZA5cirGBhjTGweC0XRO4aS9OOSHZRC/sOjjzGQKn67HwejjDLbSzXkjBg63rDF8ZKNMrzexPZiXN2N7q5nUq2Pt/dFohh9W01x0Wt+e0EIQYWJdcdo5JxCor8XCdu7LPY0/16vDXbUti4vlql7/qkS3Xm+wqb1iI++FsnWhXMJ8DfT+Mq5EbgxlUqOb5pg4Kt8UXj6ft7/quWVf0PKndBdfre3+rAi879wRZEFyhsKVfN77zgAdkDdMCAK5psmhmc1FmmlIAT6OA78HOiAhNylDslCGL41MGNjgTP5+4EpJxCx+DbyCUrv7hfw78nDH/jE7e9vzHz7DGJM2eqZlJAh5cQp5FzrDljTYSSTK7pVI+vwWxM7sGM3qy4GQstzDfr2x+X45oulnNMgDABwPwPq9AnOr1xhUbsjmThW2k08frno+utKrxH1B4+0hEMRhJsQYrPPtCV3jiURn02w5jAUqtMRBbFyaZtxb3xstx3NBBg6kXfQ8gY71A5nadQx0TU9PUbqFfuEW7z8A+S/5lEU3I4Xmzxfc9RE+MlXhV2rRw1SDEnSdr757ednzLgzkaBzNVz463SX5MxWG1x8bcYevBPuqO0OFmGvsJEYa2cQBUUJAJKKypRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(86362001)(33656002)(64756008)(186003)(53546011)(4326008)(8676002)(9686003)(66556008)(76116006)(66946007)(66446008)(26005)(66476007)(41300700001)(6506007)(316002)(83380400001)(71200400001)(7696005)(54906003)(110136005)(478600001)(122000001)(38100700002)(38070700005)(2906002)(52536014)(5660300002)(8936002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFJsWTVtRGV5b2gzRzVPRTNQWW00aFJrUFBhQU1sNnVqMkJqN2JNb3lxWnUz?=
 =?utf-8?B?cmRyaXhGM3djUE9BLzYreXhic2Qxb1ZOcm5GbHF0YjY5L2RTVVBOaHp1K3lI?=
 =?utf-8?B?U3NGa2lOVXBNOVNYWDVESlNSVkl6RHZlWll0ano3Yi8zUXRNdkpZK3BVYTlP?=
 =?utf-8?B?dWxETmx0ZzYzaGNzNFAzTyt0MkhQck82VmoydEdIZWJsOExBcnJnZFUvQW0v?=
 =?utf-8?B?NG83R3Y4dVQ1dWdCMGNCRWs3R1J5QkZsQUZyanFRNVFYRW9jekt3Qk5SL05w?=
 =?utf-8?B?ek9tdmJaSWlaZDRhSFoxOFVySXlHd0lvRDFrZkI0L2JsUWtQQ3NieUpIZ2FL?=
 =?utf-8?B?S1krSWY5cENtcktIbmlCVjl1L1NzL2VMY1F2UmxxOGhaR2FURkhWejU1RTR5?=
 =?utf-8?B?Q3IwZUZ6b3VQbnFTTjdUVERmR0ZhSjRtZm1wU3R4WEZ3SXByaGNxbDFQT284?=
 =?utf-8?B?YkhpQStCWnZzOWR4MkVvUmxEODJ0RHF4V2ZGU1dhbWdSRVpqTXhtREVCanVq?=
 =?utf-8?B?TXhqTDZ3NDIrbzVJd0tqOHZjTDlkcUtaRWJWVDdIeHBCNFJqQ0lHREoxb3lj?=
 =?utf-8?B?a2YzOUtMQ01WaXYwVnVCVE8zbEdQYlVWbHB3S2M2MmlVZTBVeExUQXBkcVZI?=
 =?utf-8?B?RVphQnB1eWJIS1dpWXd4bVVCbzIyRjB2RWFEVkFtVkVURUFzZy9VVGRjazN3?=
 =?utf-8?B?eW5SRmNlQm1PL01aU3B5V0FuNkp2NW1hb0JBVlhTOHJqMTErbXl6NFVhWHhU?=
 =?utf-8?B?L29xc2JWcFdwQzFhN3BJVkNmdXNhRU1jNDl1aGxqNEUyaUF3d2srSWJROW4w?=
 =?utf-8?B?TTVPclA2T0JDa2lNbHFxU3FjcTE0dEIySW9TdW1tT3NRUXo5UVgxZC92SG03?=
 =?utf-8?B?UStkZGJoWFVwRGErSzY3RXFmbVZ0TFpodVo3U1lnRDZpNFVWWlFOSEFZTmxH?=
 =?utf-8?B?MlRqTmNLQUQzWG9kcFhJamtMMExnbk5ocStCMFZXc0xMRldJczZiYWtXT2Nw?=
 =?utf-8?B?bjVKbzVqalNSclRCT2piU29DdThNR1d1R0UxTEphbzd6MURpNUJVcmpaWnBI?=
 =?utf-8?B?T1V0aG9tU2RzdDJlZkVobitwWDllNFBzTGNrNkpteS8vWmxsaWRSOFBJblFL?=
 =?utf-8?B?ZG5BNkRSek9rb1daT2Vxdi9mWVArQ2wveGhYNE1YeGpTOXB5NUM0RTY1bW56?=
 =?utf-8?B?OTRhWHI0aUE1MEZhVjR1L0orQXV1RUY4aDBDbzQxc1h4cFZtV3NJejg4aVd3?=
 =?utf-8?B?ejc5VXdUajJUNlJLTUZEbTNVRWE2SjJxaysrYXZsQnF5SEtvRnkvdnFacEtH?=
 =?utf-8?B?RklpT0d2OFhWZlhydnhiYVdudWpnUXpRU0VoWjh0dGlORk5ua1E0MnFhQ0NT?=
 =?utf-8?B?RTdnQ3AxemxZZ1VxcTFDVU15am1HbFhNRjdHbzdzVlNBVlgwMUl6SGNEV3A1?=
 =?utf-8?B?ZWRFNVkyeXRsakEyT3VkUmtYZWdSaS9KVFk5b2tDMFRBTmFLL25OT0hDOHFN?=
 =?utf-8?B?akNXNmZhcmluTnR5bDRjdTI4UnVkRHZFRTNieDFXUUh4R2NuVHZyUkROaU1z?=
 =?utf-8?B?V29aL1NDS0Fpcnp5MlExbkhjZGtEN2hqZktpQVZma1JDRGQremd5UVZ0K0tx?=
 =?utf-8?B?QkM2ZWN5U2VyLzV4NUJjb3c2WjJhbDBqdGh4Y3B0dGl5Y0ZVOVcvT2pKZ29D?=
 =?utf-8?B?c3cvckxnaVl0WlhFSGlKOCsyMENWdHkyT0FlSEI4enE1SDZOUVRvQ3I4Y053?=
 =?utf-8?B?cnc5UXJtSW1sY0lVZHEzNTByandDMnRhdU5lSGZXSUg3YjlMWnlmdStJYk9C?=
 =?utf-8?B?NDVqMnE5a29WTGcyNE4vajg3YkRGYjIzVUZwKzdKTHRYWTBDNG1GMlZkblpM?=
 =?utf-8?B?ZncreU1LK1U4UDdibkd2dURCM0Z0Sy9tWElxMUt0SGlsVGYzZmphWG4rNlU0?=
 =?utf-8?B?QmJOTTBWTXRkSjJtbUE3VFl3bHNjVU94N05Ub1EzM0drYjh3ZEZVcWd0YzZZ?=
 =?utf-8?B?dVVVQ0FmR0RIa3NqTHB3VUh3bmtPZS8vR3RULzFOY1NHdGNZVkJ2dTByTW42?=
 =?utf-8?B?TTNUaDFpWEwrdi9FeTZJdTBNWUdYOGRVUFBNS2xvaXFzQkdIa2xTWUVWejFm?=
 =?utf-8?Q?xdIE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2979c7d7-1358-4aeb-5133-08daf80b7c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 21:49:04.4129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WoPkBjff+RYt6Uu0bfl3rVkOCiRO37jTQWES4Ra8hxI5Qxkyn/3ezpVKFOV0Cd5wmu9/WiaWDkmofsya541GBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8212
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang, 
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxl
eCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFy
eSAxNiwgMjAyMyAxNTo0Mg0KPiBUbzogR3VpbGhlcm1lIEcuIFBpY2NvbGkgPGdwaWNjb2xpQGln
YWxpYS5jb20+DQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSmlhbmcsIFNv
bm55IDxTb25ueS5KaWFuZ0BhbWQuY29tPjsNCj4ga2VybmVsQGdwaWNjb2xpLm5ldDsgUGFuLCBY
aW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPjsgTGltb25jaWVsbG8sDQo+
IE1hcmlvIDxNYXJpby5MaW1vbmNpZWxsb0BhbWQuY29tPjsga2VybmVsLWRldkBpZ2FsaWEuY29t
OyBEZXVjaGVyLA0KPiBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBaaHUs
IEphbWVzDQo+IDxKYW1lcy5aaHVAYW1kLmNvbT47IExpdSwgTGVvIDxMZW8uTGl1QGFtZC5jb20+
OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDIvM10gZHJtL2FtZGdwdS92Y246IERlZHVwbGljYXRlIGluZGlyZWN0
IFNSQU0NCj4gY2hlY2tpbmcgY29kZQ0KPiANCj4gT24gTW9uLCBKYW4gMTYsIDIwMjMgYXQgNDoy
MCBQTSBHdWlsaGVybWUgRy4gUGljY29saQ0KPiA8Z3BpY2NvbGlAaWdhbGlhLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBDdXJyZW50bHkgYm90aCBjb25kaXRpb25hbHMgY2hlY2tlZCB0byBlbmFibGUg
aW5kaXJlY3QgU1JBTSBhcmUNCj4gPiByZXBlYXRlZCBmb3IgYWxsIEhXL0lQIG1vZGVscy4gTGV0
J3MganVzdCBzaW1wbGlmeSBpdCBhIGJpdCBzbw0KPiA+IGNvZGUgaXMgbW9yZSBjb21wYWN0IGFu
ZCByZWFkYWJsZS4NCj4gPg0KPiA+IFdoaWxlIGF0IGl0LCBhZGQgdGhlIGxlZ2FjeSBuYW1lcyBh
cyBhIGNvbW1lbnQgcGVyIGNhc2UgYmxvY2ssIHRvDQo+ID4gaGVscCB3aG9ldmVyIGlzIHJlYWRp
bmcgdGhlIGNvZGUgYW5kIGRvZXNuJ3QgaGF2ZSBtdWNoIGV4cGVyaWVuY2UNCj4gPiB3aXRoIHRo
ZSBuYW1lL251bWJlciBtYXBwaW5nLg0KPiA+DQo+ID4gQ2M6IEphbWVzIFpodSA8SmFtZXMuWmh1
QGFtZC5jb20+DQo+ID4gQ2M6IExhemFyIExpam8gPExpam8uTGF6YXJAYW1kLmNvbT4NCj4gPiBD
YzogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KPiA+IENjOiBNYXJpbyBMaW1vbmNpZWxsbyA8
bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbT4NCj4gPiBDYzogU29ubnkgSmlhbmcgPHNvbm55Lmpp
YW5nQGFtZC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3VpbGhlcm1lIEcuIFBpY2NvbGkgPGdw
aWNjb2xpQGlnYWxpYS5jb20+DQo+ID4gLS0tDQo+ID4NCj4gPg0KPiA+IEhpIGZvbGtzLCBmaXJz
dCBvZiBhbGwgdGhhbmtzIGluIGFkdmFuY2UgZm9yIHJldmlld3MvY29tbWVudHMhDQo+ID4NCj4g
PiBUaGlzIHdvcmsgaXMgYmFzZWQgb24gYWdkNWYvYW1kLXN0YWdpbmctZHJtLW5leHQgYnJhbmNo
IC0gdGhlcmUgaXMgdGhpcw0KPiA+IHBhdGNoIGZyb20gTWFyaW8gdGhhdCByZWZhY3RvcmVkIHRo
ZSBhbWRncHVfdmNuLmMsIGFuZCBzaW5jZSBpdCBkcm9wcGVkDQo+ID4gdGhlIGxlZ2FjeSBuYW1l
cyBmcm9tIHRoZSBzd2l0Y2ggY2FzZXMsIEkndmUgZGVjaWRlZCB0byBhbHNvIGluY2x1ZGUgdGhl
bQ0KPiA+IGhlcmUgYXMgY29tbWVudHMuDQo+ID4NCj4gPiBJJ20gbm90IHN1cmUgaWYgdGhhdCdz
IGEgZ29vZCBpZGVhLCBmZWVscyBnb29kIGZvciBzb21lYm9keSBub3Qgc28NCj4gPiB1c2VkIHRv
IHRoZSBjb2RlIHJlYWQgdGhlIGNvZGVuYW1lcyBpbnN0ZWFkIG9mIHB1cmVseSBudW1iZXJzLCBi
dXQNCj4gPiBpZiB5b3Ugd2FubmEgbW92ZSBhd2F5IGZyb20gdGhlIGxlZ2FjeSBuYW1lcyBmb3Ig
Z29vZCwgbGVtbWUga25vdw0KPiA+IGFuZCBJIGNhbiByZXdvcmsgd2l0aG91dCB0aGVzZSBjb21t
ZW50cy4NCj4gPg0KPiA+IENoZWVycywNCj4gPg0KPiA+DQo+ID4gR3VpbGhlcm1lDQo+ID4NCj4g
Pg0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA4NCArKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCA2OCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNuLmMNCj4gPiBpbmRleCAxYjFhM2M5ZTE4NjMuLjFmODgwZTE2MmQ5ZCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMNCj4gPiBAQCAt
MTExLDc4ICsxMTEsMjYgQEAgaW50IGFtZGdwdV92Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZQ0KPiAqYWRldikNCj4gPiAgICAgICAgICAgICAgICAgYXRvbWljX3NldCgmYWRldi0+dmNu
Lmluc3RbaV0uZHBnX2VuY19zdWJtaXNzaW9uX2NudCwgMCk7DQo+ID4NCj4gPiAgICAgICAgIHN3
aXRjaCAoYWRldi0+aXBfdmVyc2lvbnNbVVZEX0hXSVBdWzBdKSB7DQo+ID4gLSAgICAgICBjYXNl
IElQX1ZFUlNJT04oMSwgMCwgMCk6DQo+ID4gLSAgICAgICBjYXNlIElQX1ZFUlNJT04oMSwgMCwg
MSk6DQo+ID4gLSAgICAgICBjYXNlIElQX1ZFUlNJT04oMiwgNSwgMCk6DQo+ID4gLSAgICAgICAg
ICAgICAgIGlmICgoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BT
UCkgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAgIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19T
VVBQT1JUX1ZDTl9EUEcpKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPnZjbi5p
bmRpcmVjdF9zcmFtID0gdHJ1ZTsNCj4gPiAtICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gLSAg
ICAgICBjYXNlIElQX1ZFUlNJT04oMiwgMiwgMCk6DQo+ID4gLSAgICAgICAgICAgICAgIGlmICgo
YWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkgJiYNCj4gPiAt
ICAgICAgICAgICAgICAgICAgIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9E
UEcpKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPnZjbi5pbmRpcmVjdF9zcmFt
ID0gdHJ1ZTsNCj4gPiAtICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gLSAgICAgICBjYXNlIElQ
X1ZFUlNJT04oMiwgNiwgMCk6DQo+ID4gLSAgICAgICAgICAgICAgIGlmICgoYWRldi0+ZmlybXdh
cmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkgJiYNCj4gPiAtICAgICAgICAgICAg
ICAgICAgIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpKQ0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsNCj4g
PiAtICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gLSAgICAgICBjYXNlIElQX1ZFUlNJT04oMiwg
MCwgMCk6DQo+ID4gLSAgICAgICAgICAgICAgIGlmICgoYWRldi0+ZmlybXdhcmUubG9hZF90eXBl
ID09IEFNREdQVV9GV19MT0FEX1BTUCkgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAgIChhZGV2
LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpKQ0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGFkZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsNCj4gPiAtICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ID4gLSAgICAgICBjYXNlIElQX1ZFUlNJT04oMiwgMCwgMik6DQo+ID4g
LSAgICAgICAgICAgICAgIGlmICgoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9G
V19MT0FEX1BTUCkgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAgIChhZGV2LT5wZ19mbGFncyAm
IEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGFk
ZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsNCj4gPiAtICAgICAgICAgICAgICAgYnJlYWs7
DQo+ID4gLSAgICAgICBjYXNlIElQX1ZFUlNJT04oMywgMCwgMCk6DQo+ID4gLSAgICAgICBjYXNl
IElQX1ZFUlNJT04oMywgMCwgNjQpOg0KPiA+IC0gICAgICAgY2FzZSBJUF9WRVJTSU9OKDMsIDAs
IDE5Mik6DQo+ID4gLSAgICAgICAgICAgICAgIGlmICgoYWRldi0+ZmlybXdhcmUubG9hZF90eXBl
ID09IEFNREdQVV9GV19MT0FEX1BTUCkgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAgIChhZGV2
LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpKQ0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGFkZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsNCj4gPiAtICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ID4gLSAgICAgICBjYXNlIElQX1ZFUlNJT04oMywgMCwgMik6DQo+ID4g
LSAgICAgICAgICAgICAgIGlmICgoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9G
V19MT0FEX1BTUCkgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAgIChhZGV2LT5wZ19mbGFncyAm
IEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGFk
ZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsNCj4gPiAtICAgICAgICAgICAgICAgYnJlYWs7
DQo+ID4gLSAgICAgICBjYXNlIElQX1ZFUlNJT04oMywgMCwgMTYpOg0KPiA+IC0gICAgICAgICAg
ICAgICBpZiAoKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1Ap
ICYmDQo+ID4gLSAgICAgICAgICAgICAgICAgICAoYWRldi0+cGdfZmxhZ3MgJiBBTURfUEdfU1VQ
UE9SVF9WQ05fRFBHKSkNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBhZGV2LT52Y24uaW5k
aXJlY3Rfc3JhbSA9IHRydWU7DQo+ID4gLSAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+IC0gICAg
ICAgY2FzZSBJUF9WRVJTSU9OKDMsIDAsIDMzKToNCj4gPiAtICAgICAgICAgICAgICAgaWYgKChh
ZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSAmJg0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgKGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQ
RykpDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgYWRldi0+dmNuLmluZGlyZWN0X3NyYW0g
PSB0cnVlOw0KPiA+IC0gICAgICAgICAgICAgICBicmVhazsNCj4gPiAtICAgICAgIGNhc2UgSVBf
VkVSU0lPTigzLCAxLCAxKToNCj4gPiAtICAgICAgICAgICAgICAgaWYgKChhZGV2LT5maXJtd2Fy
ZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSAmJg0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgKGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpDQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgYWRldi0+dmNuLmluZGlyZWN0X3NyYW0gPSB0cnVlOw0KPiA+
IC0gICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIGNhc2UgSVBfVkVSU0lPTigxLCAw
LCAwKTogICAgICAgLyogUmF2ZW4gKDEvMikgLyBQaWNhc3NvICovDQo+ID4gKyAgICAgICBjYXNl
IElQX1ZFUlNJT04oMSwgMCwgMSk6ICAgICAgIC8qIFJhdmVuICgxLzIpIC8gUGljYXNzbyAqLw0K
PiA+ICsgICAgICAgY2FzZSBJUF9WRVJTSU9OKDIsIDAsIDApOiAgICAgICAvKiBOYXZpMTAgKi8N
Cj4gPiArICAgICAgIGNhc2UgSVBfVkVSU0lPTigyLCAwLCAyKTogICAgICAgLyogTmF2aTEyIC8g
TmF2aTE0ICovDQo+ID4gKyAgICAgICBjYXNlIElQX1ZFUlNJT04oMiwgMiwgMCk6ICAgICAgIC8q
IFJlbm9pciAvIEdyZWVuIFNhcmRpbmUgKi8NCj4gPiArICAgICAgIGNhc2UgSVBfVkVSU0lPTigy
LCA1LCAwKTogICAgICAgLyogQXJjdHVydXMgKi8NCj4gPiArICAgICAgIGNhc2UgSVBfVkVSU0lP
TigyLCA2LCAwKTogICAgICAgLyogQWxkZWJhcmFuICovDQo+ID4gKyAgICAgICBjYXNlIElQX1ZF
UlNJT04oMywgMCwgMCk6ICAgICAgIC8qIFNpZW5uYSBDaWNobGlkIC8gTmF2eSBGbG91bmRlciAq
Lw0KPiA+ICsgICAgICAgY2FzZSBJUF9WRVJTSU9OKDMsIDAsIDIpOiAgICAgICAvKiBWYW5nb2do
ICovDQo+ID4gKyAgICAgICBjYXNlIElQX1ZFUlNJT04oMywgMCwgNjQpOiAgICAgIC8qIFNpZW5u
YSBDaWNobGlkIC8gTmF2eSBGbG91bmRlciAqLw0KPiA+ICsgICAgICAgY2FzZSBJUF9WRVJTSU9O
KDMsIDAsIDE2KTogICAgICAvKiBEaW1ncmF5IENhdmVmaXNoICovDQo+ID4gKyAgICAgICBjYXNl
IElQX1ZFUlNJT04oMywgMCwgMzMpOiAgICAgIC8qIEJlaWdlIEdvYnkgKi8NCj4gPiArICAgICAg
IGNhc2UgSVBfVkVSU0lPTigzLCAwLCAxOTIpOiAgICAgLyogU2llbm5hIENpY2hsaWQgLyBOYXZ5
IEZsb3VuZGVyICovDQo+ID4gKyAgICAgICBjYXNlIElQX1ZFUlNJT04oMywgMSwgMSk6ICAgICAg
IC8qIFllbGxvdyBDYXJwICovDQoNClRoZSBwcm9ibGVtIHdpdGggYWRkaW5nIGEgY29tbWVudCBh
Ym91dCB3aGljaCBwbGF0Zm9ybSBpdCdzIGluIGlzIHRoYXQNCnRoaXMgd2lsbCBwcm9iYWJseSBn
byBzdGFsZS4gIFNvbWUgSVAgYmxvY2tzIGFyZSByZS11c2VkIGluIG11bHRpcGxlIEFTSUNzLg0K
DQpWQ04gMywgMSwgMSBpcyBhIGdyZWF0IGV4YW1wbGUuICBUaGlzIGlzIHVzZWQgaW4gYm90aCBZ
ZWxsb3cgQ2FycCAoUmVtYnJhbmR0KSBhcyB3ZWxsDQphcyBNZW5kb2Npbm8uICAgSSB3b3VsZCB0
aGluayBhIGJldHRlciBhcHByb2FjaCB3b3VsZCBiZSB0byBoYXZlIGEgc2luZ2xlIHBvaW50DQpv
ZiBkb2N1bWVudGF0aW9uIHNvbWV3aGVyZSBpbiB0aGUgc291cmNlIHRyZWUgdGhhdCB3ZSBjYW4g
dXBkYXRlIGFmdGVyIG5ldw0KQVNJQ3MgbGF1bmNoIHRoYXQgY291bGQgYWN0IGFzIGEgZGVjb2Rl
ciByaW5nLg0KDQpJdCdzIGVmZm9ydCB0byByZW1lbWJlciB0byB1cGRhdGUgaXQsIGJ1dCBpdCdz
IGF0IGxlYXN0IGEgc2luZ2xlIHBvaW50IG9mIGZhaWx1cmUuDQoNCj4gPiAgICAgICAgIGNhc2Ug
SVBfVkVSU0lPTigzLCAxLCAyKToNCj4gPiAtICAgICAgICAgICAgICAgaWYgKChhZGV2LT5maXJt
d2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSAmJg0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgKGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpDQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgYWRldi0+dmNuLmluZGlyZWN0X3NyYW0gPSB0cnVlOw0K
PiA+IC0gICAgICAgICAgICAgICBicmVhazsNCj4gPiAtICAgICAgIGNhc2UgSVBfVkVSU0lPTig0
LCAwLCAwKToNCj4gPiAtICAgICAgICAgICAgICAgaWYgKChhZGV2LT5maXJtd2FyZS5sb2FkX3R5
cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSAmJg0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpKQ0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGFkZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsNCj4gPiAtICAg
ICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICBjYXNlIElQX1ZFUlNJT04oNCwgMCwgMCk6
ICAgICAgIC8qIFZlZ2ExMCAqLw0KPiANCj4gVGhpcyBjb21tZW50IGlzIGluY29ycmVjdC4gIFZl
Z2ExMCBkb2VzIG5vdCBoYXZlIFZDTiAoaXQgaGFzIFVWRCBhbmQgVkNFKS4NCj4gDQo+IEFsZXgN
Cj4gDQo+IA0KPiBBbGV4DQo+IA0KPiA+ICAgICAgICAgY2FzZSBJUF9WRVJTSU9OKDQsIDAsIDIp
Og0KPiA+IC0gICAgICAgICAgICAgICBpZiAoKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBB
TURHUFVfRldfTE9BRF9QU1ApICYmDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKGFkZXYt
PnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpDQo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgYWRldi0+dmNuLmluZGlyZWN0X3NyYW0gPSB0cnVlOw0KPiA+IC0gICAgICAgICAg
ICAgICBicmVhazsNCj4gPiAgICAgICAgIGNhc2UgSVBfVkVSU0lPTig0LCAwLCA0KToNCj4gPiAg
ICAgICAgICAgICAgICAgaWYgKChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZX
X0xPQURfUFNQKSAmJg0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIChhZGV2LT5wZ19mbGFn
cyAmIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEcpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgKGFk
ZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgYWRldi0+dmNuLmluZGlyZWN0X3NyYW0gPSB0cnVlOw0KPiA+ICAgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiAgICAgICAgIGRlZmF1bHQ6DQo+ID4gLS0NCj4gPiAyLjM5LjAN
Cj4gPg0K
