Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xkqzJyslMGpsOwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 18:15:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E16368837B
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 18:15:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="QDS/1MS7";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9948D10E4D4;
	Mon, 15 Jun 2026 16:15:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DABD10E4D4
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 16:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPumMX6jUwlMVCkROgw+VfcYP6DdHYYZ4Ms4qVGdBuOXy0p1tqNqjMiabEvKY/Ko+NoKxy0im+lWgVm49JYxIZpftw5Cfo0ZvNYf9SWICPvtHL8ARVljK2l9RRLssK/UEM6YXMg/dYl9GGRBZPGUkp5DDl28xiHCP9sEeNoXRnt/6dCeXIC0UnlTr4cJpSDLbYhaW7Ioml3VnOCqzq7T+mc4NOR3H5QLIJyc6lZnAhYppCNj3oyqAclvS8ir2jrLUVMSHlWqVMCjqCRKEmdFfwcp1wTOAjL1kREYtbldLVAMAzsVD5BiPttgwvzFc98IExGuArgtQp3fbEqbm4US7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOqj/tPuHtRcEPkB57SXPPDX2v0Hegv3R4NByZ9GmuY=;
 b=O/q0/9lfgzw9b5ofDtabHTC0BrjVxU01g/0t2GBUXTqBnDHTpKqrIf+/HfYvDGON6ZtrLWGC6vRRiZP+JjWO6SGy1DWl5pyySq++znOPyzah1ETZeBfBCXFFCbFqicPWsJ8GlfCeBPhsBl1Sq9R4HTYFf+NM4m4MfGf8+rWbKIJYWQIAUP3txAiZ5+RVJohc0S5QuiBlaMS7SdAzIixDf1XPEw0amv6Qw3uWe89ZGcj5zWgrfQCRBjdNzMP8MxanszdkLSvDbAgu9YFdfT4q7U3cgTxzKONxssMjPfr+5KjjJx19I76BosVgfGJROr+JvoDIpPqEC3x/baRrttNpOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOqj/tPuHtRcEPkB57SXPPDX2v0Hegv3R4NByZ9GmuY=;
 b=QDS/1MS76tRO1Xr5bdJxfAiV7D1FO9AlY8XOsMzlLIvxExaFejkEDjHL4B+AFRIEwXOCgH21DkOvbQnqa9O7/kpAjTbghYkHmv02OQsYuobmsCXkl1EJRtgeAKvDyIYYwKRM0UhEJyOG1gc2HABLFH0ynGHaAS8mZ59LgAINqpU=
