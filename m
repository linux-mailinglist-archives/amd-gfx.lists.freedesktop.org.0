Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68823963F01
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2024 10:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029A310E152;
	Thu, 29 Aug 2024 08:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zaKE5vJk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3B210E152
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2024 08:50:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTPLZcY4d0vty/FvLVKltC0MiiJ93akEEy8JRL430YxrSQiRnW3JPPzW7GOWlbW3K46WPFQHgUcB1beuPl6D14sqLUSuXv3RkmKz8bO3OgsWFUF2ZiRfZ/IeR0j33pA66fjzNXIcFtnHNsn5v+C+4sv0h5fmO4QSdT0wGHvhMgEnUPfqu5SeuffzT7uFXAVkwUrDa/pq1daORvnJs9XHKQKGG3DAK6QPEJOfEuuNTYGjiRtlHhvcgDSe+DCpyM0u2lWE2ap9sHsLPnqWdvhfTKS+tvVD2OpzYm+Vj5jqYW2XlI/WIz3Hf7/4Fb7mRfpnvW2tBQKPPeQRxkvF3VTXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBdXJf0lvOuby3H8X5INoKLL5NPDv8EFY9FCjLgW7nw=;
 b=i1UtWP5ECHLDJrHUXgy9m+4O7uKGxsaZTe/OdqMj8GFF/kRbrg9R+pu4xY1rihs6yEBTC7CkmqxKE8mRTzfU3N3L0pYoeNieVgTa3KV/Yx3waHHaNjCQozAusLgFr//8G/Yh42sbdImVHRAr+YQcYyy8diwkWPMqzOf02KJFbFMJ/+LGkqegF/Y/X/EhnGPQPYS+G5YLyAXy+Jobcgld0ydGgJmQGJD88MpglNB0XiZZT2Sr05HTMa/nTbb5K6r8uXFTakaniwLiq2XirxGpYFqKGAgsjffegu6R0UuYYokdG3WS+3zeNE99EcP5p+HY/zjEypjeDyjCIIaFDQi6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBdXJf0lvOuby3H8X5INoKLL5NPDv8EFY9FCjLgW7nw=;
 b=zaKE5vJk3wlAKjuuBAJM5MKFHHnwUqa0TeE6+JNRt1ywSiDsoFgiksOjWmu4yuLeLiB+B7EMch1P+R5rPZqRNDas4d7oGAWbgORTzWhKoYE5N73Uev6cMjOXg5iME5iiQfjs2AQkr1Awz1Mq2nkIAnezN3C5fxsmeQMWEc7O+s4=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 08:50:07 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 08:50:07 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Ma, Le" <Le.Ma@amd.com>
Subject: RE: [PATCH v5] drm/amdgpu/gfx9.4.3: Implement compute pipe reset
Thread-Topic: [PATCH v5] drm/amdgpu/gfx9.4.3: Implement compute pipe reset
Thread-Index: AQHa+cZVoGvXm9hksU6UfTGnm9oYHLI94tgAgAAJ0ZA=
Date: Thu, 29 Aug 2024 08:50:07 +0000
Message-ID: <DS7PR12MB60054C786769BD6E191A6D81FB962@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <20240829034712.2896869-1-Prike.Liang@amd.com>
 <8de31021-f391-4003-8b9f-46ad16ff33a1@amd.com>
