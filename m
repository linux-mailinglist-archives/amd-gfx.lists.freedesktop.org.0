Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5C7EA1A6
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Nov 2023 18:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0416510E3CF;
	Mon, 13 Nov 2023 17:04:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DED010E3CF
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Nov 2023 17:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evCBqdnASB6tnvklbPI0+12XoHVurOVE4omqF99GyFXuretjd6qrJHo++vGZaHU6Uam1Bs27CeZVw02uGIKgYPZ7htbMg8FwgnIUYfCDlpMS8hQW02wVbgaL18J9LkzKiGR6UuQHX/IbKVlOjHYGL663FWPzZe3N8Xotzu08ByxsLBb+6Zy9OlMkOEV1BBDRaqrkRw4W53DQJ0vMITutQdfMH44lGoI1VJZCttXAGKswrPPcpIjFMPt6k80xLjjcMeRc3wSj8f8MCac532O3e8Df1bqgyW/3piZznbc/qKCzknh7WuF5Aylcp3uHi5VTMNDL+iRPOIbGWzqQHAixxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK5nQES/UkvKjyoSTpO++4c8HqSYrvKLXoIYW6mTNY0=;
 b=e5Vvib1cMTeb4a97igHQd3wfjNNLPAvJCN3uByp53cOA9kglEEahJJ8VVWkYjYvwMY0Q2wQGqqc4LNkKjbYyu7gnnvLikgLshK54cedZtBtri1IY9XBBC8wbgnG4hNWorB4eUt5CahPb99zdxI7pRAu/0cWSUDCqHE7tDomi0RR+uIkq7DvUh30JEQ8DpqRGcGCQI7BLda9u9kPM7AZS0icWE7e8GBV/l2WESncckUCFAkiMtq5x5F0a1gJVyEWk2tbILic52cATTCuNXbO9xpCpeGU2uQU6/JpjQzkhQgTiMxGHbPiKvsaT5erxPcw3tf9n2JJXpEqjtTnjSFgabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK5nQES/UkvKjyoSTpO++4c8HqSYrvKLXoIYW6mTNY0=;
 b=pTRhrMyIm2GeRBjR2Qn1hOuJSS7O9iIyiajg3CUrtenMtRuZ2lKA/tGKzcumVLN4X6le9+AiRDojlyr9aY6lyWMFfyfS+kAQ+eUi2orhwjiPU2465wDwuvXLq2Q9g9A4bh6RujO15gDKobtK6OB+qq/F2YE40d/4kneZWXeBuAE=
Received: from DM6PR12MB5021.namprd12.prod.outlook.com (2603:10b6:5:208::17)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 17:04:14 +0000
Received: from DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::e8ff:474a:c306:f230]) by DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::e8ff:474a:c306:f230%7]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 17:04:14 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: "Zhu, James" <James.Zhu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 19/24] drm/amdkfd: enable pc sampling stop
Thread-Topic: [PATCH 19/24] drm/amdkfd: enable pc sampling stop
Thread-Index: AQHaDlddRVB0fVi35E+uwYwzW6/mBrBz9JOggAR4XQCAABoSMA==
Date: Mon, 13 Nov 2023 17:04:14 +0000
Message-ID: <DM6PR12MB5021F2E9F4BE17C69FF1128E95B3A@DM6PR12MB5021.namprd12.prod.outlook.com>
References: <20231103131139.766920-1-James.Zhu@amd.com>
 <20231103131139.766920-20-James.Zhu@amd.com>
 <DM6PR12MB50211E7128EDF3D5D6067B9295AEA@DM6PR12MB5021.namprd12.prod.outlook.com>
 <29c443f9-455b-481e-a2ae-f1315e447867@amd.com>