Received: from BL1PR12MB5898.namprd12.prod.outlook.com (2603:10b6:208:396::7)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 16:15:29 +0000
Received: from BL1PR12MB5898.namprd12.prod.outlook.com
 ([fe80::914d:6a80:1477:4ed0]) by BL1PR12MB5898.namprd12.prod.outlook.com
 ([fe80::914d:6a80:1477:4ed0%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 16:15:29 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Lin, Amber" <Amber.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Lin, Amber" <Amber.Lin@amd.com>
Subject: RE: [PATCH] drm/amdkfd: Limit queue reset support on gfx9
Thread-Topic: [PATCH] drm/amdkfd: Limit queue reset support on gfx9
Thread-Index: AQHc/OHcFOnPxucDq0ClczgqQZWAP7Y/ykmg
Date: Mon, 15 Jun 2026 16:15:29 +0000
Message-ID: <BL1PR12MB58988DD17E683D9C659638B785E62@BL1PR12MB5898.namprd12.prod.outlook.com>
References: <20260615160948.4246-1-Amber.Lin@amd.com>
In-Reply-To: <20260615160948.4246-1-Amber.Lin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-15T16:14:21.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5898:EE_|PH0PR12MB7094:EE_
x-ms-office365-filtering-correlation-id: a24390bb-07c9-4927-5b0f-08decaf9515b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|22082099003|18002099003|6133799003|56012099006|11063799006;
x-microsoft-antispam-message-info: gGiUigkjuOoyhO3v4x8HQFKQawEixdLp7sdmp/5iPBbLsdzFUsUkp3TAaRSkf/g+Q99OxtkySFLRNIki5keZRuRhHvGOqj6a6k/47oJ/00esbyy5EuUQv9hoJDqLk8z/7vSeDFAGYMOp3I50HbxiZe6DpuM45AOtUQfFeK9S/qq4QtD69LJIOLDBXO+8vEOBOjhUfDy/Me48UPe17FqOprhLmpuSE7Zqbbos+pMB6H3fis3YJAEYgmgiGbfoD2Qjy2ncVOhIyD2dqYrRKcxKF98RfxvGSsTS93hQryL4ap9X+p2Q0t/D4PKzgXLBMJOdopbDv9Bgms9muvUtZpSRUsHxuNKzwEAz9aYykEQGWzeXDqgvsz6NfoFltjRMrqW8a5Q20V1zxmH6rN5PbRjqH7JLxLkLfY1qTVTWFfCzTkoSCTbLmrEAbtNp/9TqPXSOGMkQ1YaPZzRIW193rlAWIvd/Yy8WeDC6h3mCtcBt+5SoN2En0FJ7JRWSN6iNNUOQAf9XzXrCz+wYoWZOkDY9/F2Br4b6pj1/Dahe6IYPXbp60ZLES+A9ise4kln49LWPD+coF4qrl0tgBtKmuMyLZBzjTmNN7JtJvTAK+c6NAo1u6KXlo5VaLWw8LcaArdShRhdEM5BhzNtjZKehLSijRImIpqeHOskbu2no5TgF9gwCw+f/eP3ZJ4NpWWRMufRHEW+MN/sUkLvHCAS+JHBkgBvd/QMJgwUYRQWjxxlavUEQLIfhVKyAvP1bpH6OpOBl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5898.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fdS9zWfUQmUsYcJ4z9KCfdGuE03t56JDNjyxkiANCi/+txqeoNHeNfpdi+kC?=
 =?us-ascii?Q?zIqqiXOVbHFCCeOcI7a1J10GPPAFZAdCrVLtM/aUe6fl0gqARNWHkL+b5tye?=
 =?us-ascii?Q?eCAmjZbgyu8lkWKzoO2quBoaamAU157QKyDaqYnGir+exkDTHueqJHAFJTfP?=
 =?us-ascii?Q?DfEb2sdNz4wgkZ9A/Q7uuaHv+h8EPLIIYkemMAJZvzrcfaDmaLXBjhVCSuDe?=
 =?us-ascii?Q?qJSgpRQgvUzTdP3GeiWA4rVwaMTlEHNKnJE1k4M9mesJdbePUZ9NZiNtoYG4?=
 =?us-ascii?Q?3jnBpPa8jcc2hlKq0DWwZ54LVlkC2Iy6tYa/eU8yGaR+ezz+bZgGD5D58DLw?=
 =?us-ascii?Q?3Dm2aLNhMXePVfpbpWBQi3NKeN1gnrOezOxuUP489q2eDfZavsXKJBpE53qx?=
 =?us-ascii?Q?D7o/blbsXZHeomzXzOunQKDZbX3DYAZZw2SBrNZitQWtNc/6EeRnDohDKuu8?=
 =?us-ascii?Q?HfXviK6HROdhMY2QHeBCd4BYh1qTnvso2lxlHcom+0lH3BdkmIp0O1AgOSE2?=
 =?us-ascii?Q?q8Nd6BDXa3avZhPxDSiDNPF0JKpersCgky6DYEnuufNiokvj+CHzqu30PiPb?=
 =?us-ascii?Q?THIcUa3ZC3WTLvSRsZBMox1fv32fgRvjbl9DrjEj/Cu+BxrOoj3+q+f/oQMZ?=
 =?us-ascii?Q?yC+ufRTRXrOJ1LD3BDO6CfaQiLMAa1u4l0/RmSxAZuWpDJszTaa1W9GwL2TS?=
 =?us-ascii?Q?hWW075Y9uG08s1fml0EetoCUQEmoMgezmjQhJz4yn+AkdWSNpc3D5PZo8/lO?=
 =?us-ascii?Q?suK2S9nmrI+avsizRNtTeOO1kar3r2cQsblFkF6fGzW1tMwGCC7fZVK/j6sQ?=
 =?us-ascii?Q?lekN20UQBxh3WTLsROnz8WSO9t645KADUc73aiculZlFSdzUcG6QJI2iooP0?=
 =?us-ascii?Q?tz3RJGjwe9mQnlsFQaOSuM50v9yQZKoPKdZ+DuE5CWzuegjTiK8GGBsQEbjp?=
 =?us-ascii?Q?MBnWGYhjAE/Q8RR1R7qrjIn+0Bjvsj3e2bXNaNpHlDvKpR8cS0CfUYQ1kHH5?=
 =?us-ascii?Q?hgpD/qXnTaSuEcA8syQuCzbKM5/DatYRov9Vw1YRIwMPaOHKssbulN3ycO5i?=
 =?us-ascii?Q?utJ2d/yL+ooOhS0B6nEgdAeZ6VKWkHLpgwJ23Mr4fIq1fIMzr8OZ24DYxwR7?=
 =?us-ascii?Q?RU717hDbVPOKEH1PuM61H1f5U0La/Uld+v9J/5PEZSdof1mDWC+LpBGCDaeF?=
 =?us-ascii?Q?QVc52biZf2+hhitbfMsd5fWXrTAWtX9vtM7nfQY5XQ7Z9JFM9EgxZNAKP380?=
 =?us-ascii?Q?hq06SpHNxTmenSZYjr7v0oKRMZgjLji8jbrF5zE3bV8JjVLrx3XxR9lj5QaX?=
 =?us-ascii?Q?4Hc+6e4zFqf9ZTla9PLGuKESplIwV0TDHJhwung9WMYsOW6rnz6RAeikMEIV?=
 =?us-ascii?Q?fDbgOD7TXjLh3L6M30jQfHYo+j5jIzURduO5HSIWbEerYDKzk9y93GbeqVUp?=
 =?us-ascii?Q?8RJOJ5DTh0ZI5L4HygkuwgTsrsYrXEJOm68Lh5zfR6IQikJvaFG3sjRUg2SW?=
 =?us-ascii?Q?V1lIfsSzh1O6S3Wt+SEYQhyHCxOlhn6APxF/Xc2UgeDCijmgoXY5k7GTW4Nc?=
 =?us-ascii?Q?SjPn9H/IfsLgMV8Y6mob6hbdNaRh3/2RoAByUN0nHldBJq14AlbDNRqxqfLs?=
 =?us-ascii?Q?QWH4JWGueQkisq408jpNzRVjsa6GZYPcrQ9FnZXCG0g6yfrA3p2VuJ0+dHkt?=
 =?us-ascii?Q?nUPh6WUe5qxXK+KhUISbo1ywrQSXUr9lhOsACssipodMhfVt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24390bb-07c9-4927-5b0f-08decaf9515b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 16:15:29.3601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vHQL4hZp4FsxHgmoN9+e675Q9MqgJU04d1nXjzwXSo77NIn5tZRGMFYjZ9RHHedTqDU+INnYq7xWz/mFk1v6hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094
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
	FORGED_RECIPIENTS(0.00)[m:Amber.Lin@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Kent.Russell@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Kent.Russell@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,BL1PR12MB5898.namprd12.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E16368837B

AMD General

Reviewed-by: Kent Russell <kent.russell@amd.com>



> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Amber =
Lin
> Sent: June 15, 2026 12:10 PM
> To: amd-gfx@lists.freedesktop.org; Russell, Kent <Kent.Russell@amd.com>
> Cc: Lin, Amber <Amber.Lin@amd.com>
> Subject: [PATCH] drm/amdkfd: Limit queue reset support on gfx9
>
> For gfx9, queue reset is supported on gfx 9.4.3 and above.
>
> Signed-off-by: Amber Lin <Amber.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 7688156d476a..4249d6f3a59b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -2013,7 +2013,8 @@ static void kfd_topology_set_capabilities(struct
> kfd_topology_device *dev)
>                       dev->node_props.capability |=3D
>
>       HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED
> ;
>
> -             if (!amdgpu_sriov_vf(dev->gpu->adev))
> +             if (KFD_GC_VERSION(dev->gpu) >=3D IP_VERSION(9, 4, 3) &&
> +                 !amdgpu_sriov_vf(dev->gpu->adev))
>                       dev->node_props.capability |=3D
> HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
>
>       } else {
> --
> 2.43.0