In-Reply-To: <8de31021-f391-4003-8b9f-46ad16ff33a1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=a23c2996-1fa0-4e71-a23f-2758cf13a1e5;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-29T08:47:40Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|MN2PR12MB4093:EE_
x-ms-office365-filtering-correlation-id: d3368cf1-6a5f-4878-a004-08dcc8079573
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QU05TVhUVTFkRzNLS3JTaStWOXRTcEQzSUJlUk1GdkU5Nmk3QS9ULzFxaHdv?=
 =?utf-8?B?ZzBQclo1Mlh5dXVaTUUrYlN2K2owRWU4eEFLYkZMU1pzaGNCT2pyNHpCakFa?=
 =?utf-8?B?QmpncHMwUzhINjYwTzVpYUxNSmlzOUxmdHRlT2NPbGdRNHo0bHF0RW1ZT3ow?=
 =?utf-8?B?S2dRMXoyRmZGUGVrWEZiUm03a2l0dFZFQUo2Tmd5RnpXZE5UYTdzaE53ZFFx?=
 =?utf-8?B?TEs4a1VIL3VPOWMrQ3IwZFRWUWN0TGQxMnE2Rnl0TVZQVVlJL1h0Uy9QSGF4?=
 =?utf-8?B?MTd4bGtYZDF0bm54R3p0RVZFZXFzNytSOG96ZzZhMS94ZVVGRWRBeHpibnh5?=
 =?utf-8?B?VmMwQVo4ZENLSlc4S1FIL1Z4bmYrKytXalA1cktNR0tDNVl0ZWhlcVNpSHFy?=
 =?utf-8?B?UHZnb3o3R1FlRXJLejA3dFBwTUJDVy9KKzY3cEtyOVZ5OTFjMXh2d1ZkY1F1?=
 =?utf-8?B?MUQ4Y2hwKzdTVDk4Vkw4T3FKWnZaVnpCR3dLa0N5eWFFUmpXK3BhMFErbllx?=
 =?utf-8?B?Wm5pOW5GN3hqYW1UY0h3U0NVRzlvbTI5eG5tOUlvNE1WQ0J2MG5yMmJweGtW?=
 =?utf-8?B?VkpQNHNaUFNkSDhsRUMvODFDRDBTc0xSeXdJZEpvekV5K2FYN2p6Tkl0T3hO?=
 =?utf-8?B?L1cvZVYwTHZnLzF4TkV0bHlFQ2tORUpPdFBJR3ppVVpYODNxckljeFA4RTVa?=
 =?utf-8?B?cktuYk5pWGN5YWlPYUV3aS85N3V5TTdYbFZDdyttaG91enlRSytHYzd2ZStF?=
 =?utf-8?B?S25OZEZrRWpuSWxmU2pFTWNEd3FUWGNCb3paOGtGT2VrczFwZ0NmdWtzeUli?=
 =?utf-8?B?MXprUThqN1ExY3NaNmFjTUFmY3VpTkJveUtqTXNHem43UGhFb2Y2S2Q4Qnky?=
 =?utf-8?B?cnc1TlFURVhQK1A4eGZpVmRLbDd3dURDRU9vMDNUTmRzT3R6U3hFYlJMVDd1?=
 =?utf-8?B?ZHVTOW5ZWENBTFVwcXRsVzRCZHMrTXF2VlNYV2d0QStzbVg4WHU3U2pEWjFm?=
 =?utf-8?B?MWJRZFNYa1d2VUZFLzRucGhsNXdTUFc4TGJQNnBqN0xFVzUwdkozSDZ2Z3k0?=
 =?utf-8?B?cDZyQWVYSGZlT2N1RWkzZ1BMaEpUZEhuY3Q0NEJ3bm5hQ3ErT2NOS3ZUSVVK?=
 =?utf-8?B?NjBXQVY5Ym9WdERRRldtUFpDK1RoTjFqd3g5QUlEY09qYVpKbmw4VnpTVkli?=
 =?utf-8?B?SjdHL0w3ejFFb1ZYeStGSVZsOTFScy9uWVpSRW8vakZVTmRBQmptblZFQTd4?=
 =?utf-8?B?bm9wSDVjR0E5cW53Q25BSGtSaDFmUmhkMDh3OFV6MGNsZmRvQWZrTFZlc1FH?=
 =?utf-8?B?ZDV5RTdSbkxNTU1Sb0hjZ0ppT0pId2x5dEdmZzNQSlMyYkl1dE1NbTd3bzlw?=
 =?utf-8?B?bXoya2FhNi90MytKaURXbEJhbXRFV0J4VlpCNmw2alJJc3k2Q0hSbzFJV3c0?=
 =?utf-8?B?QTZpeWRsdk5lV0l2WFdJNWQ1WUJxaFlld0dvL2grdTZaR1ozanR1TTNLSjZ5?=
 =?utf-8?B?WTl0VW9SSC9keEJjaW8yeVV6OHRQMXVqaXJ6V2NhaVhDSWE0WXJZcmdyeEI1?=
 =?utf-8?B?UlA3bTBFTzFQTWx3dFB2WVFHaWg5SlQzSlpzZk9QUnVxNk16cmhlRWNJY0N4?=
 =?utf-8?B?UlFoZHVHV3ZTWUtMUmFvcGh4UFVZQWh5N21tSWRLSjFWdFZOTnlhL3p3WnA4?=
 =?utf-8?B?bXp4Q1JsZkt1TTFMSHhBbzJzN1BhNVlSalR2SVBBT2dJMHhWL3V4WW52MDl2?=
 =?utf-8?B?TDBrNm1uRlN4OExVVWVPVU93YTE3RjAwNTloRXowSzh3RmpjQ0xTNHlRMGVY?=
 =?utf-8?B?aUFUcWV1b1I2WXhyWUFYaENHNVRVaVNZUlRNcGVzMEVGbllHTjJ4b2ZPdU45?=
 =?utf-8?B?RlVuYmpSRGNsdDNSNDdhNkdDWXJsQm5TTVI0dVkxUkF6TlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3ZMMFNFak9qQWN2WlRUV1NKVU52OU1HUFRLTjZNakF3cGtJSXFoNjEzSWIr?=
 =?utf-8?B?NFNBMk1WT0RlU1JRd2tVNFE4UjFuWXk1U1luQXpOY0QzY0lPNFlKdzl5N25P?=
 =?utf-8?B?eVZpelJ1eFlhOTNqRkYycHdFNHJ4bmVLbXFzK2gzWDlqR2JnR1IyZG1CaVNT?=
 =?utf-8?B?dGwvOWFqVzRMWnUzeXNzeUYvZm05OC9yYm85QWlRR2wwbU9LT2VBOUx5a0NS?=
 =?utf-8?B?cG92Z3k3RVpHUzMwRVFWbkVRT1U4OTc0Q214NTlyMVh0bXJrQ2J5eEZFQ3ds?=
 =?utf-8?B?ajZLbTYvRnVqd1lTeVJJeW9aeFlJNE1RVXRiOWtPdDdNanZoc3h0R1k0RU41?=
 =?utf-8?B?ZW9vZ3FoZEMyV2NaM0NocHJsdHpHVFgzTkN5TkkrdXJGUUErT2NVVDJCbXAx?=
 =?utf-8?B?QndkRE9RT2pNbGE4SXJvYUdIODdDTWowVFdrQzd3cEJ6OW5jMk9PR0RMcm1R?=
 =?utf-8?B?Z05HTUVFT0RSMUZNblVLeWhCWlhNRTl3SHptaitSbEY5cVprSmhEbDVBbyt4?=
 =?utf-8?B?eUpIS2Z1dnp0dzU1V1JUMjVDTXdmZG1ZZWpTdkdtZjNBaUw1ejh1YnJOMU52?=
 =?utf-8?B?NFlTMzY1RjZYTnJBdHd3eU8rK2grSjNIeVRER1B2QkcwQ0NGbmxyQ1lmZERP?=
 =?utf-8?B?YjlFT2xQdVdDU01ZSjB0TFJOQ0MwZis0OEdLQjh4dEpoWFgxR1dRbHhaKzQ2?=
 =?utf-8?B?VkZOU0xvS3hzK29STi9yK3RLckY1clNYWGV4dVQzS2VLV29xQU5UcDhCdEtT?=
 =?utf-8?B?OTAwcWVCbmZmR3VFU01idmNvMTIxa05lbzAxQnE2clZkVkgyeHM1RGp6Q2R6?=
 =?utf-8?B?QUdjUTd0QkluY3hEMHdpNkxla29GVkQzSjA2eFRURGlFdkttVXgwcXU5VHlo?=
 =?utf-8?B?cEYzRUMxYitDSHZIamZyOUgrTi9Id1ZTSUR3ZHJqNVN6SUFJRFFjZU96UWZM?=
 =?utf-8?B?eGlaUzB5NlVHSUJ5MzhCa1BtUUZUQ0h5T04vbnJ4SG8zdllyejVkVUlJWC9U?=
 =?utf-8?B?QUlSWGUvQ1grUFpUTG5Qa3Q0T0tpS1Q0a1ZhODdNSEwxZE1UK3hyWGFTQVFs?=
 =?utf-8?B?aUs3L3I5NDdwdDdTL25ZV3JjTkpWVEZFMkVrdlBrMXQybkwxempMTk9jVlhp?=
 =?utf-8?B?MGgyQ1BzSExMYk5DQXIyaXFxV1ArTGlrRlZtUzJJaEVEUGtsS1NodjBaZytz?=
 =?utf-8?B?MlBldkJiNFJjblRsN29QZFlxNUFMdmc1SXcrZUI5bE9MQ09LSzdZMyswU3Fw?=
 =?utf-8?B?S2RHaUJwZmRBY01ZUytyTXdWYVc0MTNma3dNVjRmT0hEalNHclFTZWhRVmJH?=
 =?utf-8?B?UUpEZ2NWV09nMkwzQmhFQ2Mrb0FsR2Mzb08wdjFwVnVmY2NIOXY4Nk91ckVD?=
 =?utf-8?B?cmVkQmRBTWtHNnlhQzhFV3FPV1J4NW90aGNDYUdweTByR215bzEzOFRXKytT?=
 =?utf-8?B?bzlwbllDMFVKN1J4SnhWS0Q1aDEvQzBhY0UwelJxcWtjM3R1Q01Oa2RxdFpL?=
 =?utf-8?B?ak5UeW9pcDZxNXZWeXA0QzZEaDl1UHh2enh5U2JBS3Jyb2tHdWE5QmZaSzVz?=
 =?utf-8?B?aDQxUEVIdE1BYitHbU1PK042bTJUS2xnWVpBUDJua003M3MwWjMxRXNDWkV1?=
 =?utf-8?B?YlR3dm1EWHhaa29WL3dKc2NlU2U1ZW9Dbm9nT1c4R2xyNlE2YXFmTk05dEtt?=
 =?utf-8?B?YmVOR21OazA5UnFobGIwT3hEY3orRHJBcGZhcU5Vd0s0UlMrQWNseURNY05z?=
 =?utf-8?B?bTVBODMvVGttN212UU5zSnV3a3ZwT0ZHdzJTOXIyVG9CdXFrV0VYaDVFNWd5?=
 =?utf-8?B?S051UDF2S1RuQTM0WVdaUHVTc1lMSE95TCtaM0EwMkJhWHJ6UnFpTFUrbkx6?=
 =?utf-8?B?VVJiQm53Nk1CSUF2K2NLejc3UFQ1dElnQUh6QXVCeGdoVXd5S05XZnpnR0JX?=
 =?utf-8?B?bzZWMlhJTm8rUnlTTDFWb2ZuYlJWbjJ1NW5nZTE5M0NIU3RBY0tFRFB0aWpV?=
 =?utf-8?B?NWxZZVZ1QkJDV3M3eGZxcnUzUHRCM0RUV1IzV2V3M1FVcDhiMExnMTdXTmln?=
 =?utf-8?B?M3NDSGxyM2lYODZxMXhlckZCaStOSWFPeTBRbXk3ZzNCYVA0ejNFOWV4Uy9Q?=
 =?utf-8?Q?Bm5c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3368cf1-6a5f-4878-a004-08dcc8079573
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 08:50:07.7446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wc2TwQNkCZg/Anrc88sfhjFEK6UUChq0FojwR5L3CLVA7exMuLCIrj3s5of9RhF3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KVGhhbmtzIGZvciB0aGUgZGV0YWlsIHJldmlldywgYW5kIEkgd2lsbCB1cGRhdGUgdGhvc2Ug
YmVmb3JlIHB1c2hpbmcgdGhlIGNvbW1pdC4NCg0KVGhhbmtzLA0KUHJpa2UNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQu
Y29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDI5LCAyMDI0IDQ6MTMgUE0NCj4gVG86IExp
YW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+OyBNYSwgTGUNCj4gPExlLk1hQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjVd
IGRybS9hbWRncHUvZ2Z4OS40LjM6IEltcGxlbWVudCBjb21wdXRlIHBpcGUgcmVzZXQNCj4NCj4N
Cj4NCj4gT24gOC8yOS8yMDI0IDk6MTcgQU0sIFByaWtlIExpYW5nIHdyb3RlOg0KPiA+IEltcGxl
bWVudCB0aGUgY29tcHV0ZSBwaXBlIHJlc2V0LCBhbmQgdGhlIGRyaXZlciB3aWxsIGZhbGxiYWNr
IHRvIHBpcGUNCj4gPiByZXNldCB3aGVuIHF1ZXVlIHJlc2V0IGZhaWxzLg0KPiA+IFRoZSBwaXBl
IHJlc2V0IG9ubHkgZGVhY3RpdmF0ZXMgdGhlIHF1ZXVlIHdoaWNoIGlzIHNjaGVkdWxlZCBpbiB0
aGUNCj4gPiBwaXBlLCBhbmQgbWVhbndoaWxlIHRoZSBNRUMgZW5naW5lIHdpbGwgYmUgcmVzZXQg
dG8gdGhlIGZpcm13YXJlDQo+ID4gX3N0YXJ0IHBvaW50ZXIuIFNvLA0KPg0KPiBNYXkgcmVmaW5l
IHRoaXMgdG8gaW5kaWNhdGUgdGhhdCByZXNldCB0byBfc3RhcnQgaXMgZm9yIHRoZSBzcGVjaWZp
YyBwaXBlIGFuZCBub3QNCj4gYXBwbGljYWJsZSBmb3IgdGhlIHdob2xlIE1FQyBlbmdpbmUuDQo+
DQo+ID4gaXQgc2VlbXMgcGlwZSByZXNldCB3aWxsIGNvc3QgbW9yZSBjeWNsZXMgdGhhbiB0aGUg
cXVldWUgcmVzZXQ7DQo+ID4gdGhlcmVmb3JlLCB0aGUgZHJpdmVyIHRyaWVzIHRvIHJlY292ZXIg
YnkgZG9pbmcgcXVldWUgcmVzZXQgZmlyc3QuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmlr
ZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jIHwgMTI3DQo+ID4gKysrKysrKysrKysrKysrKysr
KystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzRfMy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNF8z
LmMNCj4gPiBpbmRleCAyMDY3ZjI2ZDNhOWQuLjI2YWU2MmQyYTc1MiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNF8zLmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNF8zLmMNCj4gPiBAQCAtMzQ2Niw2ICszNDY2
LDk4IEBAIHN0YXRpYyB2b2lkIGdmeF92OV80XzNfZW1pdF93YXZlX2xpbWl0KHN0cnVjdA0KPiBh
bWRncHVfcmluZyAqcmluZywgYm9vbCBlbmFibGUpDQo+ID4gICAgIH0NCj4gPiAgfQ0KPiA+DQo+
ID4gK3N0YXRpYyBpbnQgZ2Z4X3Y5XzRfM191bm1hcF9kb25lKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdA0KPiBtZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgcGlwZSwgdWludDMyX3QgcXVldWUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IHhjY19pZCkNCj4gPiArew0KPiA+ICsgICBpbnQgaSwgcjsNCj4gPiAr
ICAgLyogbWFrZSBzdXJlIGRlcXVldWUgaXMgY29tcGxldGUqLw0KPiA+ICsgICBnZnhfdjlfNF8z
X3hjY19zZXRfc2FmZV9tb2RlKGFkZXYsIHhjY19pZCk7DQo+ID4gKyAgIG11dGV4X2xvY2soJmFk
ZXYtPnNyYm1fbXV0ZXgpOw0KPiA+ICsgICBzb2MxNV9ncmJtX3NlbGVjdChhZGV2LCBtZSwgcGlw
ZSwgcXVldWUsIDAsIEdFVF9JTlNUKEdDLCB4Y2NfaWQpKTsNCj4gPiArICAgZm9yIChpID0gMDsg
aSA8IGFkZXYtPnVzZWNfdGltZW91dDsgaSsrKSB7DQo+ID4gKyAgICAgICAgICAgaWYgKCEoUlJF
RzMyX1NPQzE1KEdDLCBHRVRfSU5TVChHQywgeGNjX2lkKSwNCj4gcmVnQ1BfSFFEX0FDVElWRSkg
JiAxKSkNCj4gPiArICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgIHVk
ZWxheSgxKTsNCj4gPiArICAgfQ0KPiA+ICsgICBpZiAoaSA+PSBhZGV2LT51c2VjX3RpbWVvdXQp
DQo+ID4gKyAgICAgICAgICAgciA9IC1FVElNRURPVVQ7DQo+ID4gKyAgIGVsc2UNCj4gPiArICAg
ICAgICAgICByID0gMDsNCj4gPiArICAgc29jMTVfZ3JibV9zZWxlY3QoYWRldiwgMCwgMCwgMCwg
MCwgR0VUX0lOU1QoR0MsIHhjY19pZCkpOw0KPiA+ICsgICBtdXRleF91bmxvY2soJmFkZXYtPnNy
Ym1fbXV0ZXgpOw0KPiA+ICsgICBnZnhfdjlfNF8zX3hjY191bnNldF9zYWZlX21vZGUoYWRldiwg
eGNjX2lkKTsNCj4gPiArDQo+ID4gKyAgIHJldHVybiByOw0KPiA+ICsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiArc3RhdGljIGJvb2wgZ2Z4X3Y5XzRfM19waXBlX3Jlc2V0X3N1cHBvcnQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4gK3sNCj4gPiArICAgLypUT0RPOiBOZWVkIGNoZWNrIGdm
eDkuNC40IG1lYyBmdyB3aGV0aGVyIHN1cHBvcnRzIHBpcGUgcmVzZXQgYXMNCj4gd2VsbC4qLw0K
PiA+ICsgICBpZiAoYW1kZ3B1X2lwX3ZlcnNpb24oYWRldiwgR0NfSFdJUCwgMCkgPT0gSVBfVkVS
U0lPTig5LCA0LCAzKSAmJg0KPiA+ICsgICAgICAgICAgICAgICAgICAgYWRldi0+Z2Z4Lm1lY19m
d192ZXJzaW9uID49IDB4MDAwMDAwOWIpDQo+ID4gKyAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+
ID4gKyAgIGVsc2UNCj4gPiArICAgICAgICAgICBkZXZfd2Fybl9vbmNlKGFkZXYtPmRldiwgIlBs
ZWFzZSB1c2UgdGhlIGxhdGVzdCBNRUMNCj4gdmVyc2lvbiB0byBzZWUNCj4gPiArd2hldGhlciBz
dXBwb3J0IHBpcGUgcmVzZXRcbiIpOw0KPiA+ICsNCj4gPiArICAgcmV0dXJuIGZhbHNlOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGdmeF92OV80XzNfa2lxX3Jlc2V0X2h3X3BpcGUo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPg0KPiBQbGVhc2UgZHJvcCB0aGUga2lxIG5hbWUg
aW4gdGhpcyBmdW5jdGlvbiB0byBhdm9pZCBjb25mdXNpb24uIEl0J3Mgbm90DQo+IHJlc3RyaWN0
ZWQgdG8ga2lxLg0KPg0KPiBXaXRoIHRob3NlDQo+DQo+ICAgICAgIFJldmlld2VkLWJ5OiBMaWpv
IExhemFyIDxsaWpvLmxhemFyQGFtZC5jb20+DQo+DQo+IFRoYW5rcywNCj4gTGlqbw0KPg0KPiA+
ICt7DQo+ID4gKyAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcmluZy0+YWRldjsNCj4g
PiArICAgdWludDMyX3QgcmVzZXRfcGlwZSwgY2xlYW5fcGlwZTsNCj4gPiArICAgaW50IHI7DQo+
ID4gKw0KPiA+ICsgICBpZiAoIWdmeF92OV80XzNfcGlwZV9yZXNldF9zdXBwb3J0KGFkZXYpKQ0K
PiA+ICsgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgZ2Z4X3Y5XzRf
M194Y2Nfc2V0X3NhZmVfbW9kZShhZGV2LCByaW5nLT54Y2NfaWQpOw0KPiA+ICsgICBtdXRleF9s
b2NrKCZhZGV2LT5zcmJtX211dGV4KTsNCj4gPiArDQo+ID4gKyAgIHJlc2V0X3BpcGUgPSBSUkVH
MzJfU09DMTUoR0MsIEdFVF9JTlNUKEdDLCByaW5nLT54Y2NfaWQpLA0KPiByZWdDUF9NRUNfQ05U
TCk7DQo+ID4gKyAgIGNsZWFuX3BpcGUgPSByZXNldF9waXBlOw0KPiA+ICsNCj4gPiArICAgaWYg
KHJpbmctPm1lID09IDEpIHsNCj4gPiArICAgICAgICAgICBzd2l0Y2ggKHJpbmctPnBpcGUpIHsN
Cj4gPiArICAgICAgICAgICBjYXNlIDA6DQo+ID4gKyAgICAgICAgICAgICAgICAgICByZXNldF9w
aXBlID0gUkVHX1NFVF9GSUVMRChyZXNldF9waXBlLA0KPiBDUF9NRUNfQ05UTCwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1FQ19NRTFfUElQRTBf
UkVTRVQsIDEpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAg
ICAgY2FzZSAxOg0KPiA+ICsgICAgICAgICAgICAgICAgICAgcmVzZXRfcGlwZSA9IFJFR19TRVRf
RklFTEQocmVzZXRfcGlwZSwNCj4gQ1BfTUVDX0NOVEwsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRUNfTUUxX1BJUEUxX1JFU0VULCAxKTsNCj4g
PiArICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgIGNhc2UgMjoNCj4g
PiArICAgICAgICAgICAgICAgICAgIHJlc2V0X3BpcGUgPSBSRUdfU0VUX0ZJRUxEKHJlc2V0X3Bp
cGUsDQo+IENQX01FQ19DTlRMLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTUVDX01FMV9QSVBFMl9SRVNFVCwgMSk7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICBjYXNlIDM6DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICByZXNldF9waXBlID0gUkVHX1NFVF9GSUVMRChyZXNldF9waXBlLA0KPiBDUF9NRUNf
Q05UTCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1FQ19NRTFfUElQRTNfUkVTRVQsIDEpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgYnJlYWs7
DQo+ID4gKyAgICAgICAgICAgZGVmYXVsdDoNCj4gPiArICAgICAgICAgICAgICAgICAgIGJyZWFr
Ow0KPiA+ICsgICAgICAgICAgIH0NCj4gPiArICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICBp
ZiAocmluZy0+cGlwZSkNCj4gPiArICAgICAgICAgICAgICAgICAgIHJlc2V0X3BpcGUgPSBSRUdf
U0VUX0ZJRUxEKHJlc2V0X3BpcGUsDQo+IENQX01FQ19DTlRMLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVDX01FMl9QSVBFMV9SRVNFVCwgMSk7
DQo+ID4gKyAgICAgICAgICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgcmVzZXRfcGlw
ZSA9IFJFR19TRVRfRklFTEQocmVzZXRfcGlwZSwNCj4gQ1BfTUVDX0NOVEwsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRUNfTUUyX1BJUEUwX1JF
U0VULCAxKTsNCj4gPiArICAgfQ0KPiA+ICsNCj4gPiArICAgV1JFRzMyX1NPQzE1KEdDLCBHRVRf
SU5TVChHQywgcmluZy0+eGNjX2lkKSwgcmVnQ1BfTUVDX0NOVEwsDQo+IHJlc2V0X3BpcGUpOw0K
PiA+ICsgICBXUkVHMzJfU09DMTUoR0MsIEdFVF9JTlNUKEdDLCByaW5nLT54Y2NfaWQpLCByZWdD
UF9NRUNfQ05UTCwNCj4gY2xlYW5fcGlwZSk7DQo+ID4gKyAgIG11dGV4X3VubG9jaygmYWRldi0+
c3JibV9tdXRleCk7DQo+ID4gKyAgIGdmeF92OV80XzNfeGNjX3Vuc2V0X3NhZmVfbW9kZShhZGV2
LCByaW5nLT54Y2NfaWQpOw0KPiA+ICsNCj4gPiArICAgciA9IGdmeF92OV80XzNfdW5tYXBfZG9u
ZShhZGV2LCByaW5nLT5tZSwgcmluZy0+cGlwZSwgcmluZy0NCj4gPnF1ZXVlLCByaW5nLT54Y2Nf
aWQpOw0KPiA+ICsgICByZXR1cm4gcjsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGludCBn
ZnhfdjlfNF8zX3Jlc2V0X2tjcShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB2bWlkKQ0KPiA+ICB7DQo+ID4gQEAg
LTM0NzMsNyArMzU2NSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzRfM19yZXNldF9rY3Eoc3RydWN0
DQo+IGFtZGdwdV9yaW5nICpyaW5nLA0KPiA+ICAgICBzdHJ1Y3QgYW1kZ3B1X2tpcSAqa2lxID0g
JmFkZXYtPmdmeC5raXFbcmluZy0+eGNjX2lkXTsNCj4gPiAgICAgc3RydWN0IGFtZGdwdV9yaW5n
ICpraXFfcmluZyA9ICZraXEtPnJpbmc7DQo+ID4gICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+
ID4gLSAgIGludCByLCBpOw0KPiA+ICsgICBpbnQgcjsNCj4gPg0KPiA+ICAgICBpZiAoYW1kZ3B1
X3NyaW92X3ZmKGFkZXYpKQ0KPiA+ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+IEBA
IC0zNDk1LDI2ICszNTg3LDIzIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzRfM19yZXNldF9rY3Eoc3Ry
dWN0DQo+IGFtZGdwdV9yaW5nICpyaW5nLA0KPiA+ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZraXEtPnJpbmdfbG9jaywgZmxhZ3MpOw0KPiA+DQo+ID4gICAgIHIgPSBhbWRncHVfcmluZ190
ZXN0X3Jpbmcoa2lxX3JpbmcpOw0KPiA+ICsgICBpZiAocikgew0KPiA+ICsgICAgICAgICAgIGRl
dl9lcnIoYWRldi0+ZGV2LCAia2lxIHJpbmcgdGVzdCBmYWlsZWQgYWZ0ZXIgcmluZzogJXMgcXVl
dWUNCj4gcmVzZXRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpbmctPm5h
bWUpOw0KPiA+ICsgICAgICAgICAgIGdvdG8gcGlwZV9yZXNldDsNCj4gPiArICAgfQ0KPiA+ICsN
Cj4gPiArICAgciA9IGdmeF92OV80XzNfdW5tYXBfZG9uZShhZGV2LCByaW5nLT5tZSwgcmluZy0+
cGlwZSwgcmluZy0NCj4gPnF1ZXVlLA0KPiA+ICtyaW5nLT54Y2NfaWQpOw0KPiA+ICAgICBpZiAo
cikNCj4gPiAtICAgICAgICAgICByZXR1cm4gcjsNCj4gPiArICAgICAgICAgICBkZXZfZXJyKGFk
ZXYtPmRldiwgImZhaWwgdG8gd2FpdCBvbiBocWQgZGVhY3RpdmUgYW5kIHdpbGwgdHJ5DQo+IHBp
cGUNCj4gPiArcmVzZXRcbiIpOw0KPiA+DQo+ID4gLSAgIC8qIG1ha2Ugc3VyZSBkZXF1ZXVlIGlz
IGNvbXBsZXRlKi8NCj4gPiAtICAgYW1kZ3B1X2dmeF9ybGNfZW50ZXJfc2FmZV9tb2RlKGFkZXYs
IHJpbmctPnhjY19pZCk7DQo+ID4gLSAgIG11dGV4X2xvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOw0K
PiA+IC0gICBzb2MxNV9ncmJtX3NlbGVjdChhZGV2LCByaW5nLT5tZSwgcmluZy0+cGlwZSwgcmlu
Zy0+cXVldWUsIDAsDQo+IEdFVF9JTlNUKEdDLCByaW5nLT54Y2NfaWQpKTsNCj4gPiAtICAgZm9y
IChpID0gMDsgaSA8IGFkZXYtPnVzZWNfdGltZW91dDsgaSsrKSB7DQo+ID4gLSAgICAgICAgICAg
aWYgKCEoUlJFRzMyX1NPQzE1KEdDLCAwLCByZWdDUF9IUURfQUNUSVZFKSAmIDEpKQ0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gLSAgICAgICAgICAgdWRlbGF5KDEpOw0KPiA+
IC0gICB9DQo+ID4gLSAgIGlmIChpID49IGFkZXYtPnVzZWNfdGltZW91dCkNCj4gPiAtICAgICAg
ICAgICByID0gLUVUSU1FRE9VVDsNCj4gPiAtICAgc29jMTVfZ3JibV9zZWxlY3QoYWRldiwgMCwg
MCwgMCwgMCwgR0VUX0lOU1QoR0MsIHJpbmctPnhjY19pZCkpOw0KPiA+IC0gICBtdXRleF91bmxv
Y2soJmFkZXYtPnNyYm1fbXV0ZXgpOw0KPiA+IC0gICBhbWRncHVfZ2Z4X3JsY19leGl0X3NhZmVf
bW9kZShhZGV2LCByaW5nLT54Y2NfaWQpOw0KPiA+IC0gICBpZiAocikgew0KPiA+IC0gICAgICAg
ICAgIGRldl9lcnIoYWRldi0+ZGV2LCAiZmFpbCB0byB3YWl0IG9uIGhxZCBkZWFjdGl2ZVxuIik7
DQo+ID4gLSAgICAgICAgICAgcmV0dXJuIHI7DQo+ID4gK3BpcGVfcmVzZXQ6DQo+ID4gKyAgIGlm
KHIpIHsNCj4gPiArICAgICAgICAgICByID0gZ2Z4X3Y5XzRfM19raXFfcmVzZXRfaHdfcGlwZShy
aW5nKTsNCj4gPiArICAgICAgICAgICBkZXZfaW5mbyhhZGV2LT5kZXYsICJyaW5nOiAlcyBwaXBl
IHJlc2V0IDolc1xuIiwgcmluZy0+bmFtZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgciA/ICJmYWlsZWQiIDogInN1Y2Nlc3NmdWxseSIpOw0KPiA+ICsgICAgICAgICAgIGlmIChy
KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgcmV0dXJuIHI7DQo+ID4gICAgIH0NCj4gPg0KPiA+
ICAgICByID0gYW1kZ3B1X2JvX3Jlc2VydmUocmluZy0+bXFkX29iaiwgZmFsc2UpOw0K
