Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lSCwB8H0S2q4dgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 20:32:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79F77148B5
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 20:32:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=BlGhvcrM;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3863D10EA5F;
	Mon,  6 Jul 2026 18:32:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012049.outbound.protection.outlook.com
 [40.93.195.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DCB10EA4F
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2026 18:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIJzJqfxfhJl9CrRNjJRAJEEO+ExVUG6ivnWBKvrc1bEX4gGdIF5UJ4oNAWo5DK+u7h6AkbRV+Nyuo+agR6aoxcZXIpEpBAiamI5VGliLuNMgzJC7kKi55dVX1Xs3nGKO1LDs6z6yRwYoDg/oNfEBEXmoGSOozriZlDDYHVK7ZptjcPGHTvcFSyfKU5uNedym8OcUPmi69vLf7VPcVO7t6IC4J7rHLi8IOippdM1mWjx7TbQToA7fG5SO0M6w5m1jxd6bPBy8PUwik+pkyzjjs+jNxm0RIlrXCOPTfHTMea6v0/lhfeNirH9APmcl/5oPWTE7bhSqy80my/qe12QWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VepU1bML+W2lqsHlhhMdId9ImrcTImCmFmZjMNxzjzU=;
 b=q1A4CRodWy4jGaliEF9weUUbjDqn6uCt3WX4dZnTp6QgCydfviNYc8qG4Vzny5g1Zam+a6qIv0Z8aqvDRpFieREZ6JvWmMZA1W4xQXLhpmWNWX7rCv91tn+Q5gvQfcgpMH7NzR61FVp5+EhXMOYRAr+Y7p1x7VKo6Xs9rTTk7IbN1DXsantloMbe9BhdOOX8E2VQ86hPgP1+JZPAKN8v64Fa6UvVSLpVVQuvFCKep3jpOYm69OHXZqPE8wb1djCQxzIgFZoEmXjASXrXMFf10iVTFeAybTb7lJDcJe2wTzpasu2XVFOjkEWS85rFvXTxuPPORF4Bp5QccdsvaXYe5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VepU1bML+W2lqsHlhhMdId9ImrcTImCmFmZjMNxzjzU=;
 b=BlGhvcrMs4AKU0wyFQgr+JNUrmFxdMiKtXKzBALA8lgxDqfopmgakRZX+V12JJWwkC/qff3QnbnwCmunHnFvgld7kCkajhzX4oSIykVygtwLap+27Wr3sTgovbOhA8qioP87rjaaPL5ZNDRG38fxYcCcOJZZCS8c7GuShHsyLdw=
Received: from SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 by SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 18:32:18 +0000
Received: from SA0PR12MB4397.namprd12.prod.outlook.com
 ([fe80::9524:b7ca:358d:4bdc]) by SA0PR12MB4397.namprd12.prod.outlook.com
 ([fe80::9524:b7ca:358d:4bdc%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 18:32:18 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: "Francis, David" <David.Francis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Francis, David" <David.Francis@amd.com>
Subject: RE: [PATCH v2] drm/amdkfd: Check bounds in
 allocate_event_notification_slot
Thread-Topic: [PATCH v2] drm/amdkfd: Check bounds in
 allocate_event_notification_slot
Thread-Index: AQHdA967vzKkwoQPQ06ceg9ZETotxbZg41ZQ
Date: Mon, 6 Jul 2026 18:32:18 +0000
Message-ID: <SA0PR12MB4397C8756C86129DE3AF080095F12@SA0PR12MB4397.namprd12.prod.outlook.com>
References: <20260624133747.1645343-1-David.Francis@amd.com>
In-Reply-To: <20260624133747.1645343-1-David.Francis@amd.com>
Accept-Language: en-US, en-CA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-06T18:30:37.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR12MB4397:EE_|SA1PR12MB8117:EE_
x-ms-office365-filtering-correlation-id: 968dd25f-9ac2-4fc9-40e4-08dedb8ce945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: OYzDK+jeA7E64MncqvFYzr+iIo999inOhhJJIzaBrhsQaraAD4tRbZED4dynsjj2VSToNuKjtBMuX05wOicLYhNsMG8Tz6vxbtFEVurrJX1sJdLODE1piQrBSujDcp24ZlDVZv17lbPNZUHNMG/8ujbM/kvb/FV2QduR2bvFfVzn+r6txHmdG/oY3EHrK7qId1Vjx1E7MXRyJmwxhRSYpdWmTXjIqI1Fiwmw3Q+4lTcto0lUcwQ2Rj3vZR8WHkCO0lFIeTzyU8+UflaSkrDARRh7+0CVeL7+JU6Vwzq0dEB4b1EU/TaVuMbP8SNNtiKWZwrUGGnoL6HY7dzu4FgCNdxT2N9/EVSZg/gWznrxDqlkR1bEf/Y2O/mxgGWVdSo5Lnr5Wik7zzdZcR6KrVELrkfRgVf5c0pdMmwtPpmm6JZC+xtSweAxK2tOLPrCmBf5J8yhU3dcdU2vdCGFtyuwjOAbJ/u2e6g4kHPZ/BKmG67eFYLT+p9gSt5qkNoQpZoLCeQQZB9yeproMn3oq6T834MyKeOctT0CA5QtUP0aFKZRcraM+caCc7KWZQrv+CHw97H7E12Okz3Mq2xfczk+s68u4+s1wE2MpyfF4vkKpDioMW8KnI+DqS+aQKk+eMh5id1k4fe5U/ogj0I89sa+DLaC9UNIt+DzAWt/ZnHoeRUnLzfS9D+CoLfzU14EH29AdZalGBa84xx8XTKtd1he5InhrWX6FshQFGmBn28Ev/o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4397.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YTVqSnN9uqgOuwHcu7vCyoKZ8Vtxiruz60rik9DDl24LOIylc7KCyJLaVVs+?=
 =?us-ascii?Q?pLqe0YeqpP7F+4WTrhEjx5TPOMH0w0rwi0N2kfNlLhuPw8KBVyBLU6p5RLzV?=
 =?us-ascii?Q?V9r0eomWpCxRe/SPlHRPp2OAWOU5KiGvQRkAy6UTZU22bgiVWHWTdXsFjcaS?=
 =?us-ascii?Q?PLAz1M6WoZ1ao0N20Wm0GKvHS8FB00F4pBgU2Ktk+g9fIBpG/95Kn/hDqrRH?=
 =?us-ascii?Q?cUUsIX/ecgE6CLPTR2EW75Du+8Kb3cpqV3TURJDowq/iaKHkq+r2nXYDy4M0?=
 =?us-ascii?Q?ukE+PmAIT2IbFXFFOYqot63G3QfezJJ24UlBkVhJ/pZJWTnuChW33waSGk8y?=
 =?us-ascii?Q?po8YGxURlYq5vXTU3vf5X7CbvxZFddgS2hhw5CzWTfgzs4pRmXlEus2kinPI?=
 =?us-ascii?Q?ecEOGZ+ZqNAbYFdUfBtJoK+si85X+omT+EvOJuC0mlpZjxMkrOZqTyCOASi2?=
 =?us-ascii?Q?j8QFVZ5j7KP4KuWCKaEj60ltLzPjfT79s1ON/Q2dglEfOqVPG1SNa8/Zl2O5?=
 =?us-ascii?Q?z9iNS7qRLwFlYywY8j26Fkmv1aQ4Uiv32a82jdd5qETwn/jwEzGJvoikWnKd?=
 =?us-ascii?Q?FX+guT0ABh+e1rcNoex0SIJW4SMaTkSK2W4AEUS8xrKmE7qVFUJ5g5EI9l1N?=
 =?us-ascii?Q?PEQY6ZR3l7NEWpcRdXjLYmfvDur6czye7U4Aa1AKsmaGIVV/iIxsTq9PXGCz?=
 =?us-ascii?Q?b24eI84yzZi1086nwCDbAF6raaOsggeP2MAoB3MWtbEYbhPMp/B9QlxD5idi?=
 =?us-ascii?Q?Vj3ZfI92D5CWB7cB2jNU9/EIM4bWgZOGvoKysYsgKvohdR5eMdIqI8SwDZRb?=
 =?us-ascii?Q?cjbZVxefgDl3kpIv2wGb19wtcEkbCbT5FArTKKCtbpXwJh7tATciJ3fLAVa9?=
 =?us-ascii?Q?Cj1HdZdl4fbZUWnhv4HVxcspWaJWghkKe6UIm+JKIRh1axw/6k8qZxidgjcf?=
 =?us-ascii?Q?V7vK0vC72ibdbCDuDoyQnZC18zbe0rRJ0y0jW2JNCtFN5CYoncq9sFGyXTpy?=
 =?us-ascii?Q?OoVciIwQwpLobaQ1gBITUm5Bw0SebP9Jdp/B2oVNZsoSmEMVGM5DsdYcjXlX?=
 =?us-ascii?Q?HjsQNs6YhcoH7VHl1qYXmXxVtUPYOHljarsUW6TNwHRNJYe6NLPSTbpSdS74?=
 =?us-ascii?Q?R///IR8jDG+e48xBxbnTLkIDRD+Uw24yRutIuLlsNgpkaanZqbxCp+cWz/nM?=
 =?us-ascii?Q?phNY1SIrS01r4UcTQuUlYUwPzMeo6+VL6DE1EDBuH/vVNoAJoZzaPN3Fcke5?=
 =?us-ascii?Q?FyW3PPReLnDFuVdIjJyzpC7TwhRt5NmC/ujD2tRiNxPxLdBdHNDX75UNCpKQ?=
 =?us-ascii?Q?jMwUrIRBZ9RY/nhEZRzQWcbrf2Ib5muvZK7Z++88x4rxRF/mC1awDwc1ewud?=
 =?us-ascii?Q?uhtwtH0qy/zoDHUxTF+TC9itAgFbRzVMdoaPqaCjxfHp78c3X+wgc9Ys7M7a?=
 =?us-ascii?Q?q47MrEEI6BBlyxBGGWiuOOW6wzYUzvRu4VlCVP0iQuY2VAUvevtshg5DNzfn?=
 =?us-ascii?Q?Nc1Man+V1Yv+kIVH75lJi1VxxSqnDdfKE49ECLO19VEOQlGuMzoaaXX9eIAi?=
 =?us-ascii?Q?rThC3VShXpCBlQqFeqlWw59eyWgoSbfIoa0vCD8bGcdkGAtNaiJAySG+m/R7?=
 =?us-ascii?Q?Ppa+j1l1vdz5yImZ3dhrpDpQH1Pdj/S0Aw/JhjEEoxupcMh/hJFtMEJfVqVm?=
 =?us-ascii?Q?zbVHw1GeSlYbsl/IlmZu47S4yRLA8OpNbdUhUHNZqmhNtsgc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4397.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968dd25f-9ac2-4fc9-40e4-08dedb8ce945
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 18:32:18.8479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oh413c9ipdCL23VghKxTwomu240uesKz0EArSknKWEQQ3nAFaQnVinOAC89Mm0ofvMdMRqkPJrYRu8Ker9DjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:David.Francis@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[David.YatSin@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[David.YatSin@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[SA0PR12MB4397.namprd12.prod.outlook.com:mid,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:email,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B79F77148B5

AMD General

Reviewed-by: "David Yat Sin <david.yatsin@amd.com>"


> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of David
> Francis
> Sent: Wednesday, June 24, 2026 9:38 AM
> To: amd-gfx@lists.freedesktop.org
> Cc: Francis, David <David.Francis@amd.com>
> Subject: [PATCH v2] drm/amdkfd: Check bounds in allocate_event_notificati=
on_slot
>
> The valid event ids go from 0 to KFD_SIGNAL_EVENT_LIMIT
>
> allocate_event_notification_slot has an option to specify an event id to =
allocate at,
> used by CRIU. We weren't checking the bounds on that value.
>
> Check them.
>
> v2: Lower bounds check is unecessary because of idr_alloc already rejecti=
ng
> negative numbers. Upper bounds check should be KFD_SIGNAL_EVENT_LIMIT
> since the signal mode mappings might not yet exist
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_events.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> index e9be798c0a2b..850d6befeb6d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> @@ -107,6 +107,9 @@ static int allocate_event_notification_slot(struct
> kfd_process *p,
>       }
>
>       if (restore_id) {
> +             if (*restore_id >=3D KFD_SIGNAL_EVENT_LIMIT)
> +                     return -EINVAL;
> +
>               id =3D idr_alloc(&p->event_idr, ev, *restore_id, *restore_i=
d + 1,
>                               GFP_KERNEL);
>       } else {
> --
> 2.34.1