In-Reply-To: <29c443f9-455b-481e-a2ae-f1315e447867@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=2058a164-97d2-4d85-9f27-df62c7116331;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-11-13T16:52:54Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5021:EE_|DM6PR12MB4466:EE_
x-ms-office365-filtering-correlation-id: e4e6e235-a025-4429-c9e8-08dbe46a9047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8bejQXqEE7V3GBfE2D5X8iBlnaYi3JJAAIsJha8TO+AQjS4Qq+Wim+gqNxKBoic2wtDsPVgP2DwJF10xGeUc2SgW6iLHrrpn/3fXoq85CdTZuJZ1CrhMPDvNkuTOkw3UWiorVj51xNAGCH6VR5379RQ5yKV40BDBeLY0HYKGlpD3CTt3UT+gKMXPd6+uduwQlNHzB/cbJzNv7G/fAxwlk6mL+QvTZfvGk2PnZhT9DIAvT09NobxYmMZgfoz/mvvJ27CANx5xkbnoBqITKAC9bUYgVmh3rZl7YfKX157H40yKYdkAX+w4xTgksiGu/H9PO0Z1ne1t57gtJ2QOxXZOzMQAiVmlQ70PzEzVjyMPeYsmLjB4JNzzEjqKIcFzkrDgjGEDHlx0bUDtqIvmZjpLnMRdy+UlsPgvpXz2fGGGDJVnm/cGivqyXFzqLSQ4S2W1XkouM0RhBqMDm4TuJin1sFAwDSX0ZpxhyLroi8NY/+LYOzfc9yAWttELkLXXDFQdd6edjQCokfQKiPWNuLFXYpyOdIAECbZKHfEMTkRDPr67kcRqKrFmh5tR+NaPj8B2kcKBaHdE3qrj60HMziHePZy+3mz6eeEhrRtC7r7ITEImnjN8Pn4XmnRrDzfxBvqP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5021.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38100700002)(122000001)(8676002)(8936002)(4326008)(53546011)(9686003)(7696005)(6506007)(83380400001)(26005)(55016003)(71200400001)(478600001)(66899024)(110136005)(66556008)(66946007)(66476007)(76116006)(66446008)(64756008)(54906003)(316002)(38070700009)(41300700001)(33656002)(52536014)(2906002)(5660300002)(86362001)(4001150100001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkJUQU5nWDE5UHJqNHMxQS82RWJDSzhtVlJnQ29XUDgvVGs3Z0l3Yi9PWE9q?=
 =?utf-8?B?Y2xiYUdPcGNmbzlId3AxZy9CU2Q5RXJYSURzQ1dUMW1pS05OU2tEdjhuSjA1?=
 =?utf-8?B?Tlk5UE5oL0Y3cFdqb0lOcCszVzBzSW1icjZ0bllUYXNWclRoeHJTMm5sVzBI?=
 =?utf-8?B?SE1vZFRlcnVyTXpHeE51Um85TkRuNkhrK2Rzams1NlYwYThwM1pzSVlyZHly?=
 =?utf-8?B?cXJ5RGdMMHpQbHFlTFQ2SS8zNCtCZU5ZMXJ6Zk1FTW0rTDcwUTJNOGFCblEw?=
 =?utf-8?B?VkhqV0U5LzFTazlPNlpCalhoTzVSbEFnaFNnVW1ObWJLMHZubzJaZzRPL21V?=
 =?utf-8?B?Z01yK1VUTTBaU0llU0JxTE41blcrY01OaXREY3kxdmVGVkJEWkRsK1BaS3Mz?=
 =?utf-8?B?eU1Va2NuSWlQZlFya2ZCLytxR2NITVhBMlEyblEvYXAyY2NyeFF6ajJGVFpJ?=
 =?utf-8?B?bEl5WVdqRTRsazJOdjJrQ0tkZkJVR010N2xaUHhyZlkwcEdGY25CbWd0U1gr?=
 =?utf-8?B?SHE4NkhIVlRWVmRUMXBZdTdMWTlHcTlGYnYxTENuVjZzVE42azVUeUtJSDNM?=
 =?utf-8?B?VG5RUHJCMi8rYXNRUnpBN3VOcERIQVpyYU1VL0ZpQkh5U1N0SUtndkJsSWRi?=
 =?utf-8?B?aUZNOUxjeWlZS3BxMEZEZlJWM01ycERLYXpsb0U2V3ZwYS8vVElQemdYK255?=
 =?utf-8?B?UkVqYzZUSkRNZi9uM2FFSkgzVS9Mb2FCRklQSEVVWmZ1VjU0akNHRXJEandr?=
 =?utf-8?B?S3JwMWh2NkV5S2RTbW5pVVZ4NWlvRkxvdVdEd1BvT3FhMVdGU3dpY3NsQXli?=
 =?utf-8?B?WmkvUGlXMDlKNWpqbjc2SFhQMTlIUzhmNVlYNUV2MzhyeFpMV0ZiU1VXckR1?=
 =?utf-8?B?dnA3ZUs1Z0tBbXJyY2NreTNGZkNRQkFUVU53bjU3NWoreXk3TGkvUXB0SWow?=
 =?utf-8?B?aG5PZUdzZXR6TTVMVHNSU3hkN3AxZEtKalVQR0JhMmpGZWdNOE1iWlZWTm81?=
 =?utf-8?B?ZC9JK2xQTGZQUU1zeFFCN1VZUExMM0hOTUwxeEpVNmlZTmsvckxJbkoxZElK?=
 =?utf-8?B?WWFQVW9pSnc0blRXcUVrdEFIeDZwclFna0hReGJnOTdBNDVmVW43NU1EVSt5?=
 =?utf-8?B?QlVDVzhGcHBucVo0MXVqQ2l6c1BOL2ZpTjVBZU5DK1NrNnhzQTlzNXJHU1Rl?=
 =?utf-8?B?T3dxNHBuaEY1RWRBb2tUaGdaZGp2Wk53NVJ1cXQvZU5rYmVLcE1FSTdkVi8v?=
 =?utf-8?B?WnFXZjdkMFoxdm1PVE9aL2llN2tScmVKUzJPSUg1bVpwbC9Md0s5SGUvQ0Js?=
 =?utf-8?B?YVlVT3pudmNwaFB6eUdYMHYyRlRxRnQvTE56ZWZPV3JpL1VBU1NuRUFoaGty?=
 =?utf-8?B?aTI2Ull5WG5vRytWUVk0Qko3eHN0c0laMndMRlp2SVZOQ2lqM042TTBOMGJt?=
 =?utf-8?B?NEQzRGJIWGtGZXE2ZS9lbFllRU9RSG0vTmpiTFRqLzM3Yll3cVVkb21CbVBG?=
 =?utf-8?B?WmF4TkE5ckxVVHkwck84d09teE43aEV1R2ZiSWJYMWltR0lkc0IveVFhT0tC?=
 =?utf-8?B?MEt1SWcvcGhNdUorRDV5TWR0UVBENklSU2ZxRVZ0cjRHZTcwL245R1ErWVc0?=
 =?utf-8?B?MzNROGszUW1YNmR4K0VzMnk1UkJsSEJlUzRKL0tOSXNhcjBNYVBQZ1dEM1pL?=
 =?utf-8?B?OEVtK0MzdnJ5bjRMRExsVEhBRnk0aHQ2UGxtdCt5SVJwckt6OEVqT2hRZjVO?=
 =?utf-8?B?TlA5NGlveS9ZeUt0RFBSS0Npb2t3STNGZFhrTmhrTitoSWd0aDFzYS9DeFBu?=
 =?utf-8?B?eGZxY0V6dkFWVjF6REc2dFU2WVJNMUp3ZFhQdFFoSUJnc0hnQ1VjVHMraTJ6?=
 =?utf-8?B?N1IxUTEvcnZ3V05yN0pWb3VxMzlzTTJRUFlWUVh6ZnVMU0RPVDVVL09BT1V2?=
 =?utf-8?B?RWRKSG9jLzAzaGtkOEpPdWE0ZmRyUnp2cHUxNTlvT3k4UWxid2hsQytGOG9J?=
 =?utf-8?B?VjVnR3RWUVJ3V2lBYU1DZ1hOTzR1N3ZVTGxRcmd6Y3Nwa2ZxbTlKTnczRGI5?=
 =?utf-8?B?T0NENU9icFRkQzBKK2c4endOdis0TUh5UU5uNElHSVNkYnIwTURrK1RKWjBM?=
 =?utf-8?Q?zRGI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR12MB5021F2E9F4BE17C69FF1128E95B3ADM6PR12MB5021namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5021.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e6e235-a025-4429-c9e8-08dbe46a9047
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 17:04:14.1153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabKmsnDQuafHdpQs6zGIaXkxqbo827P0Yt8dHIWpCWQcdK7j/dFzv8lH59BBp3I5P4v/5map7TAwU6U8siY+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Greathouse,
 Joseph" <Joseph.Greathouse@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_DM6PR12MB5021F2E9F4BE17C69FF1128E95B3ADM6PR12MB5021namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQpGcm9tOiBaaHUsIEphbWVz
IDxKYW1lcy5aaHVAYW1kLmNvbT4NClNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTMsIDIwMjMgMTA6
MjAgQU0NClRvOiBZYXQgU2luLCBEYXZpZCA8RGF2aWQuWWF0U2luQGFtZC5jb20+OyBaaHUsIEph
bWVzIDxKYW1lcy5aaHVAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpD
YzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgR3JlYXRob3VzZSwg
Sm9zZXBoIDxKb3NlcGguR3JlYXRob3VzZUBhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAx
OS8yNF0gZHJtL2FtZGtmZDogZW5hYmxlIHBjIHNhbXBsaW5nIHN0b3ANCg0KDQoNCk9uIDIwMjMt
MTEtMTAgMTQ6MDcsIFlhdCBTaW4sIERhdmlkIHdyb3RlOg0KDQpbQU1EIE9mZmljaWFsIFVzZSBP
bmx5IC0gR2VuZXJhbF0NCg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQoNCkZyb206
IFpodSwgSmFtZXMgPEphbWVzLlpodUBhbWQuY29tPjxtYWlsdG86SmFtZXMuWmh1QGFtZC5jb20+
DQoNClNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA5OjEyIEFNDQoNClRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+DQoNCkNjOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+PG1haWx0
bzpGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgR3JlYXRob3VzZSwgSm9zZXBoDQoNCjxKb3NlcGgu
R3JlYXRob3VzZUBhbWQuY29tPjxtYWlsdG86Sm9zZXBoLkdyZWF0aG91c2VAYW1kLmNvbT47IFlh
dCBTaW4sIERhdmlkIDxEYXZpZC5ZYXRTaW5AYW1kLmNvbT48bWFpbHRvOkRhdmlkLllhdFNpbkBh
bWQuY29tPjsgWmh1LA0KDQpKYW1lcyA8SmFtZXMuWmh1QGFtZC5jb20+PG1haWx0bzpKYW1lcy5a
aHVAYW1kLmNvbT4NCg0KU3ViamVjdDogW1BBVENIIDE5LzI0XSBkcm0vYW1ka2ZkOiBlbmFibGUg
cGMgc2FtcGxpbmcgc3RvcA0KDQoNCg0KRW5hYmxlIHBjIHNhbXBsaW5nIHN0b3AuDQoNCg0KDQpT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPjxtYWlsdG86SmFtZXMu
Wmh1QGFtZC5jb20+DQoNCi0tLQ0KDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Bj
X3NhbXBsaW5nLmMgfCAyOCArKysrKysrKysrKysrKysrKy0tDQoNCi0NCg0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgIHwgIDIgKysNCg0KIDIgZmlsZXMgY2hh
bmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGNfc2FtcGxpbmcuYw0KDQpiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wY19zYW1wbGluZy5jDQoNCmluZGV4IDMzZDAwM2Nh
MDA5My4uMmM0YWM1YjRjYzRiIDEwMDY0NA0KDQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcGNfc2FtcGxpbmcuYw0KDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfcGNfc2FtcGxpbmcuYw0KDQpAQCAtMTA4LDEwICsxMDgsMzIgQEAgc3RhdGljIGludCBr
ZmRfcGNfc2FtcGxlX3N0YXJ0KHN0cnVjdA0KDQprZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCwNCg0K
ICAgICAgcmV0dXJuIDA7DQoNCiB9DQoNCg0KDQotc3RhdGljIGludCBrZmRfcGNfc2FtcGxlX3N0
b3Aoc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkKQ0KDQorc3RhdGljIGludCBrZmRfcGNf
c2FtcGxlX3N0b3Aoc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkLA0KDQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwY19zYW1wbGluZ19lbnRyeSAqcGNz
X2VudHJ5KQ0KDQogew0KDQotICAgICByZXR1cm4gLUVJTlZBTDsNCg0KKyAgICAgYm9vbCBwY19z
YW1wbGluZ19zdG9wID0gZmFsc2U7DQoNCisNCg0KKyAgICAgcGNzX2VudHJ5LT5lbmFibGVkID0g
ZmFsc2U7DQoNCisgICAgIG11dGV4X2xvY2soJnBkZC0+ZGV2LT5wY3NfZGF0YS5tdXRleCk7DQoN
CkZvciB0aGUgU1RBUlQvU1RPUC9ERVNUUk9ZIGlvY3RscywgSSB0aGluayB3ZSBjYW4gaG9sZCBw
ZGQtPmRldi0+cGNzX2RhdGEubXV0ZXggdGhyb3VnaCB0aGUgd2hvbGUgSU9DVEwuIFRoZW4gd2Ug
d291bGQgbm90IGhhdmUgdG8gZGVhbCB3aXRoIHRoZSBpbnRlcm1lZGlhdGUgc3RhdGVzIHdoZXJl
IHRoZSBTVEFSVC9TVE9QL0RFU1RST1kgYXJlIGhhcHBlbmluZyBhdCB0aGUgc2FtZSB0aW1lLg0K
W0paXSBwZGQtPmRldi0+cGNzX2RhdGEubXV0ZXggaXMgcGVyIGRldmljZSwgbm90IHBlciBwcm9j
ZXNzLiBJbiB0aGUgZnV0dXJlLCBhbHNvIGl0IHdpbGwgc2hhcmUgcHJvdGVjdGlvbiB3aXRoaW4g
ZGlmZmVyZW50IHBjIHNhbXBsaW5nIG1ldGhvZHMgb24gdGhlIHNhbWUgZGV2aWNlcy4gU28gSSBk
b24ndCB0aGluayBhIGJpZ2dlciBsb2NrIGhlcmUgaXMgZ29vZCBpZGVhLg0KW0RhdmlkXSBJIHRo
aW5rIHRoZSBDUkVBVEUvU1RBUlQvU1RPUC9ERVNUUk9ZIGFjdGlvbnMgYXJlIG5vdCB0aW1lIGNy
aXRpY2FsLiBTbyBpZiB0d28gcHJvY2Vzc2VzIGFyZSB1c2luZyB0aGUgc2FtZSBHUFUsIGl0IGlz
IG9rIGZvciBhbWRncHUgdG8gYmxvY2sgdGhlIDJuZCBwcm9jZXNzIHVudGlsIGFtZGdwdSBoYXMg
ZnVsbHkgY29tcGxldGVkIHRoZSByZXF1ZXN0IGZyb20gdGhlIDFzdCBwcm9jZXNzLiBJIHRoaW5r
IHdlIGFyZSBtYWtpbmcgdGhlIGNvZGUgbW9yZSBjb21wbGV4IGZvciBhIHVzZS1jYXNlIHRoYXQg
d291bGQgYmUgdmVyeSByYXJlLg0KDQoNCisgICAgIHBkZC0+ZGV2LT5wY3NfZGF0YS5ob3N0dHJh
cF9lbnRyeS5iYXNlLmFjdGl2ZV9jb3VudC0tOw0KDQorICAgICBpZiAoIXBkZC0+ZGV2LT5wY3Nf
ZGF0YS5ob3N0dHJhcF9lbnRyeS5iYXNlLmFjdGl2ZV9jb3VudCkgew0KDQorICAgICAgICAgICAg
IFdSSVRFX09OQ0UocGRkLT5kZXYtDQoNCnBjc19kYXRhLmhvc3R0cmFwX2VudHJ5LmJhc2Uuc3Rv
cF9lbmFibGUsIHRydWUpOw0KDQorICAgICAgICAgICAgIHBjX3NhbXBsaW5nX3N0b3AgPSB0cnVl
Ow0KDQorICAgICB9DQoNCisgICAgIG11dGV4X3VubG9jaygmcGRkLT5kZXYtPnBjc19kYXRhLm11
dGV4KTsNCg0KDQoNCisgICAgIGlmIChwY19zYW1wbGluZ19zdG9wKSB7DQoNCisgICAgICAgICAg
ICAga2ZkX3Byb2Nlc3Nfc2V0X3RyYXBfcGNfc2FtcGxpbmdfZmxhZygmcGRkLT5xcGQsDQoNCisg
ICAgICAgICAgICAgICAgICAgICBwZGQtPmRldi0NCg0KcGNzX2RhdGEuaG9zdHRyYXBfZW50cnku
YmFzZS5wY19zYW1wbGVfaW5mby5tZXRob2QsDQoNCitmYWxzZSk7DQoNCisNCg0KKyAgICAgICAg
ICAgICBtdXRleF9sb2NrKCZwZGQtPmRldi0+cGNzX2RhdGEubXV0ZXgpOw0KDQorICAgICAgICAg
ICAgIHBkZC0+ZGV2LT5wY3NfZGF0YS5ob3N0dHJhcF9lbnRyeS5iYXNlLnRhcmdldF9zaW1kID0g
MDsNCg0KKyAgICAgICAgICAgICBwZGQtPmRldi0+cGNzX2RhdGEuaG9zdHRyYXBfZW50cnkuYmFz
ZS50YXJnZXRfd2F2ZV9zbG90ID0gMDsNCg0KKyAgICAgICAgICAgICBXUklURV9PTkNFKHBkZC0+
ZGV2LQ0KDQpwY3NfZGF0YS5ob3N0dHJhcF9lbnRyeS5iYXNlLnN0b3BfZW5hYmxlLCBmYWxzZSk7
DQoNCisgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZwZGQtPmRldi0+cGNzX2RhdGEubXV0ZXgp
Ow0KDQorICAgICB9DQoNCisNCg0KKyAgICAgcmV0dXJuIDA7DQoNCiB9DQoNCg0KDQogc3RhdGlj
IGludCBrZmRfcGNfc2FtcGxlX2NyZWF0ZShzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQs
IEBAIC0yNTEsNw0KDQorMjczLDcgQEAgaW50IGtmZF9wY19zYW1wbGUoc3RydWN0IGtmZF9wcm9j
ZXNzX2RldmljZSAqcGRkLA0KDQogICAgICAgICAgICAgIGlmICghcGNzX2VudHJ5LT5lbmFibGVk
KQ0KDQogICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQUxSRUFEWTsNCg0KICAgICAgICAg
ICAgICBlbHNlDQoNCi0gICAgICAgICAgICAgICAgICAgICByZXR1cm4ga2ZkX3BjX3NhbXBsZV9z
dG9wKHBkZCk7DQoNCisgICAgICAgICAgICAgICAgICAgICByZXR1cm4ga2ZkX3BjX3NhbXBsZV9z
dG9wKHBkZCwgcGNzX2VudHJ5KTsNCg0KICAgICAgfQ0KDQoNCg0KICAgICAgcmV0dXJuIC1FSU5W
QUw7DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5o
DQoNCmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KDQppbmRleCA2MTM5
MTBlMGQ0NDAuLmJhZGFhNGQ2OGNjNCAxMDA2NDQNCg0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3ByaXYuaA0KDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfcHJpdi5oDQoNCkBAIC0yNTksNiArMjU5LDggQEAgc3RydWN0IGtmZF9kZXY7DQoNCiBzdHJ1
Y3Qga2ZkX2Rldl9wY19zYW1wbGluZ19kYXRhIHsNCg0KICAgICAgdWludDMyX3QgdXNlX2NvdW50
OyAgICAgICAgIC8qIE51bSBvZiBQQyBzYW1wbGluZyBzZXNzaW9ucyAqLw0KDQogICAgICB1aW50
MzJfdCBhY3RpdmVfY291bnQ7ICAgICAgLyogTnVtIG9mIGFjdGl2ZSBzZXNzaW9ucyAqLw0KDQor
ICAgICB1aW50MzJfdCB0YXJnZXRfc2ltZDsgICAgICAgLyogdGFyZ2V0IHNpbWQgZm9yIHRyYXAg
Ki8NCg0KKyAgICAgdWludDMyX3QgdGFyZ2V0X3dhdmVfc2xvdDsgIC8qIHRhcmdldCB3YXZlIHNs
b3QgZm9yIHRyYXAgKi8NCg0KICAgICAgYm9vbCBzdG9wX2VuYWJsZTsgICAgICAgICAgIC8qIHBj
IHNhbXBsaW5nIHN0b3AgaW4gcHJvY2VzcyAqLw0KDQogICAgICBzdHJ1Y3QgaWRyIHBjX3NhbXBs
aW5nX2lkcjsNCg0KICAgICAgc3RydWN0IGtmZF9wY19zYW1wbGVfaW5mbyBwY19zYW1wbGVfaW5m
bzsNCg0KLS0NCg0KMi4yNS4xDQoNCg0K

--_000_DM6PR12MB5021F2E9F4BE17C69FF1128E95B3ADM6PR12MB5021namp_
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
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDb25zb2xhczsNCglwYW5vc2UtMToyIDEx
IDYgOSAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWws
IGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6ZTox
MS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFu
Lk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0
ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnByZQ0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7
DQoJbXNvLXN0eWxlLWxpbms6IkhUTUwgUHJlZm9ybWF0dGVkIENoYXIiOw0KCW1hcmdpbjowaW47
DQoJZm9udC1zaXplOjEwLjBwdDsNCglmb250LWZhbWlseToiQ291cmllciBOZXciO30NCnNwYW4u
SFRNTFByZWZvcm1hdHRlZENoYXINCgl7bXNvLXN0eWxlLW5hbWU6IkhUTUwgUHJlZm9ybWF0dGVk
IENoYXIiOw0KCW1zby1zdHlsZS1wcmlvcml0eTo5OTsNCgltc28tc3R5bGUtbGluazoiSFRNTCBQ
cmVmb3JtYXR0ZWQiOw0KCWZvbnQtZmFtaWx5OkNvbnNvbGFzO30NCnNwYW4uRW1haWxTdHlsZTIx
DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNv
LXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDsNCgltc28tbGlnYXR1
cmVzOm5vbmU7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1h
cmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6
V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpz
aGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5k
aWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRp
dCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48
L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVl
IiB2bGluaz0icHVycGxlIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPHAgc3R5bGU9
ImZvbnQtZmFtaWx5OkFyaWFsO2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFyZ2luOjVw
dDtmb250LXN0eWxlOm5vcm1hbDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0aW9uOm5v
bmU7IiBhbGlnbj0iTGVmdCI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF08YnI+
DQo8L3A+DQo8YnI+DQo8ZGl2Pg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVm
dDpzb2xpZCBibHVlIDEuNXB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNC4wcHQiPg0KPGRpdj4NCjxk
aXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRk
aW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9i
PiBaaHUsIEphbWVzICZsdDtKYW1lcy5aaHVAYW1kLmNvbSZndDsgPGJyPg0KPGI+U2VudDo8L2I+
IE1vbmRheSwgTm92ZW1iZXIgMTMsIDIwMjMgMTA6MjAgQU08YnI+DQo8Yj5Ubzo8L2I+IFlhdCBT
aW4sIERhdmlkICZsdDtEYXZpZC5ZYXRTaW5AYW1kLmNvbSZndDs7IFpodSwgSmFtZXMgJmx0O0ph
bWVzLlpodUBhbWQuY29tJmd0OzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8YnI+DQo8
Yj5DYzo8L2I+IEt1ZWhsaW5nLCBGZWxpeCAmbHQ7RmVsaXguS3VlaGxpbmdAYW1kLmNvbSZndDs7
IEdyZWF0aG91c2UsIEpvc2VwaCAmbHQ7Sm9zZXBoLkdyZWF0aG91c2VAYW1kLmNvbSZndDs8YnI+
DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtQQVRDSCAxOS8yNF0gZHJtL2FtZGtmZDogZW5hYmxlIHBj
IHNhbXBsaW5nIHN0b3A8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDIwMjMtMTEtMTAgMTQ6MDcsIFlhdCBT
aW4sIERhdmlkIHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBzdHls
ZT0ibWFyZ2luLXRvcDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxwcmU+W0FNRCBPZmZp
Y2lhbCBVc2UgT25seSAtIEdlbmVyYWxdPG86cD48L286cD48L3ByZT4NCjxwcmU+PG86cD4mbmJz
cDs8L286cD48L3ByZT4NCjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4tdG9wOjUuMHB0O21hcmdp
bi1ib3R0b206NS4wcHQiPg0KPHByZT4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxvOnA+PC9v
OnA+PC9wcmU+DQo8cHJlPkZyb206IFpodSwgSmFtZXMgPGEgaHJlZj0ibWFpbHRvOkphbWVzLlpo
dUBhbWQuY29tIj4mbHQ7SmFtZXMuWmh1QGFtZC5jb20mZ3Q7PC9hPjxvOnA+PC9vOnA+PC9wcmU+
DQo8cHJlPlNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA5OjEyIEFNPG86cD48L286cD48
L3ByZT4NCjxwcmU+VG86IDxhIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZyI+YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8L2E+PG86cD48L286cD48L3ByZT4N
CjxwcmU+Q2M6IEt1ZWhsaW5nLCBGZWxpeCA8YSBocmVmPSJtYWlsdG86RmVsaXguS3VlaGxpbmdA
YW1kLmNvbSI+Jmx0O0ZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20mZ3Q7PC9hPjsgR3JlYXRob3VzZSwg
Sm9zZXBoPG86cD48L286cD48L3ByZT4NCjxwcmU+PGEgaHJlZj0ibWFpbHRvOkpvc2VwaC5HcmVh
dGhvdXNlQGFtZC5jb20iPiZsdDtKb3NlcGguR3JlYXRob3VzZUBhbWQuY29tJmd0OzwvYT47IFlh
dCBTaW4sIERhdmlkIDxhIGhyZWY9Im1haWx0bzpEYXZpZC5ZYXRTaW5AYW1kLmNvbSI+Jmx0O0Rh
dmlkLllhdFNpbkBhbWQuY29tJmd0OzwvYT47IFpodSw8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5K
YW1lcyA8YSBocmVmPSJtYWlsdG86SmFtZXMuWmh1QGFtZC5jb20iPiZsdDtKYW1lcy5aaHVAYW1k
LmNvbSZndDs8L2E+PG86cD48L286cD48L3ByZT4NCjxwcmU+U3ViamVjdDogW1BBVENIIDE5LzI0
XSBkcm0vYW1ka2ZkOiBlbmFibGUgcGMgc2FtcGxpbmcgc3RvcDxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPjxvOnA+Jm5ic3A7PC9vOnA+PC9wcmU+DQo8cHJlPkVuYWJsZSBwYyBzYW1wbGluZyBzdG9w
LjxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPjxvOnA+Jm5ic3A7PC9vOnA+PC9wcmU+DQo8cHJlPlNp
Z25lZC1vZmYtYnk6IEphbWVzIFpodSA8YSBocmVmPSJtYWlsdG86SmFtZXMuWmh1QGFtZC5jb20i
PiZsdDtKYW1lcy5aaHVAYW1kLmNvbSZndDs8L2E+PG86cD48L286cD48L3ByZT4NCjxwcmU+LS0t
PG86cD48L286cD48L3ByZT4NCjxwcmU+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
Y19zYW1wbGluZy5jIHwgMjggKysrKysrKysrKysrKysrKystLTxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPi08bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3ByaXYuaCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB8Jm5i
c3A7IDIgKys8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4gMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wcmU+DQo8cHJlPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcGNfc2FtcGxpbmcuYzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPmIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BjX3NhbXBsaW5nLmM8bzpwPjwvbzpwPjwvcHJlPg0KPHBy
ZT5pbmRleCAzM2QwMDNjYTAwOTMuLjJjNGFjNWI0Y2M0YiAxMDA2NDQ8bzpwPjwvbzpwPjwvcHJl
Pg0KPHByZT4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGNfc2FtcGxpbmcu
YzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wY19zYW1wbGluZy5jPG86cD48L286cD48L3ByZT4NCjxwcmU+QEAgLTEwOCwxMCArMTA4
LDMyIEBAIHN0YXRpYyBpbnQga2ZkX3BjX3NhbXBsZV9zdGFydChzdHJ1Y3Q8bzpwPjwvbzpwPjwv
cHJlPg0KPHByZT5rZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCw8bzpwPjwvbzpwPjwvcHJlPg0KPHBy
ZT4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIDA7PG86cD48L286cD48L3By
ZT4NCjxwcmU+IH08bzpwPjwvbzpwPjwvcHJlPg0KPHByZT48bzpwPiZuYnNwOzwvbzpwPjwvcHJl
Pg0KPHByZT4tc3RhdGljIGludCBrZmRfcGNfc2FtcGxlX3N0b3Aoc3RydWN0IGtmZF9wcm9jZXNz
X2RldmljZSAqcGRkKTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPitzdGF0aWMgaW50IGtmZF9wY19z
YW1wbGVfc3RvcChzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQsPG86cD48L286cD48L3By
ZT4NCjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBz
dHJ1Y3QgcGNfc2FtcGxpbmdfZW50cnkgKnBjc19lbnRyeSk8bzpwPjwvbzpwPjwvcHJlPg0KPHBy
ZT4gezxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPi0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0
dXJuIC1FSU5WQUw7PG86cD48L286cD48L3ByZT4NCjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBib29sIHBjX3NhbXBsaW5nX3N0b3AgPSBmYWxzZTs8bzpwPjwvbzpwPjwvcHJlPg0KPHBy
ZT4rPG86cD48L286cD48L3ByZT4NCjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBwY3Nf
ZW50cnktJmd0O2VuYWJsZWQgPSBmYWxzZTs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IG11dGV4X2xvY2soJmFtcDtwZGQtJmd0O2Rldi0mZ3Q7cGNzX2Rh
dGEubXV0ZXgpOzxvOnA+PC9vOnA+PC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPkZvciB0aGUg
U1RBUlQvU1RPUC9ERVNUUk9ZIGlvY3RscywgSSB0aGluayB3ZSBjYW4gaG9sZCBwZGQtJmd0O2Rl
di0mZ3Q7cGNzX2RhdGEubXV0ZXggdGhyb3VnaCB0aGUgd2hvbGUgSU9DVEwuIFRoZW4gd2Ugd291
bGQgbm90IGhhdmUgdG8gZGVhbCB3aXRoIHRoZSBpbnRlcm1lZGlhdGUgc3RhdGVzIHdoZXJlIHRo
ZSBTVEFSVC9TVE9QL0RFU1RST1kgYXJlIGhhcHBlbmluZyBhdCB0aGUgc2FtZSB0aW1lLjxvOnA+
PC9vOnA+PC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bWFyZ2luLWxlZnQ6NS4yNXB0Ij5bSlpdIHBkZC0mZ3Q7ZGV2LSZndDtwY3NfZGF0YS5tdXRleCBp
cyBwZXIgZGV2aWNlLCBub3QgcGVyIHByb2Nlc3MuIEluIHRoZSBmdXR1cmUsIGFsc28gaXQgd2ls
bCBzaGFyZSBwcm90ZWN0aW9uIHdpdGhpbiBkaWZmZXJlbnQgcGMgc2FtcGxpbmcgbWV0aG9kcyBv
biB0aGUgc2FtZSBkZXZpY2VzLiBTbyBJIGRvbid0IHRoaW5rIGEgYmlnZ2VyIGxvY2sgaGVyZSBp
cyBnb29kDQogaWRlYS48YnI+DQpbRGF2aWRdIEkgdGhpbmsgdGhlIENSRUFURS9TVEFSVC9TVE9Q
L0RFU1RST1kgYWN0aW9ucyBhcmUgbm90IHRpbWUgY3JpdGljYWwuIFNvIGlmIHR3byBwcm9jZXNz
ZXMgYXJlIHVzaW5nIHRoZSBzYW1lIEdQVSwgaXQgaXMgb2sgZm9yIGFtZGdwdSB0byBibG9jayB0
aGUgMjxzdXA+bmQ8L3N1cD4gcHJvY2VzcyB1bnRpbCBhbWRncHUgaGFzIGZ1bGx5IGNvbXBsZXRl
ZCB0aGUgcmVxdWVzdCBmcm9tIHRoZSAxPHN1cD5zdDwvc3VwPiBwcm9jZXNzLiBJDQogdGhpbmsg
d2UgYXJlIG1ha2luZyB0aGUgY29kZSBtb3JlIGNvbXBsZXggZm9yIGEgdXNlLWNhc2UgdGhhdCB3
b3VsZCBiZSB2ZXJ5IHJhcmUuPGJyPg0KPGJyPg0KPG86cD48L286cD48L3A+DQo8YmxvY2txdW90
ZSBzdHlsZT0ibWFyZ2luLXRvcDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxibG9ja3F1
b3RlIHN0eWxlPSJtYXJnaW4tdG9wOjUuMHB0O21hcmdpbi1ib3R0b206NS4wcHQiPg0KPHByZT4r
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHBkZC0mZ3Q7ZGV2LSZndDtwY3NfZGF0YS5ob3N0dHJh
cF9lbnRyeS5iYXNlLmFjdGl2ZV9jb3VudC0tOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPismbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCFwZGQtJmd0O2Rldi0mZ3Q7cGNzX2RhdGEuaG9zdHRy
YXBfZW50cnkuYmFzZS5hY3RpdmVfY291bnQpIHs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IFdSSVRFX09OQ0UocGRkLSZndDtkZXYtPG86cD48L286cD48L3ByZT4NCjxi
bG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4tdG9wOjUuMHB0O21hcmdpbi1ib3R0b206NS4wcHQiPg0K
PHByZT5wY3NfZGF0YS5ob3N0dHJhcF9lbnRyeS5iYXNlLnN0b3BfZW5hYmxlLCB0cnVlKTs8bzpw
PjwvbzpwPjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPHByZT4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHBjX3Nh
bXBsaW5nX3N0b3AgPSB0cnVlOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPismbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgfTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPismbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgbXV0ZXhfdW5sb2NrKCZhbXA7cGRkLSZndDtkZXYtJmd0O3Bjc19kYXRhLm11dGV4KTs8
bzpwPjwvbzpwPjwvcHJlPg0KPHByZT48bzpwPiZuYnNwOzwvbzpwPjwvcHJlPg0KPHByZT4rJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChwY19zYW1wbGluZ19zdG9wKSB7PG86cD48L286cD48
L3ByZT4NCjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBrZmRfcHJvY2Vzc19zZXRfdHJhcF9wY19zYW1w
bGluZ19mbGFnKCZhbXA7cGRkLSZndDtxcGQsPG86cD48L286cD48L3ByZT4NCjxwcmU+KyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBwZGQtJmd0O2Rldi08bzpwPjwvbzpwPjwvcHJlPg0KPGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdp
bi10b3A6NS4wcHQ7bWFyZ2luLWJvdHRvbTo1LjBwdCI+DQo8cHJlPnBjc19kYXRhLmhvc3R0cmFw
X2VudHJ5LmJhc2UucGNfc2FtcGxlX2luZm8ubWV0aG9kLDxvOnA+PC9vOnA+PC9wcmU+DQo8L2Js
b2NrcXVvdGU+DQo8cHJlPitmYWxzZSk7PG86cD48L286cD48L3ByZT4NCjxwcmU+KzxvOnA+PC9v
OnA+PC9wcmU+DQo8cHJlPismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgbXV0ZXhfbG9jaygmYW1wO3BkZC0mZ3Q7
ZGV2LSZndDtwY3NfZGF0YS5tdXRleCk7PG86cD48L286cD48L3ByZT4NCjxwcmU+KyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBwZGQtJmd0O2Rldi0mZ3Q7cGNzX2RhdGEuaG9zdHRyYXBfZW50cnkuYmFzZS50YXJn
ZXRfc2ltZCA9IDA7PG86cD48L286cD48L3ByZT4NCjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBwZGQt
Jmd0O2Rldi0mZ3Q7cGNzX2RhdGEuaG9zdHRyYXBfZW50cnkuYmFzZS50YXJnZXRfd2F2ZV9zbG90
ID0gMDs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFdSSVRFX09OQ0Uo
cGRkLSZndDtkZXYtPG86cD48L286cD48L3ByZT4NCjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4t
dG9wOjUuMHB0O21hcmdpbi1ib3R0b206NS4wcHQiPg0KPHByZT5wY3NfZGF0YS5ob3N0dHJhcF9l
bnRyeS5iYXNlLnN0b3BfZW5hYmxlLCBmYWxzZSk7PG86cD48L286cD48L3ByZT4NCjwvYmxvY2tx
dW90ZT4NCjxwcmU+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBtdXRleF91bmxvY2soJmFtcDtwZGQtJmd0O2Rl
di0mZ3Q7cGNzX2RhdGEubXV0ZXgpOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPismbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgfTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPis8bzpwPjwvbzpwPjwvcHJl
Pg0KPHByZT4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiAwOzxvOnA+PC9vOnA+PC9w
cmU+DQo8cHJlPiB9PG86cD48L286cD48L3ByZT4NCjxwcmU+PG86cD4mbmJzcDs8L286cD48L3By
ZT4NCjxwcmU+IHN0YXRpYyBpbnQga2ZkX3BjX3NhbXBsZV9jcmVhdGUoc3RydWN0IGtmZF9wcm9j
ZXNzX2RldmljZSAqcGRkLCBAQCAtMjUxLDc8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rMjczLDcg
QEAgaW50IGtmZF9wY19zYW1wbGUoc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkLDxvOnA+
PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoIXBjc19lbnRyeS0m
Z3Q7ZW5hYmxlZCk8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIC1F
QUxSRUFEWTs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZWxz
ZTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPi0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7cmV0dXJuIGtmZF9wY19zYW1wbGVfc3Rv
cChwZGQpOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIGtmZF9wY19zYW1w
bGVfc3RvcChwZGQsIHBjc19lbnRyeSk7PG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08bzpwPjwvbzpwPjwvcHJlPg0KPHByZT48bzpwPiZuYnNw
OzwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJu
IC1FSU5WQUw7PG86cD48L286cD48L3ByZT4NCjxwcmU+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2Lmg8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5iL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2Lmg8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5p
bmRleCA2MTM5MTBlMGQ0NDAuLmJhZGFhNGQ2OGNjNCAxMDA2NDQ8bzpwPjwvbzpwPjwvcHJlPg0K
PHByZT4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oPG86cD48L286
cD48L3ByZT4NCjxwcmU+KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYu
aDxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPkBAIC0yNTksNiArMjU5LDggQEAgc3RydWN0IGtmZF9k
ZXY7PG86cD48L286cD48L3ByZT4NCjxwcmU+IHN0cnVjdCBrZmRfZGV2X3BjX3NhbXBsaW5nX2Rh
dGEgezxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyB1aW50MzJfdCB1c2VfY291bnQ7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IC8qIE51bSBvZiBQQyBzYW1wbGluZyBzZXNzaW9ucyAqLzxvOnA+PC9vOnA+
PC9wcmU+DQo8cHJlPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB1aW50MzJfdCBhY3Rp
dmVfY291bnQ7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC8qIE51bSBvZiBhY3RpdmUg
c2Vzc2lvbnMgKi88bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHVpbnQzMl90IHRhcmdldF9zaW1kOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyAvKiB0YXJnZXQgc2ltZCBmb3IgdHJhcCAqLzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPism
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdWludDMyX3QgdGFyZ2V0X3dhdmVfc2xvdDsmbmJzcDsg
LyogdGFyZ2V0IHdhdmUgc2xvdCBmb3IgdHJhcCAqLzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBib29sIHN0b3BfZW5hYmxlOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAvKiBwYyBz
YW1wbGluZyBzdG9wIGluIHByb2Nlc3MgKi88bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc3RydWN0IGlkciBwY19zYW1wbGluZ19pZHI7PG86cD48
L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCBr
ZmRfcGNfc2FtcGxlX2luZm8gcGNfc2FtcGxlX2luZm87PG86cD48L286cD48L3ByZT4NCjxwcmU+
LS08bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4yLjI1LjE8bzpwPjwvbzpwPjwvcHJlPg0KPC9ibG9j
a3F1b3RlPg0KPHByZT48bzpwPiZuYnNwOzwvbzpwPjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9k
aXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_DM6PR12MB5021F2E9F4BE17C69FF1128E95B3ADM6PR12MB5021namp_--
