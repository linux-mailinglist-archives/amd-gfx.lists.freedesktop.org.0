Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7879B58EA
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Oct 2024 02:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFBF10E03F;
	Wed, 30 Oct 2024 01:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nsUMWUG8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4B10E03F
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Oct 2024 01:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRIrBdVc1cDuPCD+Us+hP74/mFJ4Yw+9eR6tWUxDyAwWLgtlZxG825ijXwLqCsJR+Ffqke65RdiBapdaQ10MIlt7WsqAc1SxRiGBb4ifIr88EWXZIDaA4FAeSa5erDeCaqSUGntJokNzlE6Ah38xI7Xb1quPRyP+XUNFzFBA174GDX5sjbp9nVeiv5+VrYFXA0xVZyeeUbygkrKg6YrwfDydK1/HGLSCD8JeQ2voiwc0Pk3H2AIh53AOz+buzovyGd+5Q3EUBDSKLkTWQvK+4ylQyGdbf0CI/BCXBoZth1Mc8W4w5/NMeTFp+r340J2uWw5+qGHNJFaiEAO+Bmxs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6wYBYoCYExEttrLQRKDgaWsTXBPFNDBUZzhx9T2INM=;
 b=PQ5zUeZH1dM1p/3MeHiqdrHDYq9nepw0x8ETBT7uoR689BNddnCWZhPHukLCz3uI5EiV+4CTsB7llwa/H+nN8lrT5Xys9DRlY8PLVhtBwUSAymtLPFR835xUIyACrFt5lepFfAsMKbkqOGZOIMh5UqjoddV0tv8IsToOAigeNtV5NlGCZsSRcvseHSKtz6RqASijuZkMUB8FYzKAa+uGiIAVCIDwemxfNJXB2OCp7Kxm87rBSjhSd8cNdMRdTXBlOoSef94MKAi6FruUywwyOJv0UeToVtohUxZzmXBiCnjSlfCyfOba+6sQXvwy55n5CaCL2zeciCN+jk66ue2pTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6wYBYoCYExEttrLQRKDgaWsTXBPFNDBUZzhx9T2INM=;
 b=nsUMWUG8hdDQrarY/soD4fy/Exmp8lslBN3+TiXfgiJgfZQKhKs0rmnoqZh9m9xkBQhgZYoYU1wV1csjPQ3+wqxwq+9HLCObe7NqklG+oMQr1DrAJQhm8JyLF+Uf6TrtiAOvq+xSB1zLzfTX7vL3/uMz1ZrwfGQ+xf2tbP2eSNQ=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 01:01:57 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::db2e:f082:bb80:d1a4]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::db2e:f082:bb80:d1a4%5]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 01:01:57 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: =?utf-8?B?V29sZmdhbmcgTcO8bGxlcg==?= <wolf@oriole.systems>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] drm/amd/pm: add zero RPM stop temperature OD
 setting support for SMU13
Thread-Topic: [PATCH v2 2/2] drm/amd/pm: add zero RPM stop temperature OD
 setting support for SMU13
Thread-Index: AQHbKfRJSYSy8Iz8lE6VOFqywytR/bKeepMQ
Date: Wed, 30 Oct 2024 01:01:57 +0000
Message-ID: <DM4PR12MB516570C59A4F85DE7EC8C5398E542@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20241019143706.18779-1-wolf@oriole.systems>
 <20241029111753.5132-1-wolf@oriole.systems>
 <20241029111753.5132-3-wolf@oriole.systems>
