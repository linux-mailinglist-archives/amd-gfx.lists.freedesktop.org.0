Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U7nzH9vKLGqoWQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jun 2026 05:13:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56867D985
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jun 2026 05:13:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=nio5AkbU;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FC510EBD9;
	Sat, 13 Jun 2026 03:13:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7204710EBD9
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jun 2026 03:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWtsVG3o8j/+kvwo+Q/u9Kweufy7AYu6vtYeESlKkkJfXqpuNMzL9bucWf62u3jIX4jdqMZfMdafTRQfUYXaYX78LuS9R02anzc+TZJrRpRckIOxf+LvSXA8HnD2csok6DArbAyvCiREEimXT1grlLzMiKr8NoaIShC9s7DYLHrd5kD32oe5pcttoYuYxiix3Q+OeqJ8E6nxwJppYD03vGontXsSXMb8KJ5MPpDM4ISsBocd4urPz0yO2STu8LoNY06zH3CHAyQZfWbusezWgYdhoRsg3h227EjnyJyAF7/5pkmeHG7x6ab/CLcFnawGPj6QqbWY69tuzDZ4YO1UgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/ToA7OBrOy1SPexYv+m3rZXmcdzICSa6wJ9e5oPgSU=;
 b=bMnB1jSykR859cBgHVC4rcKeW3spoInEMfIVYc5EQD91WFFHzBZWqRY/rq5HZ2I8KtmXaP+eBrWqs8VrlXYwIYlzaPrlSrDdn9T5FPMUdV/UBHqdka/qHdqHSGtLPuijzUqm70+3bRij4u+HLVElI/seSM1wgj1qB9hdU1gXL43PCwu0T6sThqqxEzwzkahdN+KKTcEYqSGZdBfMXHHBI5t6tiwPyHqjJGWBEKaWQSaCIqYo1PqJR271xvKuG8ty2HOGu8Fj96PHIGwSWNxfN1sCjtlUkXCA5dMo93CgGX/agGzbgHgqBJorWYpFO0au5N3Frq62GdufV0UOqqKbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/ToA7OBrOy1SPexYv+m3rZXmcdzICSa6wJ9e5oPgSU=;
 b=nio5AkbUjK1Ql8LjWXHKitjaIrEeKwmbkSCMGr0GEfZ/iGMxpAb9PJll13cnOnBM/c7q6LOG7hu2sX+/DSKXgUomiJDBFIAyA3weP7YiA2DONM9u71qSG7jtrx5BwXWZmiVYyy+jJJ45ftcZXZKAeVSlzv1jf02La0JVNyyBejI=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 03:13:23 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0113.014; Sat, 13 Jun 2026
 03:13:23 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Lin, Amber" <Amber.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdkfd: Add queue reset support on gfx11 dGPU
Thread-Topic: [PATCH 2/2] drm/amdkfd: Add queue reset support on gfx11 dGPU
Thread-Index: AQHc+uEWSPwOBe+4M0qptwYrnjTLpLY7zzow
Date: Sat, 13 Jun 2026 03:13:22 +0000
Message-ID: <DM4PR12MB5152F7390E4811190BF83DFFE3192@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260613030152.945160-1-Amber.Lin@amd.com>
 <20260613030152.945160-2-Amber.Lin@amd.com>