In-Reply-To: <20241029111753.5132-3-wolf@oriole.systems>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=2a3f3eb2-080d-45c6-8b60-27eb8f65d513;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-10-30T01:01:24Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5165:EE_|SA3PR12MB8021:EE_
x-ms-office365-filtering-correlation-id: 4d3e1dc6-9d24-4cde-69d4-08dcf87e73f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R09CSjJaS2xBRUhnV280Szl1cG1JVFpkam9EcGozd0FaNWRHMUg3MUtCbk4x?=
 =?utf-8?B?Z2NINFlBT2VqZk5uN2xDTnNwaFBnWlVRdGZlSXpSdmpsNk13RzR2OHJTK0JU?=
 =?utf-8?B?c3hPcHcrb3pwZkVKVnJGL2tTbjZQL3AxekFZcHlpUXFJNVE2a2JqQTZkRmZl?=
 =?utf-8?B?aHNvVmdkR2NJQjNsOVBYYm90SGxZYTFRbFNsR0VUVEZhWTVMamY3VEhmUUZC?=
 =?utf-8?B?amhJb3cvN0pUU3I1RENKNzNzcmNIQVU2VUxXZUZ5N1Rjb3lQVFVib09RS1k2?=
 =?utf-8?B?cWVjUFM0dFRRZmhIc0F3SFh2NlNDcUtVaXk2NTBDaHBTb1ZOMGhVSWdFYzBL?=
 =?utf-8?B?NkpVaEVuOW5XVUU1cTVxbm9YT2Q3LzhQRDZYMFNqTVFBWGxzcXJXOHN1L2Mv?=
 =?utf-8?B?S1ljeXhhdG1FVzJUMzY5bHpIdjdNalFZcllIb2tJdElaeFBxR3VXQkk3OHAr?=
 =?utf-8?B?eEVGU0JBcENCRHZURE1BcVY2Q2FzUUR1b2RPd1ZXajVxbWFENXlraFZkTG5w?=
 =?utf-8?B?bGpSUWkzOXRvaUNHNmMzUWlXb0ZNRkE1emtDTmZTWmFKU0VmcXBxNEZDVW94?=
 =?utf-8?B?WW51cHl5S2o5aGp4Si9kQXZDdGFvVWtXQnl0VTRDRE43R0xyNURTdzE0R1dH?=
 =?utf-8?B?cUV4azBhaWVBU2F0RjJHWWMzdGFFd1MrenNBdGxVbysyWXR4R2wzaEFFczd3?=
 =?utf-8?B?aGhTbmp0ZjdneTZlSEVscFRqcDRVUzNHdUNXL3FGbm1CZ2RzLzJCMDZhV04r?=
 =?utf-8?B?bVJlYU1DMndxSHViUFZnNVVnbk54TFB6MUFBVmpkSHR2M281dDEzeFdwUmM1?=
 =?utf-8?B?QlFkdW4wZmxsNFZsSEZjVGJENTVKSGJuYmxHek1IaU5FRnNZNWtxeWpPS2c4?=
 =?utf-8?B?bTVQcmM2OFpVSkpDaElseEQyZjBkZGt5d2twWGtrS0lRNndCR1M1ZnVUQjVH?=
 =?utf-8?B?V0RsQzNjOC9PYWlkVDVxcm8zSTlZVlZFTjcwR3B2VHVINnFsZ0hMNjVzM2tX?=
 =?utf-8?B?MHk0eXRYVnhJaFkxd3ZlTWN1Q2hsUkgzdytRczR5d2hUR01mbVpJWFh1cG9G?=
 =?utf-8?B?M1FTV1N5MFhxZXBCSXdUQUpMSlFLYzJLTG1Jdzk4dkRGV2o0WjFRaW1FMXhC?=
 =?utf-8?B?b1RFdGFkMkc2Tm52dHdmV2JVNG9UUkJJbFgwVEU2V3Y0TVREMTZTWUxqRk1s?=
 =?utf-8?B?TlJocGJLVlRjcjRUQmkxYm5TcTV4V0xDVC83eHQxVFNlbGMvU1JDQmJXWUhT?=
 =?utf-8?B?M1lLR2ZZRjBSUUlhT3dOUTMxeU1ia3U1N1YvYVNLS2s5c2FrQ2JPRkl5OFZi?=
 =?utf-8?B?SVEwcm9HTmNSSzFEU2FvYW1Na0c2MHc4dVJiVS9jSXJnSU5uNy8xc1RrNWRC?=
 =?utf-8?B?SG5hcFF0d2RpdmIvc21OU1Uvd2NIdHBEckZZM205U2ZsODFINlRQZ2t5U1B0?=
 =?utf-8?B?bzJSYkl5VjF6ZHlqMVU0QXkxVFZCTWxibElTYXlYdithdzNZZXl6REMzTk10?=
 =?utf-8?B?S1pTZDBBZjJGbWUzRDI5RmI2Z3Q1L2JObFBkQTlvWnU3aDRndklicFFkNlRr?=
 =?utf-8?B?cU5VWGxNdEZzNGlPTEJmdG11L0NnUGRNK05kOG5CSzRIeld2aFFpQlZFb3lL?=
 =?utf-8?B?YTd3SnU5dHZDVzRrdCszOFZXV0VJV2hmQnFEL2Nod24vaGJLT0xQYXQyKzM4?=
 =?utf-8?B?a1gvU1hESWUrTlA2dUFTRldEV2xKM1dlLzFnNTE5UlVFWk1SQ1hqbWYwNTgr?=
 =?utf-8?B?eldueThrY0FMWklzb2RnOWQ0WFlkdHRBY2owM2REdmRqWEV0dFYzVnZLRWs5?=
 =?utf-8?Q?ZQ6Fa7Fuml6QNd7q5pHgRRY45nP2n+zU2y1kQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXNEVGt5Q2N1emdlemtZZm9jNml6Vk05dHE2dG12bjY0WE5mY1V0VVJNQzcy?=
 =?utf-8?B?K0NsdkowemtWb2NMOVlqWWZJMzk0UkNyM3dhMkJqdFM2RWl1Z3Y2aXVxUWZh?=
 =?utf-8?B?bHcyeTRXYXZwSGRsVEQ0WlArUkVjZWo4N3JwdXlzMDRIdGc4TkQ4dk5hTk1E?=
 =?utf-8?B?SHB5NGxRdHoySDN4LzlOUlg0UkQzQjZFUzM3aUJsc1NsRG54cGxobi8xZ0o4?=
 =?utf-8?B?aFdZSEozbS9IM0JkQnBKRVZrUzlaOWtGM3Y1MXBXNnN5Qnl2MFpCb1N6Nk8y?=
 =?utf-8?B?Rmg4dnpJeVYzeVZoa2JPcDZXNGd0N2Y1UzFsOEN6OWtEdWJad3lYNHF3U1Zj?=
 =?utf-8?B?eU9FaWh1b25yVTliT1ZVRTV6cjlVYkVDdGxzYS9EWDRTTkRMMmpiTUpBQ1JL?=
 =?utf-8?B?SzIyVGNneFIzdzgxTFJqMWk1ejB0TCtqb0FRZGJxNmJXc1pWUE96Y2VvRkE2?=
 =?utf-8?B?NTZIdmw4QThweU54cGV4ai9Ndkhic0F6cHhLVitnek45VVp5NW9CVkk0amVX?=
 =?utf-8?B?VWRRRnFtMW1qbWxvaXB4eUhkby92bVVUM3ExSUo0czNCUUtzSWxmTUhtSmZh?=
 =?utf-8?B?YWtUMDRWZ0pnclpmZlVTZEp2c09Qc3VrOWJsWFRIaFcxbXkyNFdMd3hIb1pG?=
 =?utf-8?B?MmNVS1ZCcjFaN0gwQjJkUytqdFNwUmlWelVhejYrL0ZxeW5EcHlQK2pxMTk2?=
 =?utf-8?B?VnRwMlg2VTg4MDY3akx0TVN3YmZUV2RoRC8rMEkyTWxCQ3FVUU9DbmhxTWho?=
 =?utf-8?B?R0tWb09iMm1MOXpvSDAwNUdMNHp0dzZDNkM0aHBkeDV2cjRsME9YWHhsTWUz?=
 =?utf-8?B?TnJBWXpTY256Q083cWZ4Qi9va2R2SmRmUGhNSVYxQXl2REFtVEROR2FZUnhU?=
 =?utf-8?B?bU1yQUFKTnpERDRlQkYvSUVFK2poT1AxQlNoT3Z5bTRxMjc3NjducW82a3BR?=
 =?utf-8?B?Ly9uQ3R3T2ZTVkM4ampuNHNrdnIwWjFMR0FzOGs4WHdKeXN5LzBUOTdQL2ZC?=
 =?utf-8?B?d250Zk5OclNDejJGYU1iZlJtM0wyTmtZemxXN085SGpONUEwVnhveWZLYXJP?=
 =?utf-8?B?Y2d3a1pBK3VRYWdhSkhFWXNTbU1qdWRXQmN4WUhXZHA0M1l0cDQ4RmVZZW44?=
 =?utf-8?B?RERtLzRINzdnRDBSWStiaGdudHFkVkd5U09OS1ZXOWdkZHdMR2FIQUtROUhl?=
 =?utf-8?B?dXJNeU1LKzB0cTlWaXdvNUswK3J1YVNCZWYzM2hWRlhSZy96Nkdld2ZsT0th?=
 =?utf-8?B?VzB5R2ZkM1JNMFJBMXlDdjJlSkYwR0NTbE9MRk9aUUt4djBBWHFJVkc0cElK?=
 =?utf-8?B?N2hpOFJBQllEamI5bVhYa3pJVFlzOXZQV2hFV1hJbzA1cUZIeEx2SzJaMDND?=
 =?utf-8?B?MUlVOEFNOXJTQnJ3aDBaYnd0U3phM3dZRUdWV00wZEJxNFNNUjRlMjd0UHJm?=
 =?utf-8?B?NEYzWkc3OUFTMGV0SC9TRXJkTXJoSUdZS1ZNZXMwTFpCMDNYQjN2Y08vOGcw?=
 =?utf-8?B?OXNzSGJFSklCUnR3NmE4RnZtbFg4bHJ0NVlrRklJUXF4dGtIOXFVcTlHQ0hx?=
 =?utf-8?B?SzFVaE5YSXJKSTMwYWRiTkNrd0RGNEtWWjJtYURWbnlzcUhIdjRYMEFveUFZ?=
 =?utf-8?B?UHgzekNucGFuSVRxNlcxZTZwZ1NXMWVaMU4zNUxZYWNwT2NXbTZ3d1VUYVBn?=
 =?utf-8?B?MXNFd0YyMkFTaVgvTWdPNndSeERmU1g5cDdwNUlELzJZaDlpSThablNGeERY?=
 =?utf-8?B?QTBZbFVGOHJXNHlzYnpQbDhqNmwraWxaWUtreG1zenZSWEZlR09VVjNZaWtv?=
 =?utf-8?B?T1dqdjlic0MzRHZHKys4dEJKVzRkSWtvL0tFM29lQnVRa2hvU05oU0s4WW16?=
 =?utf-8?B?ZTNNWXdYSE01OWJndmhNNHpDVFFVTkR3TDhrc0d5Vjg1ZW81aUhncTVIV2dF?=
 =?utf-8?B?Nks0TGxHaGlzZGFESWppbnQ1eTJ6NmttRlBKZVRGMzEvTmRWT09ucUtreCtm?=
 =?utf-8?B?RDFwMHQrL21ieWliZFVOZHBKcmdmU2V0ZEZ1c0ZLUTh1V0FjM0V6Y0JpTmF3?=
 =?utf-8?B?eVczNDZ1M3VnOG81eXlvZEVtaWZ3VTEyRThWYWhJRk5UMmN1d1QvbUt0K2Vo?=
 =?utf-8?Q?CdhA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3e1dc6-9d24-4cde-69d4-08dcf87e73f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 01:01:57.4148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iPd4PXL1wgi2A2u+etPwU1cM/aAui2F1CtHTw1/j/WyKYKVC9uVupF8/sWcuFW1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021
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
Cg0KU2VyaWVzIGlzIFJldmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQu
Y29tPg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXb2xmZ2FuZyBNw7xs
bGVyIDx3b2xmQG9yaW9sZS5zeXN0ZW1zPg0KU2VudDogVHVlc2RheSwgT2N0b2JlciAyOSwgMjAy
NCA3OjE4IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBGZW5nLCBL
ZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCB2MiAyLzJdIGRy
bS9hbWQvcG06IGFkZCB6ZXJvIFJQTSBzdG9wIHRlbXBlcmF0dXJlIE9EIHNldHRpbmcgc3VwcG9y
dCBmb3IgU01VMTMNCg0KQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBF
eHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVu
dHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KDQoNClRvZ2V0aGVyIHdpdGggdGhl
IGZlYXR1cmUgdG8gZW5hYmxlIG9yIGRpc2FibGUgemVybyBSUE0gaW4gdGhlIGxhc3QgY29tbWl0
LCBpdCBhbHNvIG1ha2VzIHNlbnNlIHRvIGV4cG9zZSB0aGUgT0Qgc2V0dGluZyBkZXRlcm1pbmlu
ZyB1bmRlciB3aGljaCB0ZW1wZXJhdHVyZSB0aGUgZmFuIHNob3VsZCBzdG9wIGlmIHplcm8gUlBN
IGlzIGVuYWJsZWQuDQoNClNpZ25lZC1vZmYtYnk6IFdvbGZnYW5nIE3DvGxsZXIgPHdvbGZAb3Jp
b2xlLnN5c3RlbXM+DQotLS0NCiBEb2N1bWVudGF0aW9uL2dwdS9hbWRncHUvdGhlcm1hbC5yc3Qg
ICAgICAgICAgfCAgNiArKw0KIC4uLi9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZh
Y2UuaCAgICB8ICAyICsNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9wbS5jICAgICAg
ICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9p
bmMvYW1kZ3B1X2RwbS5oICAgICAgIHwgIDIgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvYW1kZ3B1X3NtdS5jICAgICB8ICAyICsNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211
L2luYy9zbXVfdHlwZXMuaCAgfCAgMSArICAuLi4vZHJtL2FtZC9wbS9zd3NtdS9zbXUxMy9zbXVf
djEzXzBfMF9wcHQuYyAgfCA1NSArKysrKysrKysrKysrKystICAuLi4vZHJtL2FtZC9wbS9zd3Nt
dS9zbXUxMy9zbXVfdjEzXzBfN19wcHQuYyAgfCA1NSArKysrKysrKysrKysrKystDQogOCBmaWxl
cyBjaGFuZ2VkLCAxODYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZ3B1L2FtZGdwdS90aGVybWFsLnJzdCBiL0RvY3VtZW50YXRpb24v
Z3B1L2FtZGdwdS90aGVybWFsLnJzdA0KaW5kZXggZWM2YzFmMWQ1Li4xNzY4YTEwNmEgMTAwNjQ0
DQotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9hbWRncHUvdGhlcm1hbC5yc3QNCisrKyBiL0RvY3Vt
ZW50YXRpb24vZ3B1L2FtZGdwdS90aGVybWFsLnJzdA0KQEAgLTEwNiw2ICsxMDYsMTIgQEAgZmFu
X3plcm9fcnBtX2VuYWJsZSAgLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
YW1kZ3B1X3BtLmMNCiAgICA6ZG9jOiBmYW5femVyb19ycG1fZW5hYmxlDQoNCitmYW5femVyb19y
cG1fc3RvcF90ZW1wZXJhdHVyZQ0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorDQor
Li4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMNCisgICA6
ZG9jOiBmYW5femVyb19ycG1fc3RvcF90ZW1wZXJhdHVyZQ0KKw0KIEdGWE9GRg0KID09PT09PQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZh
Y2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgNCmlu
ZGV4IDgwZTRiNWE3ZC4uYmIyN2MwZDJhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaA0KQEAgLTEyMCw2ICsxMjAsNyBAQCBlbnVtIHBwX2Ns
b2NrX3R5cGUgew0KICAgICAgICBPRF9GQU5fVEFSR0VUX1RFTVBFUkFUVVJFLA0KICAgICAgICBP
RF9GQU5fTUlOSU1VTV9QV00sDQogICAgICAgIE9EX0ZBTl9aRVJPX1JQTV9FTkFCTEUsDQorICAg
ICAgIE9EX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVAsDQogfTsNCg0KIGVudW0gYW1kX3BwX3NlbnNv
cnMgew0KQEAgLTIwMSw2ICsyMDIsNyBAQCBlbnVtIFBQX09EX0RQTV9UQUJMRV9DT01NQU5EIHsN
CiAgICAgICAgUFBfT0RfRURJVF9GQU5fVEFSR0VUX1RFTVBFUkFUVVJFLA0KICAgICAgICBQUF9P
RF9FRElUX0ZBTl9NSU5JTVVNX1BXTSwNCiAgICAgICAgUFBfT0RfRURJVF9GQU5fWkVST19SUE1f
RU5BQkxFLA0KKyAgICAgICBQUF9PRF9FRElUX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVAsDQogfTsN
Cg0KIHN0cnVjdCBwcF9zdGF0ZXNfaW5mbyB7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMN
CmluZGV4IGNiOTZmMWY4Yy4uMTM2ZTgxOTM4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9hbWRncHVfcG0uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVf
cG0uYw0KQEAgLTQxNjMsNiArNDE2Myw2MyBAQCBzdGF0aWMgdW1vZGVfdCBmYW5femVyb19ycG1f
ZW5hYmxlX3Zpc2libGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogICAgICAgIHJldHVy
biB1bW9kZTsNCiB9DQoNCisvKioNCisgKiBET0M6IGZhbl96ZXJvX3JwbV9zdG9wX3RlbXBlcmF0
dXJlDQorICoNCisgKiBUaGUgYW1kZ3B1IGRyaXZlciBwcm92aWRlcyBhIHN5c2ZzIEFQSSBmb3Ig
Y2hlY2tpbmcgYW5kIGFkanVzdGluZw0KK3RoZQ0KKyAqIHplcm8gUlBNIHN0b3AgdGVtcGVyYXR1
cmUgZmVhdHVyZS4NCisgKg0KKyAqIFJlYWRpbmcgYmFjayB0aGUgZmlsZSBzaG93cyB5b3UgdGhl
IGN1cnJlbnQgc2V0dGluZyBhbmQgdGhlDQorcGVybWl0dGVkDQorICogcmFuZ2VzIGlmIGNoYW5n
YWJsZS4NCisgKg0KKyAqIFdyaXRpbmcgYW4gaW50ZWdlciB0byB0aGUgZmlsZSwgY2hhbmdlIHRo
ZSBzZXR0aW5nIGFjY29yZGluZ2x5Lg0KKyAqDQorICogV2hlbiB5b3UgaGF2ZSBmaW5pc2hlZCB0
aGUgZWRpdGluZywgd3JpdGUgImMiIChjb21taXQpIHRvIHRoZSBmaWxlDQordG8gY29tbWl0DQor
ICogeW91ciBjaGFuZ2VzLg0KKyAqDQorICogSWYgeW91IHdhbnQgdG8gcmVzZXQgdG8gdGhlIGRl
ZmF1bHQgdmFsdWUsIHdyaXRlICJyIiAocmVzZXQpIHRvIHRoZQ0KK2ZpbGUgdG8NCisgKiByZXNl
dCB0aGVtLg0KKyAqDQorICogVGhpcyBzZXR0aW5nIHdvcmtzIG9ubHkgaWYgdGhlIFplcm8gUlBN
IHNldHRpbmcgaXMgZW5hYmxlZC4gSXQNCithZGp1c3RzIHRoZQ0KKyAqIHRlbXBlcmF0dXJlIGJl
bG93IHdoaWNoIHRoZSBmYW4gY2FuIHN0b3AuDQorICovDQorc3RhdGljIHNzaXplX3QgZmFuX3pl
cm9fcnBtX3N0b3BfdGVtcF9zaG93KHN0cnVjdCBrb2JqZWN0ICprb2JqLA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSAqYXR0
ciwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpidWYp
IHsNCisgICAgICAgc3RydWN0IG9kX2tvYmogKmNvbnRhaW5lciA9IGNvbnRhaW5lcl9vZihrb2Jq
LCBzdHJ1Y3Qgb2Rfa29iaiwga29iaik7DQorICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlDQorKiljb250YWluZXItPnByaXY7DQorDQorICAg
ICAgIHJldHVybiAoc3NpemVfdClhbWRncHVfcmV0cmlldmVfb2Rfc2V0dGluZ3MoYWRldiwNCitP
RF9GQU5fWkVST19SUE1fU1RPUF9URU1QLCBidWYpOyB9DQorDQorc3RhdGljIHNzaXplX3QgZmFu
X3plcm9fcnBtX3N0b3BfdGVtcF9zdG9yZShzdHJ1Y3Qga29iamVjdCAqa29iaiwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGtvYmpfYXR0cmlidXRl
ICphdHRyLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyICpidWYsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNpemVfdCBjb3VudCkgew0KKyAgICAgICBzdHJ1Y3Qgb2Rfa29iaiAqY29udGFpbmVyID0gY29u
dGFpbmVyX29mKGtvYmosIHN0cnVjdCBvZF9rb2JqLCBrb2JqKTsNCisgICAgICAgc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UNCisqKWNvbnRhaW5lci0+
cHJpdjsNCisNCisgICAgICAgcmV0dXJuIChzc2l6ZV90KWFtZGdwdV9kaXN0cmlidXRlX2N1c3Rv
bV9vZF9zZXR0aW5ncyhhZGV2LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBQX09EX0VESVRfRkFOX1pFUk9fUlBNX1NUT1BfVEVN
UCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBidWYsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY291bnQpOyB9DQorDQorc3RhdGljIHVtb2RlX3QgZmFuX3plcm9f
cnBtX3N0b3BfdGVtcF92aXNpYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlDQorKmFkZXYpIHsNCisg
ICAgICAgdW1vZGVfdCB1bW9kZSA9IDAwMDA7DQorDQorICAgICAgIGlmIChhZGV2LT5wbS5vZF9m
ZWF0dXJlX21hc2sgJiBPRF9PUFNfU1VQUE9SVF9GQU5fWkVST19SUE1fU1RPUF9URU1QX1JFVFJJ
RVZFKQ0KKyAgICAgICAgICAgICAgIHVtb2RlIHw9IFNfSVJVU1IgfCBTX0lSR1JQIHwgU19JUk9U
SDsNCisNCisgICAgICAgaWYgKGFkZXYtPnBtLm9kX2ZlYXR1cmVfbWFzayAmIE9EX09QU19TVVBQ
T1JUX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVBfU0VUKQ0KKyAgICAgICAgICAgICAgIHVtb2RlIHw9
IFNfSVdVU1I7DQorDQorICAgICAgIHJldHVybiB1bW9kZTsNCit9DQorDQogc3RhdGljIHN0cnVj
dCBvZF9mZWF0dXJlX3NldCBhbWRncHVfb2Rfc2V0ID0gew0KICAgICAgICAuY29udGFpbmVycyA9
IHsNCiAgICAgICAgICAgICAgICBbMF0gPSB7DQpAQCAtNDIxNiw2ICs0MjczLDE0IEBAIHN0YXRp
YyBzdHJ1Y3Qgb2RfZmVhdHVyZV9zZXQgYW1kZ3B1X29kX3NldCA9IHsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5zdG9yZSA9IGZhbl96ZXJvX3JwbV9l
bmFibGVfc3RvcmUsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSwNCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgWzZdID0gew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC5uYW1lID0gImZhbl96ZXJvX3JwbV9zdG9wX3RlbXBlcmF0dXJlIiwNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAub3BzID0gew0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLmlzX3Zpc2libGUgPSBmYW5femVyb19ycG1f
c3RvcF90ZW1wX3Zpc2libGUsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAuc2hvdyA9IGZhbl96ZXJvX3JwbV9zdG9wX3RlbXBfc2hvdywNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5zdG9yZSA9IGZhbl96ZXJv
X3JwbV9zdG9wX3RlbXBfc3RvcmUsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSwNCiAgICAgICAgICAg
ICAgICAgICAgICAgIH0sDQogICAgICAgICAgICAgICAgfSwNCiAgICAgICAgfSwNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9hbWRncHVfZHBtLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL2luYy9hbWRncHVfZHBtLmgNCmluZGV4IGI1ZGFhMTJjMC4uMzYzYWY4OTkw
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X2RwbS5oDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9hbWRncHVfZHBtLmgNCkBAIC0zMzAsNiAr
MzMwLDggQEAgc3RydWN0IGNvbmZpZ190YWJsZV9zZXR0aW5nDQogI2RlZmluZSBPRF9PUFNfU1VQ
UE9SVF9GQU5fTUlOSU1VTV9QV01fU0VUICAgICAgICAgICAgIEJJVCg5KQ0KICNkZWZpbmUgT0Rf
T1BTX1NVUFBPUlRfRkFOX1pFUk9fUlBNX0VOQUJMRV9SRVRSSUVWRSAgICBCSVQoMTApDQogI2Rl
ZmluZSBPRF9PUFNfU1VQUE9SVF9GQU5fWkVST19SUE1fRU5BQkxFX1NFVCAgICAgICAgIEJJVCgx
MSkNCisjZGVmaW5lIE9EX09QU19TVVBQT1JUX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVBfUkVUUklF
VkUgQklUKDEyKQ0KKyNkZWZpbmUgT0RfT1BTX1NVUFBPUlRfRkFOX1pFUk9fUlBNX1NUT1BfVEVN
UF9TRVQgICAgICBCSVQoMTMpDQoNCiBzdHJ1Y3QgYW1kZ3B1X3BtIHsNCiAgICAgICAgc3RydWN0
IG11dGV4ICAgICAgICAgICAgbXV0ZXg7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2Ft
ZGdwdV9zbXUuYw0KaW5kZXggOGQzZjNlNzM1Li44MTQ4OTMzY2MgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2FtZGdwdV9zbXUuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9zd3NtdS9hbWRncHVfc211LmMNCkBAIC0yODc2LDYgKzI4NzYsOCBAQCBzdGF0
aWMgZW51bSBzbXVfY2xrX3R5cGUgc211X2NvbnZlcnRfdG9fc211Y2xrKGVudW0gcHBfY2xvY2tf
dHlwZSB0eXBlKQ0KICAgICAgICAgICAgICAgIGNsa190eXBlID0gU01VX09EX0ZBTl9NSU5JTVVN
X1BXTTsgYnJlYWs7DQogICAgICAgIGNhc2UgT0RfRkFOX1pFUk9fUlBNX0VOQUJMRToNCiAgICAg
ICAgICAgICAgICBjbGtfdHlwZSA9IFNNVV9PRF9GQU5fWkVST19SUE1fRU5BQkxFOyBicmVhazsN
CisgICAgICAgY2FzZSBPRF9GQU5fWkVST19SUE1fU1RPUF9URU1QOg0KKyAgICAgICAgICAgICAg
IGNsa190eXBlID0gU01VX09EX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVA7IGJyZWFrOw0KICAgICAg
ICBkZWZhdWx0Og0KICAgICAgICAgICAgICAgIGNsa190eXBlID0gU01VX0NMS19DT1VOVDsgYnJl
YWs7DQogICAgICAgIH0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211
L2luYy9zbXVfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvaW5jL3NtdV90
eXBlcy5oDQppbmRleCBlMGFiYjQ0OWEuLmEyOTlkYzRhOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vc3dzbXUvaW5jL3NtdV90eXBlcy5oDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3N3c211L2luYy9zbXVfdHlwZXMuaA0KQEAgLTMxNCw2ICszMTQsNyBAQCBlbnVt
IHNtdV9jbGtfdHlwZSB7DQogICAgICAgIFNNVV9PRF9GQU5fVEFSR0VUX1RFTVBFUkFUVVJFLA0K
ICAgICAgICBTTVVfT0RfRkFOX01JTklNVU1fUFdNLA0KICAgICAgICBTTVVfT0RfRkFOX1pFUk9f
UlBNX0VOQUJMRSwNCisgICAgICAgU01VX09EX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVAsDQogICAg
ICAgIFNNVV9DTEtfQ09VTlQsDQogfTsNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vc3dzbXUvc211MTMvc211X3YxM18wXzBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3N3c211L3NtdTEzL3NtdV92MTNfMF8wX3BwdC5jDQppbmRleCAwZDlhNDYzOGUuLjkzY2M4
MmZlMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTMvc211
X3YxM18wXzBfcHB0LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTMv
c211X3YxM18wXzBfcHB0LmMNCkBAIC0xMDgsNiArMTA4LDcgQEANCiAjZGVmaW5lIFBQX09EX0ZF
QVRVUkVfRkFOX1RBUkdFVF9URU1QRVJBVFVSRSAgICAgICAgICAgOQ0KICNkZWZpbmUgUFBfT0Rf
RkVBVFVSRV9GQU5fTUlOSU1VTV9QV00gICAgICAgICAgICAgICAgICAxMA0KICNkZWZpbmUgUFBf
T0RfRkVBVFVSRV9GQU5fWkVST19SUE1fRU5BQkxFICAgICAgICAgICAgICAxMQ0KKyNkZWZpbmUg
UFBfT0RfRkVBVFVSRV9GQU5fWkVST19SUE1fU1RPUF9URU1QICAgICAgICAgICAxMg0KDQogI2Rl
ZmluZSBMSU5LX1NQRUVEX01BWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMNCg0K
QEAgLTExMzUsNiArMTEzNiwxMCBAQCBzdGF0aWMgdm9pZCBzbXVfdjEzXzBfMF9nZXRfb2Rfc2V0
dGluZ19saW1pdHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogICAgICAgICAgICAgICAgb2Rf
bWluX3NldHRpbmcgPSBvdmVyZHJpdmVfbG93ZXJsaW1pdHMtPkZhblplcm9ScG1FbmFibGU7DQog
ICAgICAgICAgICAgICAgb2RfbWF4X3NldHRpbmcgPSBvdmVyZHJpdmVfdXBwZXJsaW1pdHMtPkZh
blplcm9ScG1FbmFibGU7DQogICAgICAgICAgICAgICAgYnJlYWs7DQorICAgICAgIGNhc2UgUFBf
T0RfRkVBVFVSRV9GQU5fWkVST19SUE1fU1RPUF9URU1QOg0KKyAgICAgICAgICAgICAgIG9kX21p
bl9zZXR0aW5nID0gb3ZlcmRyaXZlX2xvd2VybGltaXRzLT5GYW5aZXJvUnBtU3RvcFRlbXA7DQor
ICAgICAgICAgICAgICAgb2RfbWF4X3NldHRpbmcgPSBvdmVyZHJpdmVfdXBwZXJsaW1pdHMtPkZh
blplcm9ScG1TdG9wVGVtcDsNCisgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgZGVmYXVs
dDoNCiAgICAgICAgICAgICAgICBvZF9taW5fc2V0dGluZyA9IG9kX21heF9zZXR0aW5nID0gSU5U
X01BWDsNCiAgICAgICAgICAgICAgICBicmVhazsNCkBAIC0xNDczLDYgKzE0NzgsMjQgQEAgc3Rh
dGljIGludCBzbXVfdjEzXzBfMF9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtaW5fdmFsdWUsIG1h
eF92YWx1ZSk7DQogICAgICAgICAgICAgICAgYnJlYWs7DQoNCisgICAgICAgY2FzZSBTTVVfT0Rf
RkFOX1pFUk9fUlBNX1NUT1BfVEVNUDoNCisgICAgICAgICAgICAgICBpZiAoIXNtdV92MTNfMF8w
X2lzX29kX2ZlYXR1cmVfc3VwcG9ydGVkKHNtdSwNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBQX09EX0ZFQVRVUkVfWkVST19GQU5fQklU
KSkNCisgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgICAgICAgIHNp
emUgKz0gc3lzZnNfZW1pdF9hdChidWYsIHNpemUsICJGQU5fWkVST19SUE1fU1RPUF9URU1QRVJB
VFVSRTpcbiIpOw0KKyAgICAgICAgICAgICAgIHNpemUgKz0gc3lzZnNfZW1pdF9hdChidWYsIHNp
emUsICIlZFxuIiwNCisNCisgKGludClvZF90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmFuWmVyb1Jw
bVN0b3BUZW1wKTsNCisNCisgICAgICAgICAgICAgICBzaXplICs9IHN5c2ZzX2VtaXRfYXQoYnVm
LCBzaXplLCAiJXM6XG4iLCAiT0RfUkFOR0UiKTsNCisgICAgICAgICAgICAgICBzbXVfdjEzXzBf
MF9nZXRfb2Rfc2V0dGluZ19saW1pdHMoc211LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQUF9PRF9GRUFUVVJFX0ZBTl9aRVJPX1JQTV9TVE9QX1RF
TVAsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZt
aW5fdmFsdWUsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZtYXhfdmFsdWUpOw0KKyAgICAgICAgICAgICAgIHNpemUgKz0gc3lzZnNfZW1pdF9hdChi
dWYsIHNpemUsICJaRVJPX1JQTV9TVE9QX1RFTVBFUkFUVVJFOiAldSAldVxuIiwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWluX3ZhbHVlLCBtYXhfdmFsdWUpOw0KKyAg
ICAgICAgICAgICAgIGJyZWFrOw0KKw0KICAgICAgICBjYXNlIFNNVV9PRF9SQU5HRToNCiAgICAg
ICAgICAgICAgICBpZiAoIXNtdV92MTNfMF8wX2lzX29kX2ZlYXR1cmVfc3VwcG9ydGVkKHNtdSwg
UFBfT0RfRkVBVFVSRV9HRlhDTEtfQklUKSAmJg0KICAgICAgICAgICAgICAgICAgICAhc211X3Yx
M18wXzBfaXNfb2RfZmVhdHVyZV9zdXBwb3J0ZWQoc211LCBQUF9PRF9GRUFUVVJFX1VDTEtfQklU
KSAmJiBAQCAtMTU3NSw2ICsxNTk4LDExIEBAIHN0YXRpYyBpbnQgc211X3YxM18wXzBfb2RfcmVz
dG9yZV90YWJsZV9zaW5nbGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGxvbmcgaW5wDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vdF9vdmVyZHJpdmVfdGFibGUt
Pk92ZXJEcml2ZVRhYmxlLkZhblplcm9ScG1FbmFibGU7DQogICAgICAgICAgICAgICAgb2RfdGFi
bGUtPk92ZXJEcml2ZVRhYmxlLkZlYXR1cmVDdHJsTWFzayB8PSBCSVQoUFBfT0RfRkVBVFVSRV9a
RVJPX0ZBTl9CSVQpOw0KICAgICAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICBjYXNlIFBQX09E
X0VESVRfRkFOX1pFUk9fUlBNX1NUT1BfVEVNUDoNCisgICAgICAgICAgICAgICBvZF90YWJsZS0+
T3ZlckRyaXZlVGFibGUuRmFuWmVyb1JwbVN0b3BUZW1wID0NCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBib290X292ZXJkcml2ZV90YWJsZS0+T3ZlckRyaXZlVGFibGUu
RmFuWmVyb1JwbVN0b3BUZW1wOw0KKyAgICAgICAgICAgICAgIG9kX3RhYmxlLT5PdmVyRHJpdmVU
YWJsZS5GZWF0dXJlQ3RybE1hc2sgfD0gQklUKFBQX09EX0ZFQVRVUkVfWkVST19GQU5fQklUKTsN
CisgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgZGVmYXVsdDoNCiAgICAgICAgICAgICAg
ICBkZXZfaW5mbyhhZGV2LT5kZXYsICJJbnZhbGlkIHRhYmxlIGluZGV4OiAlbGRcbiIsIGlucHV0
KTsNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCkBAIC0xODg5LDYgKzE5MTcsMjcg
QEAgc3RhdGljIGludCBzbXVfdjEzXzBfMF9vZF9lZGl0X2RwbV90YWJsZShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwNCiAgICAgICAgICAgICAgICBvZF90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmVh
dHVyZUN0cmxNYXNrIHw9IEJJVChQUF9PRF9GRUFUVVJFX1pFUk9fRkFOX0JJVCk7DQogICAgICAg
ICAgICAgICAgYnJlYWs7DQoNCisgICAgICAgY2FzZSBQUF9PRF9FRElUX0ZBTl9aRVJPX1JQTV9T
VE9QX1RFTVA6DQorICAgICAgICAgICAgICAgaWYgKCFzbXVfdjEzXzBfMF9pc19vZF9mZWF0dXJl
X3N1cHBvcnRlZChzbXUsIFBQX09EX0ZFQVRVUkVfWkVST19GQU5fQklUKSkgew0KKyAgICAgICAg
ICAgICAgICAgICAgICAgZGV2X3dhcm4oYWRldi0+ZGV2LCAiWmVybyBSUE0gc2V0dGluZyBub3Qg
c3VwcG9ydGVkIVxuIik7DQorICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQ
Ow0KKyAgICAgICAgICAgICAgIH0NCisNCisgICAgICAgICAgICAgICBzbXVfdjEzXzBfMF9nZXRf
b2Rfc2V0dGluZ19saW1pdHMoc211LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBQUF9PRF9GRUFUVVJFX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVAsDQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtaW5pbXVt
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbWF4
aW11bSk7DQorICAgICAgICAgICAgICAgaWYgKGlucHV0WzBdIDwgbWluaW11bSB8fA0KKyAgICAg
ICAgICAgICAgICAgICBpbnB1dFswXSA+IG1heGltdW0pIHsNCisgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9pbmZvKGFkZXYtPmRldiwgInplcm8gUlBNIHN0b3AgdGVtcGVyYXR1cmUgc2V0dGlu
ZyglbGQpIG11c3QgYmUgd2l0aGluIFslZCwgJWRdIVxuIiwNCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlucHV0WzBdLCBtaW5pbXVtLCBtYXhpbXVtKTsNCisgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICAgICAgICAgICAgIH0NCisNCisgICAgICAg
ICAgICAgICBvZF90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmFuWmVyb1JwbVN0b3BUZW1wID0gaW5w
dXRbMF07DQorICAgICAgICAgICAgICAgb2RfdGFibGUtPk92ZXJEcml2ZVRhYmxlLkZlYXR1cmVD
dHJsTWFzayB8PSBCSVQoUFBfT0RfRkVBVFVSRV9aRVJPX0ZBTl9CSVQpOw0KKyAgICAgICAgICAg
ICAgIGJyZWFrOw0KKw0KICAgICAgICBjYXNlIFBQX09EX1JFU1RPUkVfREVGQVVMVF9UQUJMRToN
CiAgICAgICAgICAgICAgICBpZiAoc2l6ZSA9PSAxKSB7DQogICAgICAgICAgICAgICAgICAgICAg
ICByZXQgPSBzbXVfdjEzXzBfMF9vZF9yZXN0b3JlX3RhYmxlX3NpbmdsZShzbXUsIGlucHV0WzBd
KTsgQEAgLTIxNjEsNyArMjIxMCw5IEBAIHN0YXRpYyB2b2lkIHNtdV92MTNfMF8wX3NldF9zdXBw
b3J0ZWRfb2RfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPRF9PUFNfU1VQUE9SVF9GQU5fTUlO
SU1VTV9QV01fUkVUUklFVkUgfA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBPRF9PUFNfU1VQUE9SVF9GQU5fTUlOSU1VTV9QV01fU0VUIHwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT0RfT1BTX1NVUFBPUlRfRkFOX1pFUk9f
UlBNX0VOQUJMRV9SRVRSSUVWRSB8DQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE9EX09QU19TVVBQT1JUX0ZBTl9aRVJPX1JQTV9FTkFCTEVfU0VUOw0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPRF9PUFNfU1VQUE9SVF9GQU5f
WkVST19SUE1fRU5BQkxFX1NFVCB8DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE9EX09QU19TVVBQT1JUX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVBfUkVUUklFVkUg
fA0KKw0KKyBPRF9PUFNfU1VQUE9SVF9GQU5fWkVST19SUE1fU1RPUF9URU1QX1NFVDsNCiB9DQoN
CiBzdGF0aWMgaW50IHNtdV92MTNfMF8wX3NldF9kZWZhdWx0X29kX3NldHRpbmdzKHN0cnVjdCBz
bXVfY29udGV4dCAqc211KSBAQCAtMjIyOSw2ICsyMjgwLDggQEAgc3RhdGljIGludCBzbXVfdjEz
XzBfMF9zZXRfZGVmYXVsdF9vZF9zZXR0aW5ncyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkNCiAg
ICAgICAgICAgICAgICAgICAgICAgIHVzZXJfb2RfdGFibGVfYmFrLk92ZXJEcml2ZVRhYmxlLkZh
bk1pbmltdW1Qd207DQogICAgICAgICAgICAgICAgdXNlcl9vZF90YWJsZS0+T3ZlckRyaXZlVGFi
bGUuRmFuWmVyb1JwbUVuYWJsZSA9DQogICAgICAgICAgICAgICAgICAgICAgICB1c2VyX29kX3Rh
YmxlX2Jhay5PdmVyRHJpdmVUYWJsZS5GYW5aZXJvUnBtRW5hYmxlOw0KKyAgICAgICAgICAgICAg
IHVzZXJfb2RfdGFibGUtPk92ZXJEcml2ZVRhYmxlLkZhblplcm9ScG1TdG9wVGVtcCA9DQorDQor
IHVzZXJfb2RfdGFibGVfYmFrLk92ZXJEcml2ZVRhYmxlLkZhblplcm9ScG1TdG9wVGVtcDsNCiAg
ICAgICAgfQ0KDQogICAgICAgIHNtdV92MTNfMF8wX3NldF9zdXBwb3J0ZWRfb2RfZmVhdHVyZV9t
YXNrKHNtdSk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUx
My9zbXVfdjEzXzBfN19wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTMv
c211X3YxM18wXzdfcHB0LmMNCmluZGV4IDZiNjE2NTVmOS4uMGIzYzUzMzI0IDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMy9zbXVfdjEzXzBfN19wcHQuYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMy9zbXVfdjEzXzBfN19wcHQu
Yw0KQEAgLTg0LDYgKzg0LDcgQEANCiAjZGVmaW5lIFBQX09EX0ZFQVRVUkVfRkFOX1RBUkdFVF9U
RU1QRVJBVFVSRSAgICAgICAgICAgOQ0KICNkZWZpbmUgUFBfT0RfRkVBVFVSRV9GQU5fTUlOSU1V
TV9QV00gICAgICAgICAgICAgICAgICAxMA0KICNkZWZpbmUgUFBfT0RfRkVBVFVSRV9GQU5fWkVS
T19SUE1fRU5BQkxFICAgICAgICAgICAgICAxMQ0KKyNkZWZpbmUgUFBfT0RfRkVBVFVSRV9GQU5f
WkVST19SUE1fU1RPUF9URU1QICAgICAgICAgICAxMg0KDQogI2RlZmluZSBMSU5LX1NQRUVEX01B
WCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMNCg0KQEAgLTExMjQsNiArMTEyNSwx
MCBAQCBzdGF0aWMgdm9pZCBzbXVfdjEzXzBfN19nZXRfb2Rfc2V0dGluZ19saW1pdHMoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsDQogICAgICAgICAgICAgICAgb2RfbWluX3NldHRpbmcgPSBvdmVy
ZHJpdmVfbG93ZXJsaW1pdHMtPkZhblplcm9ScG1FbmFibGU7DQogICAgICAgICAgICAgICAgb2Rf
bWF4X3NldHRpbmcgPSBvdmVyZHJpdmVfdXBwZXJsaW1pdHMtPkZhblplcm9ScG1FbmFibGU7DQog
ICAgICAgICAgICAgICAgYnJlYWs7DQorICAgICAgIGNhc2UgUFBfT0RfRkVBVFVSRV9GQU5fWkVS
T19SUE1fU1RPUF9URU1QOg0KKyAgICAgICAgICAgICAgIG9kX21pbl9zZXR0aW5nID0gb3ZlcmRy
aXZlX2xvd2VybGltaXRzLT5GYW5aZXJvUnBtU3RvcFRlbXA7DQorICAgICAgICAgICAgICAgb2Rf
bWF4X3NldHRpbmcgPSBvdmVyZHJpdmVfdXBwZXJsaW1pdHMtPkZhblplcm9ScG1TdG9wVGVtcDsN
CisgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgZGVmYXVsdDoNCiAgICAgICAgICAgICAg
ICBvZF9taW5fc2V0dGluZyA9IG9kX21heF9zZXR0aW5nID0gSU5UX01BWDsNCiAgICAgICAgICAg
ICAgICBicmVhazsNCkBAIC0xNDYyLDYgKzE0NjcsMjQgQEAgc3RhdGljIGludCBzbXVfdjEzXzBf
N19wcmludF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtaW5fdmFsdWUsIG1heF92YWx1ZSk7DQogICAgICAg
ICAgICAgICAgYnJlYWs7DQoNCisgICAgICAgY2FzZSBTTVVfT0RfRkFOX1pFUk9fUlBNX1NUT1Bf
VEVNUDoNCisgICAgICAgICAgICAgICBpZiAoIXNtdV92MTNfMF83X2lzX29kX2ZlYXR1cmVfc3Vw
cG9ydGVkKHNtdSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFBQX09EX0ZFQVRVUkVfWkVST19GQU5fQklUKSkNCisgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgICAgICAgIHNpemUgKz0gc3lzZnNfZW1pdF9h
dChidWYsIHNpemUsICJGQU5fWkVST19SUE1fU1RPUF9URU1QRVJBVFVSRTpcbiIpOw0KKyAgICAg
ICAgICAgICAgIHNpemUgKz0gc3lzZnNfZW1pdF9hdChidWYsIHNpemUsICIlZFxuIiwNCisNCisg
KGludClvZF90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmFuWmVyb1JwbVN0b3BUZW1wKTsNCisNCisg
ICAgICAgICAgICAgICBzaXplICs9IHN5c2ZzX2VtaXRfYXQoYnVmLCBzaXplLCAiJXM6XG4iLCAi
T0RfUkFOR0UiKTsNCisgICAgICAgICAgICAgICBzbXVfdjEzXzBfN19nZXRfb2Rfc2V0dGluZ19s
aW1pdHMoc211LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQUF9PRF9GRUFUVVJFX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVAsDQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtaW5fdmFsdWUsDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtYXhfdmFsdWUpOw0K
KyAgICAgICAgICAgICAgIHNpemUgKz0gc3lzZnNfZW1pdF9hdChidWYsIHNpemUsICJaRVJPX1JQ
TV9TVE9QX1RFTVBFUkFUVVJFOiAldSAldVxuIiwNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbWluX3ZhbHVlLCBtYXhfdmFsdWUpOw0KKyAgICAgICAgICAgICAgIGJyZWFr
Ow0KKw0KICAgICAgICBjYXNlIFNNVV9PRF9SQU5HRToNCiAgICAgICAgICAgICAgICBpZiAoIXNt
dV92MTNfMF83X2lzX29kX2ZlYXR1cmVfc3VwcG9ydGVkKHNtdSwgUFBfT0RfRkVBVFVSRV9HRlhD
TEtfQklUKSAmJg0KICAgICAgICAgICAgICAgICAgICAhc211X3YxM18wXzdfaXNfb2RfZmVhdHVy
ZV9zdXBwb3J0ZWQoc211LCBQUF9PRF9GRUFUVVJFX1VDTEtfQklUKSAmJiBAQCAtMTU2Myw2ICsx
NTg2LDExIEBAIHN0YXRpYyBpbnQgc211X3YxM18wXzdfb2RfcmVzdG9yZV90YWJsZV9zaW5nbGUo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGxvbmcgaW5wDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYm9vdF9vdmVyZHJpdmVfdGFibGUtPk92ZXJEcml2ZVRhYmxlLkZh
blplcm9ScG1FbmFibGU7DQogICAgICAgICAgICAgICAgb2RfdGFibGUtPk92ZXJEcml2ZVRhYmxl
LkZlYXR1cmVDdHJsTWFzayB8PSBCSVQoUFBfT0RfRkVBVFVSRV9aRVJPX0ZBTl9CSVQpOw0KICAg
ICAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICBjYXNlIFBQX09EX0VESVRfRkFOX1pFUk9fUlBN
X1NUT1BfVEVNUDoNCisgICAgICAgICAgICAgICBvZF90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmFu
WmVyb1JwbVN0b3BUZW1wID0NCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib290X292ZXJkcml2ZV90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmFuWmVyb1JwbVN0b3BUZW1w
Ow0KKyAgICAgICAgICAgICAgIG9kX3RhYmxlLT5PdmVyRHJpdmVUYWJsZS5GZWF0dXJlQ3RybE1h
c2sgfD0gQklUKFBQX09EX0ZFQVRVUkVfWkVST19GQU5fQklUKTsNCisgICAgICAgICAgICAgICBi
cmVhazsNCiAgICAgICAgZGVmYXVsdDoNCiAgICAgICAgICAgICAgICBkZXZfaW5mbyhhZGV2LT5k
ZXYsICJJbnZhbGlkIHRhYmxlIGluZGV4OiAlbGRcbiIsIGlucHV0KTsNCiAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCkBAIC0xODc3LDYgKzE5MDUsMjcgQEAgc3RhdGljIGludCBzbXVf
djEzXzBfN19vZF9lZGl0X2RwbV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCiAgICAg
ICAgICAgICAgICBvZF90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmVhdHVyZUN0cmxNYXNrIHw9IEJJ
VChQUF9PRF9GRUFUVVJFX1pFUk9fRkFOX0JJVCk7DQogICAgICAgICAgICAgICAgYnJlYWs7DQoN
CisgICAgICAgY2FzZSBQUF9PRF9FRElUX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVA6DQorICAgICAg
ICAgICAgICAgaWYgKCFzbXVfdjEzXzBfN19pc19vZF9mZWF0dXJlX3N1cHBvcnRlZChzbXUsIFBQ
X09EX0ZFQVRVUkVfWkVST19GQU5fQklUKSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgZGV2
X3dhcm4oYWRldi0+ZGV2LCAiWmVybyBSUE0gc2V0dGluZyBub3Qgc3VwcG9ydGVkIVxuIik7DQor
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQOw0KKyAgICAgICAgICAgICAg
IH0NCisNCisgICAgICAgICAgICAgICBzbXVfdjEzXzBfN19nZXRfb2Rfc2V0dGluZ19saW1pdHMo
c211LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
UF9PRF9GRUFUVVJFX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVAsDQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtaW5pbXVtLA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbWF4aW11bSk7DQorICAgICAgICAg
ICAgICAgaWYgKGlucHV0WzBdIDwgbWluaW11bSB8fA0KKyAgICAgICAgICAgICAgICAgICBpbnB1
dFswXSA+IG1heGltdW0pIHsNCisgICAgICAgICAgICAgICAgICAgICAgIGRldl9pbmZvKGFkZXYt
PmRldiwgInplcm8gUlBNIHN0b3AgdGVtcGVyYXR1cmUgc2V0dGluZyglbGQpIG11c3QgYmUgd2l0
aGluIFslZCwgJWRdIVxuIiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlucHV0
WzBdLCBtaW5pbXVtLCBtYXhpbXVtKTsNCisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KKyAgICAgICAgICAgICAgIH0NCisNCisgICAgICAgICAgICAgICBvZF90YWJsZS0+
T3ZlckRyaXZlVGFibGUuRmFuWmVyb1JwbVN0b3BUZW1wID0gaW5wdXRbMF07DQorICAgICAgICAg
ICAgICAgb2RfdGFibGUtPk92ZXJEcml2ZVRhYmxlLkZlYXR1cmVDdHJsTWFzayB8PSBCSVQoUFBf
T0RfRkVBVFVSRV9aRVJPX0ZBTl9CSVQpOw0KKyAgICAgICAgICAgICAgIGJyZWFrOw0KKw0KICAg
ICAgICBjYXNlIFBQX09EX1JFU1RPUkVfREVGQVVMVF9UQUJMRToNCiAgICAgICAgICAgICAgICBp
ZiAoc2l6ZSA9PSAxKSB7DQogICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzbXVfdjEzXzBf
N19vZF9yZXN0b3JlX3RhYmxlX3NpbmdsZShzbXUsIGlucHV0WzBdKTsgQEAgLTIxNDUsNyArMjE5
NCw5IEBAIHN0YXRpYyB2b2lkIHNtdV92MTNfMF83X3NldF9zdXBwb3J0ZWRfb2RfZmVhdHVyZV9t
YXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBPRF9PUFNfU1VQUE9SVF9GQU5fTUlOSU1VTV9QV01fUkVUUklFVkUg
fA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPRF9PUFNfU1VQ
UE9SVF9GQU5fTUlOSU1VTV9QV01fU0VUIHwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgT0RfT1BTX1NVUFBPUlRfRkFOX1pFUk9fUlBNX0VOQUJMRV9SRVRSSUVW
RSB8DQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9EX09QU19T
VVBQT1JUX0ZBTl9aRVJPX1JQTV9FTkFCTEVfU0VUOw0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBPRF9PUFNfU1VQUE9SVF9GQU5fWkVST19SUE1fRU5BQkxFX1NF
VCB8DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9EX09QU19T
VVBQT1JUX0ZBTl9aRVJPX1JQTV9TVE9QX1RFTVBfUkVUUklFVkUgfA0KKw0KKyBPRF9PUFNfU1VQ
UE9SVF9GQU5fWkVST19SUE1fU1RPUF9URU1QX1NFVDsNCiB9DQoNCiBzdGF0aWMgaW50IHNtdV92
MTNfMF83X3NldF9kZWZhdWx0X29kX3NldHRpbmdzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KSBA
QCAtMjIxMyw2ICsyMjY0LDggQEAgc3RhdGljIGludCBzbXVfdjEzXzBfN19zZXRfZGVmYXVsdF9v
ZF9zZXR0aW5ncyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkNCiAgICAgICAgICAgICAgICAgICAg
ICAgIHVzZXJfb2RfdGFibGVfYmFrLk92ZXJEcml2ZVRhYmxlLkZhbk1pbmltdW1Qd207DQogICAg
ICAgICAgICAgICAgdXNlcl9vZF90YWJsZS0+T3ZlckRyaXZlVGFibGUuRmFuWmVyb1JwbUVuYWJs
ZSA9DQogICAgICAgICAgICAgICAgICAgICAgICB1c2VyX29kX3RhYmxlX2Jhay5PdmVyRHJpdmVU
YWJsZS5GYW5aZXJvUnBtRW5hYmxlOw0KKyAgICAgICAgICAgICAgIHVzZXJfb2RfdGFibGUtPk92
ZXJEcml2ZVRhYmxlLkZhblplcm9ScG1TdG9wVGVtcCA9DQorDQorIHVzZXJfb2RfdGFibGVfYmFr
Lk92ZXJEcml2ZVRhYmxlLkZhblplcm9ScG1TdG9wVGVtcDsNCiAgICAgICAgfQ0KDQogICAgICAg
IHNtdV92MTNfMF83X3NldF9zdXBwb3J0ZWRfb2RfZmVhdHVyZV9tYXNrKHNtdSk7DQotLQ0KMi40
Ny4wDQoNCg==