In-Reply-To: <20260613030152.945160-2-Amber.Lin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-13T03:12:39.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|BL1PR12MB5729:EE_
x-ms-office365-filtering-correlation-id: f0c2a1ff-9408-4e56-3ed9-08dec8f9ba27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|4143699003|56012099006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: SdgjNIsNNd67+NNl9JqI8Lx+iYcC01v7xwMQKplyDNxNDha60ZnIzci4y8Jarq+N2LuDUFJZHebn9NVhV9QlL2y3LIAd/Alb6Oag8j5dgDHQMe4xO7YOgvVvXZ/JZBHhHlnQg5yaU+xf9xi6QcvaB2ScdUqnILeVHA8AA3bjNqwMsmFM1eiIZ1mtDsb0o5F47qm0wnuSv65smatQwaRZL108nB3A66RGBmi48ds5vVlgD+8ghsEwmO7TokmXlnPCTENc9V+8JZbpqkQZocgUt4F9ExdJIgJ2hmqIdeIS6yZRCksSY+PI9+9Waaw0UqwdWtcek4ddmzTkYTYF3PFxybkFuLQ3/95+rMcmbyW2r4AJMy27lvoX8mpK3Tam+UMh0CZeadSGw7d1QU+3QJUcwHc94Rp9KwC15xIdqWkjza+RO0oNkiTQedDUlIBSeBDLrJievDjkhIgeM7CZaUpmgk/QQevShFf65Ptdp49h79IZ9jkPEP0QODSzU9MSVrnN5SQgNIPZy0s3BesVYkv+yy/aTqf/10iRZ/OmrEjp2TZwIEA1GpvCqZH0Qwop8HPracdGTww+7IKy5JTud2seFbVaWtE0c6luGCrOzID9Ew31dmXYUiqrX9J5dK/n7YzgGwFFXPuH5g1zyfOLrXdhyLce31ej8zmq6wxDLDZOUV5zE0X+l03d7lFg0IUCdCvrzI7rbYnexhQbeeLUgaZAA+LVRgNdiV6B/gnQeiVwZQlLy4OiFcED2UOmUFnFBtI7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(6133799003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ccBjatDR/01Wc5/ps5ZCz4l4YRn8zNpnlmf633+ejp/CxFV9StdgxRCSqcib?=
 =?us-ascii?Q?K+ef1OZ67LUSqufa3sGI7ZOI/u5zsmrvLu13clykdAim0OOo7Vaw/2fDNNbW?=
 =?us-ascii?Q?dYfwIR+yUOQupuEcwPeTzMctjsd9Q6KEPFs+1Ub0UxmUYrknQhuQABt1+knn?=
 =?us-ascii?Q?5e28mOwNCP1Dzn2jg42qRyAE5Nrl0p8G3Anw7Dxx+nAmPQBxAlw8/u/E2GJK?=
 =?us-ascii?Q?N5GWTJNo5Lk2s/pzRJTQixSlUslJtbfDSPYIbk/xM28RKn8Mm3qvqDKSsaTO?=
 =?us-ascii?Q?8C3hCII82ZO3kn/63W7Q/3OpOUsD3IQMGSXuAsXGKwd2XM4zn9nvlrhxdFjl?=
 =?us-ascii?Q?lPLdCZocxx46g9pHXBoEchNorlIQzlufvk2/9PUPVKklnuvhl6sjcTWyFxn3?=
 =?us-ascii?Q?UrNAqfQ9poVuFnXfvjensYkUYviTnxWp6y8IU7oE49ak0g4fUbzc/C1xz+Zz?=
 =?us-ascii?Q?EUVEeCYzPhHoeFgOZbbw3BIxMcpEHip8/97c/Ta4hjNd+hRrJFrFmkSVVe53?=
 =?us-ascii?Q?Up+Czb51SXWq41OUDmylAR/J2RGCPAYGkiWEvCY2nlFw8sAokkntOMfUF4sz?=
 =?us-ascii?Q?osiwDCYgrcIVq1MrBGPXqjqw3KSbfZL8KSFeX909jHhY9Xia9ReqgckaHtOX?=
 =?us-ascii?Q?a9J6lh5m+ltkjg5f51vMQaH7Waru+RuiPonUKT1vNbNc6TY7N6vUoSzzHpN2?=
 =?us-ascii?Q?2s7dxfmPrjiQX/Zny18Q+Nc4YGJ/DZ0LtSCul2r+i/zR6n9tDU/ekz9WQkZA?=
 =?us-ascii?Q?NlPywlupxdhwLQnG8aAV9Pkzp6kDq+gNIPNnPbfs4Jf13oOZDPg2SwJLxsd5?=
 =?us-ascii?Q?7c4RYcKOC6Xst5WTY7Lk8QzkG0SprXF+JndBWUCcD1Fpx8JRDXEj4LQNQ5wq?=
 =?us-ascii?Q?EpPrNLWM69XJbdUSH81WwSkJIrnOQ9FWG98mzpDe6tAqUgoiT0tOwAWba5Fj?=
 =?us-ascii?Q?tpQJCHRCiHvM7vuCrkElYyEVsn0yCg8RCYrtDHD3bEABjD4i5ab1hPiXgn1X?=
 =?us-ascii?Q?eBmX1hIYCEtkDWNcBRS3qs7c9WYvKpNpFEuiJJcB+4JQ6cKiyCMQGt/1ksO9?=
 =?us-ascii?Q?vOnudKdkZD0P7mdj/3ybLNxE74r1o2gq8jSSmt8mpwI7YaD7/2W92FE4MEtD?=
 =?us-ascii?Q?UpNdNLDnDSqb/RkLFc1khKJ8w2G+BiTGhqHQU1jlYZK+PbDxKipbbNl3ugeF?=
 =?us-ascii?Q?iuX++IZJ2a8N0zbpMpS1KmqjPtod9xM8PQkeoFaTU7dxX+NxsCSRJ5NJtnTk?=
 =?us-ascii?Q?Dq8asCXRGWIuDOVU3NH3oOG38Fnw6gTThtPrI6ZT7p2tlZJngv1zhhbzf6OM?=
 =?us-ascii?Q?UWK9EcwrYACInjySWmqdQwsEa15yyi6BLfwHnaAvx9nYy4qEdKLFpk7oeJVM?=
 =?us-ascii?Q?uILl5mBC0ua9cAz8DsAWL2eNm/wlER8N1VnZm8KcLJdAM2laWd8TnVjJQgbW?=
 =?us-ascii?Q?r3rNUV86l5LX7yubp86ZeEbFx1j12VUd1lMXjOrmAxnYeo9lQSpANXYx5kuP?=
 =?us-ascii?Q?GPlmyl+CLSfgpkm89ZshHJE55qKhSEaY/ZbOAG+GcGBbrrtDGBAY/OckscUb?=
 =?us-ascii?Q?N2UiQHJ+otkDgb6DFgeIbdvah5HCU3tzyWx3HA6afQkSTmxt3OuxuhmugP1O?=
 =?us-ascii?Q?9UEIA5MRzw+Hjp51+68pItx3/IXTMY7mLId5/vXKzmNVXEa4MUEgGzOt5T5H?=
 =?us-ascii?Q?CjfPg5XFcZubRmk6Y+DkCD9xXEW6x/0rzfwlgiOt0bAjSDlZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c2a1ff-9408-4e56-3ed9-08dec8f9ba27
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2026 03:13:22.8224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jzemY00NU0OEvl9mBbCj+/UBgBfgtijrrBoKxkyEGgTaaz2gEEq/C3YXfXBL2PeOIvpTuK8XLQcYY6AdKJ7+hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Amber.Lin@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC56867D985

AMD General

Series is Reviewed-by: Jesse.zhang@amd.com

> -----Original Message-----
> From: Lin, Amber <Amber.Lin@amd.com>
> Sent: Saturday, June 13, 2026 11:02 AM
> To: amd-gfx@lists.freedesktop.org; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com=
>
> Cc: Lin, Amber <Amber.Lin@amd.com>
> Subject: [PATCH 2/2] drm/amdkfd: Add queue reset support on gfx11 dGPU
>
> This patch enable queue reset support to KFD topology for gfx11 dGPUs
>
> Signed-off-by: Amber Lin <Amber.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 0ff793a17857..01a8a2171f8e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -2019,6 +2019,11 @@ static void kfd_topology_set_capabilities(struct
> kfd_topology_device *dev)
>       } else {
>               dev->node_props.debug_prop |=3D
> HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10 |
>                                       HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
> +             /* gfx11 dGPU */
> +             if ((KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(11, 0, 0)) =
||
> +                     (KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(11, 0, =
2))
> ||
> +                     (KFD_GC_VERSION(dev->gpu) =3D=3D IP_VERSION(11, 0, =
3)))
> +                     dev->node_props.capability |=3D
> HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
>
>               if (KFD_GC_VERSION(dev->gpu) >=3D IP_VERSION(12, 0, 0))
>                       dev->node_props.capability |=3D
> --
> 2.34.1

