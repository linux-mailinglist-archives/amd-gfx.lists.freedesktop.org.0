Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA52CE661
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Dec 2020 04:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27D56E12D;
	Fri,  4 Dec 2020 03:17:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEA96E11E;
 Fri,  4 Dec 2020 03:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB0NqW++Q7b3G+VXGKZ8jYRtPTI7Pla+KkTK4UD0SiHe2R01BY8IFDXHTHCgOi379CecZpAaQLnJLXk6uJuBDohpIffthmPRIz3K/Oz73+OJXROjIZJcyg+P3H2cGayMjGC+Z05BYtih7lPCE6EA84hTI3X4tM+1+gvajg4oImvGvo9e1IGV/Y8pO6ts/5MpxNdN0Ywmlgb8k7GSZHTDqlqVULQXCLEDSPAUalNFEUYweVWIiehE4HnwXccJCtNRbZsByIdV9Tvl9nyoZf0tBX5XX4RzpjYX2lq1hiTxolEZcSFWjDMyRiAqo3ScpHkR5dbvvWb8PMtX3EwwhWH6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnsDhxszv9HhT5Ts196O2pMQYrjEFYirIkqCH0nIlCo=;
 b=VE6MAHi7yYJTh+R1Hivqed1nounxJ/VFjFwTuMN86d9BKm9E5/kEViqi2E1OcOQVlrjtqYdx7tsm2H4RNjD1HCIVUXdQruQFBTL36V9vhjMGFJoeqMRAoX1jlyLloGMN/v6u1TnTif8Eoyx86O0gngudcoDbRHDZii1a1fkyY/PlTyHfgBP4H3A5OIgoTVZR51WAT2qFlH/IUD/QE60oR9tbsugNw21x/qLhDCUwF9XLAY+vB3OxX3gEo0d+A4YznvrkedWETELQeMWIvJKIgj0Wcwl4syzeap3TpMhbEiXgst1QWwX2rwyMxuUuOvhyJvuVTMiIXZrDqrTjtOLi9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnsDhxszv9HhT5Ts196O2pMQYrjEFYirIkqCH0nIlCo=;
 b=A3HsQcnRDHv7C9deZrmexZqW3CxRf7yOztATpPV/c8klDvvpR243sLETntz4ogkUErfYEatj6b7kPYf9T8t96K8V785I8NY8dR/EC1MVExOVLOPI/FVcNM9PqwvZseMDAPlp4s2qBGrkR7eq6gFLu+yaIe/1FLKJn7kjr5Ptu+k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 03:17:39 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 03:17:39 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/scheduler: Job timeout handler returns status (v2)
Date: Thu,  3 Dec 2020 22:17:21 -0500
Message-Id: <20201204031722.24040-5-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.404.ge67fbf927d
In-Reply-To: <20201204031722.24040-1-luben.tuikov@amd.com>
References: <20201204031722.24040-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:610:4e::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:610:4e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 03:17:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f9298cf-7730-4ceb-e413-08d8980327c5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4043:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4043B609FA7BFA075852547099F10@DM6PR12MB4043.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9WKvuDjeUDQkmispDdhGXx0ows7R/QymolnbBg+5n51hlcnkj6SNA6nHyzJ37lA8MR1hQL5kFYJnhE5aIYaGDV96v8ey+uok4Ose1tMyXquxDx0AAR2+JI3wTaiEPLOUsPIlFIC1HlQRGOZeLsB9BE3DqZ11euWGvevm0Ky/KeXPVjNYwWRi/Yjp/cZuHMXInKCnSlaU6qJrrae0C+Jme+dQMkRH21cEtt8V42Nl5u8zfxwiHYTaNDajCpVxs6B321CRTNav4sd+MTXMWZrAIDfpKRkrTigXwCAPY1USu8c3qNLhrFa2ueMKw50i7RzFqxsRzWYitKICN1u5MWM5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(16526019)(30864003)(5660300002)(66946007)(956004)(1076003)(6486002)(2906002)(66556008)(66476007)(4326008)(6666004)(2616005)(83380400001)(186003)(36756003)(8676002)(86362001)(8936002)(26005)(44832011)(54906003)(7696005)(7416002)(66574015)(52116002)(478600001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWVZNHl6VHd1Q25yM0NkeU9leFkvOGFzaFJvMkFSak9HaU1pd3BCTVJJcFJ4?=
 =?utf-8?B?RVNoVVdFL3grUXAzRDNBelF2dklxTURLOE9RbytGSWZUc2d5cmlLSm5nYWJo?=
 =?utf-8?B?ZFJIbDBqZ1BiajY3TkNBbWVZZUVocjFiSjhQTGZBNGcySXFhTVppK2JxQlpa?=
 =?utf-8?B?cVJFRWdHK2RJWWR5MnpzSVNMVXBDQ1p5M3d0OG5Mamh2dHlWZ3QvdUltR3Z2?=
 =?utf-8?B?UWNrZDQ0a2dIbkpmRkc2Q1djWmZ3dDJpcURPVnZyc1JtQ0JMV3Q4SW42RFFn?=
 =?utf-8?B?SmkxRVVBUkpvSTBuOXZDMnBUSGNqSVJGWDE4M000Q095Mm9RSGpoWUkvM1NX?=
 =?utf-8?B?TG1mMkQrNUk4bEh5RjE1UEVoMmlnVHFLMlVQbE1RUzM1VFovQ1pBTjE4VXJL?=
 =?utf-8?B?Y2VwN3JkOFhVaTRHWXYwbGdWZWZETFZNZnRobXdYR3cvWWxMc2pKcHBMMWVG?=
 =?utf-8?B?UXl6ekRtYzdtU2F1ZlFkUlpFRkZIYW91SXlscktiNW5FWnpvN1lqQzlycHVs?=
 =?utf-8?B?Uk5PeVBGNXVmd2YvU0drN2RmNU9xcE11aCtmR2RJblk5cWdpOTdpUFcyYnRi?=
 =?utf-8?B?QUVHWEF3R09JUDRRMlcySEFiSE1nUjE1WlpuSTljSWpINXNWaDdSbjNlYzVB?=
 =?utf-8?B?T25yZzdkM3lEbS8xWkNveHpQUU44WXU0OGZlT1A1Sk1VUGtlTktlQmYxcllu?=
 =?utf-8?B?azhIUlFGdERpb2ZFRjEvTGk4Z1V2MVBGZjFIellDYWJ6aERKTDhhZHBqeWow?=
 =?utf-8?B?bVJIQUR3c3I3TnpYRmlvUnFGT09RYlRPclV5a2Fjc3dkY3VRMjNXcTRIVmxw?=
 =?utf-8?B?aE1uVjF2Wjg0SkdQK28xb2J1eTJGcnNoT2hUOFZST24ySDQ0OThjT1c0Sit0?=
 =?utf-8?B?N3dlVFBSQlRMMVR3T2E4dGVZT3E0ODBqSUV1NlRETFo0VnExTEpKVVg5UHBz?=
 =?utf-8?B?WEIyODlOVTFKdlZuay9Sb2IwRERJR0VHM2YwOVc5c1JyTHFMZUZobzVMUTNj?=
 =?utf-8?B?NG5McnJIWVBvb1JlOEt4bFFuYlN1LzVGdlR6eE9jempleFdCaUxRU1NtYlp0?=
 =?utf-8?B?SU1yZGNTdEthRXZQVWhBbjlRelZyWXV1TFpwWHpDVkxNM0N0Y0RSVWJqYTM0?=
 =?utf-8?B?bXRWVXdDN2tPcmdtSFh0TnpYK3A5T1NhSmxYdGt5dUtKMkVISkNrbnFvbm1X?=
 =?utf-8?B?YkxpeDlrOVppNEgydE1INEhwQ01MSFVPNFhuOXQ2cnpkUlJiNEIrNTh2V2Yz?=
 =?utf-8?B?TVdQN0x4WGJxTHlQNk04L0JUZ2ZzUVdCbThZaktuNXhMN085NEtQYWpzSFgw?=
 =?utf-8?Q?YbEgu3b98WHE/EFJzRQMiephScf2MjuHw+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9298cf-7730-4ceb-e413-08d8980327c5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 03:17:39.3868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j03H3iQa9tQLcNgA1iB9tIuFU6NsLl3dUuResTqLjY94Tn2N5OfT+gXaNAtzOaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
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
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 kernel test robot <lkp@intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Rob Herring <robh@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Eric Anholt <eric@anholt.net>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGRyaXZlcidzIGpvYiB0aW1lb3V0IGhhbmRsZXIgbm93IHJldHVybnMKc3RhdHVzIGluZGlj
YXRpbmcgYmFjayB0byB0aGUgRFJNIGxheWVyIHdoZXRoZXIKdGhlIHRhc2sgKGpvYikgd2FzIHN1
Y2Nlc3NmdWxseSBhYm9ydGVkIG9yIHdoZXRoZXIKbW9yZSB0aW1lIHNob3VsZCBiZSBnaXZlbiB0
byB0aGUgdGFzayB0byBjb21wbGV0ZS4KCkRlZmF1bHQgYmVoYXZpb3VyIGFzIG9mIHRoaXMgcGF0
Y2gsIGlzIHByZXNlcnZlZCwKZXhjZXB0IGluIG9idmlvdXMtYnktY29tbWVudCBjYXNlIGluIHRo
ZSBQYW5mcm9zdApkcml2ZXIsIGFzIGRvY3VtZW50ZWQgYmVsb3cuCgpBbGwgZHJpdmVycyB3aGlj
aCBtYWtlIHVzZSBvZiB0aGUKZHJtX3NjaGVkX2JhY2tlbmRfb3BzJyAudGltZWRvdXRfam9iKCkg
Y2FsbGJhY2sKaGF2ZSBiZWVuIGFjY29yZGluZ2x5IHJlbmFtZWQgYW5kIHJldHVybiB0aGUKd291
bGQndmUtYmVlbiBkZWZhdWx0IHZhbHVlIG9mCkRSTV9UQVNLX1NUQVRVU19BTElWRSB0byByZXN0
YXJ0IHRoZSB0YXNrJ3MKdGltZW91dCB0aW1lci0tdGhpcyBpcyB0aGUgb2xkIGJlaGF2aW91ciwg
YW5kCmlzIHByZXNlcnZlZCBieSB0aGlzIHBhdGNoLgoKSW4gdGhlIGNhc2Ugb2YgdGhlIFBhbmZy
b3N0IGRyaXZlciwgaXRzIHRpbWVkb3V0CmNhbGxiYWNrIGNvcnJlY3RseSBmaXJzdCBjaGVja3Mg
aWYgdGhlIGpvYiBoYWQKY29tcGxldGVkIGluIGR1ZSB0aW1lIGFuZCBpZiBzbywgaXQgbm93IHJl
dHVybnMKRFJNX1RBU0tfU1RBVFVTX0NPTVBMRVRFIHRvIG5vdGlmeSB0aGUgRFJNIGxheWVyCnRo
YXQgdGhlIHRhc2sgY2FuIGJlIG1vdmVkIHRvIHRoZSBkb25lIGxpc3QsIHRvIGJlCmZyZWVkIGxh
dGVyLiBJbiB0aGUgb3RoZXIgdHdvIHN1YnNlcXVlbnQgY2hlY2tzLAp0aGUgdmFsdWUgb2YgRFJN
X1RBU0tfU1RBVFVTX0FMSVZFIGlzIHJldHVybmVkLCBhcwpwZXIgdGhlIGRlZmF1bHQgYmVoYXZp
b3VyLgoKQSBtb3JlIGludm9sdmVkIGRyaXZlcidzIHNvbHV0aW9ucyBjYW4gYmUgaGFkCmluIHN1
YmVxdWVudCBwYXRjaGVzLgoKU2lnbmVkLW9mZi1ieTogTHViZW4gVHVpa292IDxsdWJlbi50dWlr
b3ZAYW1kLmNvbT4KUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
PgoKQ2M6IEFsZXhhbmRlciBEZXVjaGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPgpDYzog
QW5kcmV5IEdyb2R6b3Zza3kgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+CkNjOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+CkNjOiBSdXNzZWxsIEtpbmcgPGxpbnV4K2V0bmF2aXZAYXJtbGludXgub3JnLnVrPgpD
YzogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KQ2M6IFFp
YW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+CkNjOiBTdGV2
ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpDYzogQWx5c3NhIFJvc2VuendlaWcgPGFs
eXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0Bhbmhv
bHQubmV0PgoKdjI6IFVzZSBlbnVtIGFzIHRoZSBzdGF0dXMgb2YgYSBkcml2ZXIncyBqb2IKICAg
IHRpbWVvdXQgY2FsbGJhY2sgbWV0aG9kLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9qb2IuYyB8ICA2ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X3NjaGVkLmMgfCAxMCArKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5j
ICAgICAgIHwgIDQgKysrLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5j
IHwgIDkgKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgIHwg
IDQgKy0tLQogZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rfc2NoZWQuYyAgICAgICAgIHwgMzIgKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQogaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAgICAg
ICAgICAgIHwgMjAgKysrKysrKysrKysrKy0tLQogNyBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRp
b25zKCspLCAyOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
am9iLmMKaW5kZXggZmY0ODEwMWJhYjU1Li5hMTExMzI2Y2JkZGUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfam9iLmMKQEAgLTI4LDcgKzI4LDcgQEAKICNpbmNsdWRlICJhbWRn
cHUuaCIKICNpbmNsdWRlICJhbWRncHVfdHJhY2UuaCIKIAotc3RhdGljIHZvaWQgYW1kZ3B1X2pv
Yl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpCitzdGF0aWMgZW51bSBkcm1f
dGFza19zdGF0dXMgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19q
b2IpCiB7CiAJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gdG9fYW1kZ3B1X3Jpbmcoc19qb2It
PnNjaGVkKTsKIAlzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iID0gdG9fYW1kZ3B1X2pvYihzX2pvYik7
CkBAIC00MSw3ICs0MSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0
IGRybV9zY2hlZF9qb2IgKnNfam9iKQogCSAgICBhbWRncHVfcmluZ19zb2Z0X3JlY292ZXJ5KHJp
bmcsIGpvYi0+dm1pZCwgc19qb2ItPnNfZmVuY2UtPnBhcmVudCkpIHsKIAkJRFJNX0VSUk9SKCJy
aW5nICVzIHRpbWVvdXQsIGJ1dCBzb2Z0IHJlY292ZXJlZFxuIiwKIAkJCSAgc19qb2ItPnNjaGVk
LT5uYW1lKTsKLQkJcmV0dXJuOworCQlyZXR1cm4gRFJNX1RBU0tfU1RBVFVTX0FMSVZFOwogCX0K
IAogCWFtZGdwdV92bV9nZXRfdGFza19pbmZvKHJpbmctPmFkZXYsIGpvYi0+cGFzaWQsICZ0aSk7
CkBAIC01MywxMCArNTMsMTIgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpCiAKIAlpZiAoYW1kZ3B1X2RldmljZV9zaG91bGRfcmVj
b3Zlcl9ncHUocmluZy0+YWRldikpIHsKIAkJYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihyaW5n
LT5hZGV2LCBqb2IpOworCQlyZXR1cm4gRFJNX1RBU0tfU1RBVFVTX0FMSVZFOwogCX0gZWxzZSB7
CiAJCWRybV9zY2hlZF9zdXNwZW5kX3RpbWVvdXQoJnJpbmctPnNjaGVkKTsKIAkJaWYgKGFtZGdw
dV9zcmlvdl92ZihhZGV2KSkKIAkJCWFkZXYtPnZpcnQudGRyX2RlYnVnID0gdHJ1ZTsKKwkJcmV0
dXJuIERSTV9UQVNLX1NUQVRVU19BTElWRTsKIAl9CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfc2NoZWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfc2NoZWQuYwppbmRleCBjZDQ2Yzg4MjI2OWMuLmM0OTUxNjk0MjMyOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9zY2hlZC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfc2NoZWQuYwpAQCAtODIsNyArODIsOCBAQCBzdGF0
aWMgc3RydWN0IGRtYV9mZW5jZSAqZXRuYXZpdl9zY2hlZF9ydW5fam9iKHN0cnVjdCBkcm1fc2No
ZWRfam9iICpzY2hlZF9qb2IpCiAJcmV0dXJuIGZlbmNlOwogfQogCi1zdGF0aWMgdm9pZCBldG5h
dml2X3NjaGVkX3RpbWVkb3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQor
c3RhdGljIGVudW0gZHJtX3Rhc2tfc3RhdHVzIGV0bmF2aXZfc2NoZWRfdGltZWRvdXRfam9iKHN0
cnVjdCBkcm1fc2NoZWRfam9iCisJCQkJCQkgICAgICAgKnNjaGVkX2pvYikKIHsKIAlzdHJ1Y3Qg
ZXRuYXZpdl9nZW1fc3VibWl0ICpzdWJtaXQgPSB0b19ldG5hdml2X3N1Ym1pdChzY2hlZF9qb2Ip
OwogCXN0cnVjdCBldG5hdml2X2dwdSAqZ3B1ID0gc3VibWl0LT5ncHU7CkBAIC0xMjAsOSArMTIx
LDE2IEBAIHN0YXRpYyB2b2lkIGV0bmF2aXZfc2NoZWRfdGltZWRvdXRfam9iKHN0cnVjdCBkcm1f
c2NoZWRfam9iICpzY2hlZF9qb2IpCiAKIAlkcm1fc2NoZWRfcmVzdWJtaXRfam9icygmZ3B1LT5z
Y2hlZCk7CiAKKwkvKiBUZWxsIHRoZSBEUk0gc2NoZWR1bGVyIHRoYXQgdGhpcyB0YXNrIG5lZWRz
CisJICogbW9yZSB0aW1lLgorCSAqLworCWRybV9zY2hlZF9zdGFydCgmZ3B1LT5zY2hlZCwgdHJ1
ZSk7CisJcmV0dXJuIERSTV9UQVNLX1NUQVRVU19BTElWRTsKKwogb3V0X25vX3RpbWVvdXQ6CiAJ
LyogcmVzdGFydCBzY2hlZHVsZXIgYWZ0ZXIgR1BVIGlzIHVzYWJsZSBhZ2FpbiAqLwogCWRybV9z
Y2hlZF9zdGFydCgmZ3B1LT5zY2hlZCwgdHJ1ZSk7CisJcmV0dXJuIERSTV9UQVNLX1NUQVRVU19B
TElWRTsKIH0KIAogc3RhdGljIHZvaWQgZXRuYXZpdl9zY2hlZF9mcmVlX2pvYihzdHJ1Y3QgZHJt
X3NjaGVkX2pvYiAqc2NoZWRfam9iKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEv
bGltYV9zY2hlZC5jIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jCmluZGV4IDYz
YjRjNTY0M2Y5Yy4uNjZkOTIzNmI4NzYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGlt
YS9saW1hX3NjaGVkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jCkBA
IC00MTUsNyArNDE1LDcgQEAgc3RhdGljIHZvaWQgbGltYV9zY2hlZF9idWlsZF9lcnJvcl90YXNr
X2xpc3Qoc3RydWN0IGxpbWFfc2NoZWRfdGFzayAqdGFzaykKIAltdXRleF91bmxvY2soJmRldi0+
ZXJyb3JfdGFza19saXN0X2xvY2spOwogfQogCi1zdGF0aWMgdm9pZCBsaW1hX3NjaGVkX3RpbWVk
b3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iKQorc3RhdGljIGVudW0gZHJtX3Rhc2tf
c3RhdHVzIGxpbWFfc2NoZWRfdGltZWRvdXRfam9iKHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2Ip
CiB7CiAJc3RydWN0IGxpbWFfc2NoZWRfcGlwZSAqcGlwZSA9IHRvX2xpbWFfcGlwZShqb2ItPnNj
aGVkKTsKIAlzdHJ1Y3QgbGltYV9zY2hlZF90YXNrICp0YXNrID0gdG9fbGltYV90YXNrKGpvYik7
CkBAIC00NDksNiArNDQ5LDggQEAgc3RhdGljIHZvaWQgbGltYV9zY2hlZF90aW1lZG91dF9qb2Io
c3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYikKIAogCWRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzKCZw
aXBlLT5iYXNlKTsKIAlkcm1fc2NoZWRfc3RhcnQoJnBpcGUtPmJhc2UsIHRydWUpOworCisJcmV0
dXJuIERSTV9UQVNLX1NUQVRVU19BTElWRTsKIH0KIAogc3RhdGljIHZvaWQgbGltYV9zY2hlZF9m
cmVlX2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2pvYi5jCmluZGV4IDA0ZTZmNmY5Yjc0Mi4uODQ1MTQ4YTcyMmU0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCkBAIC00MzIsNyArNDMyLDggQEAgc3Rh
dGljIHZvaWQgcGFuZnJvc3Rfc2NoZWR1bGVyX3N0YXJ0KHN0cnVjdCBwYW5mcm9zdF9xdWV1ZV9z
dGF0ZSAqcXVldWUpCiAJbXV0ZXhfdW5sb2NrKCZxdWV1ZS0+bG9jayk7CiB9CiAKLXN0YXRpYyB2
b2lkIHBhbmZyb3N0X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9i
KQorc3RhdGljIGVudW0gZHJtX3Rhc2tfc3RhdHVzIHBhbmZyb3N0X2pvYl90aW1lZG91dChzdHJ1
Y3QgZHJtX3NjaGVkX2pvYgorCQkJCQkJICAqc2NoZWRfam9iKQogewogCXN0cnVjdCBwYW5mcm9z
dF9qb2IgKmpvYiA9IHRvX3BhbmZyb3N0X2pvYihzY2hlZF9qb2IpOwogCXN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgKnBmZGV2ID0gam9iLT5wZmRldjsKQEAgLTQ0Myw3ICs0NDQsNyBAQCBzdGF0aWMg
dm9pZCBwYW5mcm9zdF9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pv
YikKIAkgKiBzcHVyaW91cy4gQmFpbCBvdXQuCiAJICovCiAJaWYgKGRtYV9mZW5jZV9pc19zaWdu
YWxlZChqb2ItPmRvbmVfZmVuY2UpKQotCQlyZXR1cm47CisJCXJldHVybiBEUk1fVEFTS19TVEFU
VVNfQ09NUExFVEU7CiAKIAlkZXZfZXJyKHBmZGV2LT5kZXYsICJncHUgc2NoZWQgdGltZW91dCwg
anM9JWQsIGNvbmZpZz0weCV4LCBzdGF0dXM9MHgleCwgaGVhZD0weCV4LCB0YWlsPTB4JXgsIHNj
aGVkX2pvYj0lcCIsCiAJCWpzLApAQCAtNDU1LDExICs0NTYsMTMgQEAgc3RhdGljIHZvaWQgcGFu
ZnJvc3Rfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiAKIAkv
KiBTY2hlZHVsZXIgaXMgYWxyZWFkeSBzdG9wcGVkLCBub3RoaW5nIHRvIGRvLiAqLwogCWlmICgh
cGFuZnJvc3Rfc2NoZWR1bGVyX3N0b3AoJnBmZGV2LT5qcy0+cXVldWVbanNdLCBzY2hlZF9qb2Ip
KQotCQlyZXR1cm47CisJCXJldHVybiBEUk1fVEFTS19TVEFUVVNfQUxJVkU7CiAKIAkvKiBTY2hl
ZHVsZSBhIHJlc2V0IGlmIHRoZXJlJ3Mgbm8gcmVzZXQgaW4gcHJvZ3Jlc3MuICovCiAJaWYgKCFh
dG9taWNfeGNoZygmcGZkZXYtPnJlc2V0LnBlbmRpbmcsIDEpKQogCQlzY2hlZHVsZV93b3JrKCZw
ZmRldi0+cmVzZXQud29yayk7CisKKwlyZXR1cm4gRFJNX1RBU0tfU1RBVFVTX0FMSVZFOwogfQog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9zY2hlZF9iYWNrZW5kX29wcyBwYW5mcm9zdF9zY2hl
ZF9vcHMgPSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IDNlYjc2
MThhNjI3ZC4uYjk4NzZjYWQ5NGYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYwpAQCAtNTI2LDcgKzUyNiw3IEBAIHZvaWQgZHJtX3NjaGVkX3N0YXJ0KHN0cnVjdCBkcm1f
Z3B1X3NjaGVkdWxlciAqc2NoZWQsIGJvb2wgZnVsbF9yZWNvdmVyeSkKIEVYUE9SVF9TWU1CT0wo
ZHJtX3NjaGVkX3N0YXJ0KTsKIAogLyoqCi0gKiBkcm1fc2NoZWRfcmVzdWJtaXRfam9icyAtIGhl
bHBlciB0byByZWx1bmNoIGpvYiBmcm9tIHBlbmRpbmcgcmluZyBsaXN0CisgKiBkcm1fc2NoZWRf
cmVzdWJtaXRfam9icyAtIGhlbHBlciB0byByZWxhdW5jaCBqb2JzIGZyb20gdGhlIHBlbmRpbmcg
bGlzdAogICoKICAqIEBzY2hlZDogc2NoZWR1bGVyIGluc3RhbmNlCiAgKgpAQCAtNTYwLDggKzU2
MCw2IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1
bGVyICpzY2hlZCkKIAkJfSBlbHNlIHsKIAkJCXNfam9iLT5zX2ZlbmNlLT5wYXJlbnQgPSBmZW5j
ZTsKIAkJfQotCi0KIAl9CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9yZXN1Ym1pdF9qb2Jz
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jCmluZGV4IDQ1MjY4MmUyMjA5Zi4uMzc0MDY2NWVjNDc5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMKQEAgLTI1OSw3ICsyNTksNyBAQCB2M2RfY2FjaGVf
Y2xlYW5fam9iX3J1bihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQogCXJldHVybiBO
VUxMOwogfQogCi1zdGF0aWMgdm9pZAorc3RhdGljIGVudW0gZHJtX3Rhc2tfc3RhdHVzCiB2M2Rf
Z3B1X3Jlc2V0X2Zvcl90aW1lb3V0KHN0cnVjdCB2M2RfZGV2ICp2M2QsIHN0cnVjdCBkcm1fc2No
ZWRfam9iICpzY2hlZF9qb2IpCiB7CiAJZW51bSB2M2RfcXVldWUgcTsKQEAgLTI4NSw2ICsyODUs
OCBAQCB2M2RfZ3B1X3Jlc2V0X2Zvcl90aW1lb3V0KHN0cnVjdCB2M2RfZGV2ICp2M2QsIHN0cnVj
dCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiAJfQogCiAJbXV0ZXhfdW5sb2NrKCZ2M2QtPnJl
c2V0X2xvY2spOworCisJcmV0dXJuIERSTV9UQVNLX1NUQVRVU19BTElWRTsKIH0KIAogLyogSWYg
dGhlIGN1cnJlbnQgYWRkcmVzcyBvciByZXR1cm4gYWRkcmVzcyBoYXZlIGNoYW5nZWQsIHRoZW4g
dGhlIEdQVQpAQCAtMjkyLDcgKzI5NCw3IEBAIHYzZF9ncHVfcmVzZXRfZm9yX3RpbWVvdXQoc3Ry
dWN0IHYzZF9kZXYgKnYzZCwgc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKICAqIGNv
dWxkIGZhaWwgaWYgdGhlIEdQVSBnb3QgaW4gYW4gaW5maW5pdGUgbG9vcCBpbiB0aGUgQ0wsIGJ1
dCB0aGF0CiAgKiBpcyBwcmV0dHkgdW5saWtlbHkgb3V0c2lkZSBvZiBhbiBpLWctdCB0ZXN0Y2Fz
ZS4KICAqLwotc3RhdGljIHZvaWQKK3N0YXRpYyBlbnVtIGRybV90YXNrX3N0YXR1cwogdjNkX2Ns
X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iLCBlbnVtIHYzZF9x
dWV1ZSBxLAogCQkgICAgdTMyICp0aW1lZG91dF9jdGNhLCB1MzIgKnRpbWVkb3V0X2N0cmEpCiB7
CkBAIC0zMDQsMzkgKzMwNiwzOSBAQCB2M2RfY2xfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2No
ZWRfam9iICpzY2hlZF9qb2IsIGVudW0gdjNkX3F1ZXVlIHEsCiAJaWYgKCp0aW1lZG91dF9jdGNh
ICE9IGN0Y2EgfHwgKnRpbWVkb3V0X2N0cmEgIT0gY3RyYSkgewogCQkqdGltZWRvdXRfY3RjYSA9
IGN0Y2E7CiAJCSp0aW1lZG91dF9jdHJhID0gY3RyYTsKLQkJcmV0dXJuOworCQlyZXR1cm4gRFJN
X1RBU0tfU1RBVFVTX0FMSVZFOwogCX0KIAotCXYzZF9ncHVfcmVzZXRfZm9yX3RpbWVvdXQodjNk
LCBzY2hlZF9qb2IpOworCXJldHVybiB2M2RfZ3B1X3Jlc2V0X2Zvcl90aW1lb3V0KHYzZCwgc2No
ZWRfam9iKTsKIH0KIAotc3RhdGljIHZvaWQKK3N0YXRpYyBlbnVtIGRybV90YXNrX3N0YXR1cwog
djNkX2Jpbl9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKIHsK
IAlzdHJ1Y3QgdjNkX2Jpbl9qb2IgKmpvYiA9IHRvX2Jpbl9qb2Ioc2NoZWRfam9iKTsKIAotCXYz
ZF9jbF9qb2JfdGltZWRvdXQoc2NoZWRfam9iLCBWM0RfQklOLAotCQkJICAgICZqb2ItPnRpbWVk
b3V0X2N0Y2EsICZqb2ItPnRpbWVkb3V0X2N0cmEpOworCXJldHVybiB2M2RfY2xfam9iX3RpbWVk
b3V0KHNjaGVkX2pvYiwgVjNEX0JJTiwKKwkJCQkgICAmam9iLT50aW1lZG91dF9jdGNhLCAmam9i
LT50aW1lZG91dF9jdHJhKTsKIH0KIAotc3RhdGljIHZvaWQKK3N0YXRpYyBlbnVtIGRybV90YXNr
X3N0YXR1cwogdjNkX3JlbmRlcl9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNj
aGVkX2pvYikKIHsKIAlzdHJ1Y3QgdjNkX3JlbmRlcl9qb2IgKmpvYiA9IHRvX3JlbmRlcl9qb2Io
c2NoZWRfam9iKTsKIAotCXYzZF9jbF9qb2JfdGltZWRvdXQoc2NoZWRfam9iLCBWM0RfUkVOREVS
LAotCQkJICAgICZqb2ItPnRpbWVkb3V0X2N0Y2EsICZqb2ItPnRpbWVkb3V0X2N0cmEpOworCXJl
dHVybiB2M2RfY2xfam9iX3RpbWVkb3V0KHNjaGVkX2pvYiwgVjNEX1JFTkRFUiwKKwkJCQkgICAm
am9iLT50aW1lZG91dF9jdGNhLCAmam9iLT50aW1lZG91dF9jdHJhKTsKIH0KIAotc3RhdGljIHZv
aWQKK3N0YXRpYyBlbnVtIGRybV90YXNrX3N0YXR1cwogdjNkX2dlbmVyaWNfam9iX3RpbWVkb3V0
KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiB7CiAJc3RydWN0IHYzZF9qb2IgKmpv
YiA9IHRvX3YzZF9qb2Ioc2NoZWRfam9iKTsKIAotCXYzZF9ncHVfcmVzZXRfZm9yX3RpbWVvdXQo
am9iLT52M2QsIHNjaGVkX2pvYik7CisJcmV0dXJuIHYzZF9ncHVfcmVzZXRfZm9yX3RpbWVvdXQo
am9iLT52M2QsIHNjaGVkX2pvYik7CiB9CiAKLXN0YXRpYyB2b2lkCitzdGF0aWMgZW51bSBkcm1f
dGFza19zdGF0dXMKIHYzZF9jc2Rfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpz
Y2hlZF9qb2IpCiB7CiAJc3RydWN0IHYzZF9jc2Rfam9iICpqb2IgPSB0b19jc2Rfam9iKHNjaGVk
X2pvYik7CkBAIC0zNDgsMTAgKzM1MCwxMCBAQCB2M2RfY3NkX2pvYl90aW1lZG91dChzdHJ1Y3Qg
ZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQogCSAqLwogCWlmIChqb2ItPnRpbWVkb3V0X2JhdGNo
ZXMgIT0gYmF0Y2hlcykgewogCQlqb2ItPnRpbWVkb3V0X2JhdGNoZXMgPSBiYXRjaGVzOwotCQly
ZXR1cm47CisJCXJldHVybiBEUk1fVEFTS19TVEFUVVNfQUxJVkU7CiAJfQogCi0JdjNkX2dwdV9y
ZXNldF9mb3JfdGltZW91dCh2M2QsIHNjaGVkX2pvYik7CisJcmV0dXJuIHYzZF9ncHVfcmVzZXRf
Zm9yX3RpbWVvdXQodjNkLCBzY2hlZF9qb2IpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9zY2hlZF9iYWNrZW5kX29wcyB2M2RfYmluX3NjaGVkX29wcyA9IHsKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaApp
bmRleCAyZTBjMzY4ZTE5ZjYuLmNlZGZjNTM5NGU1MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
Z3B1X3NjaGVkdWxlci5oCisrKyBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaApAQCAtMjA2
LDYgKzIwNiwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZHJtX3NjaGVkX2ludmFsaWRhdGVfam9i
KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYiwKIAlyZXR1cm4gc19qb2IgJiYgYXRvbWljX2lu
Y19yZXR1cm4oJnNfam9iLT5rYXJtYSkgPiB0aHJlc2hvbGQ7CiB9CiAKK2VudW0gZHJtX3Rhc2tf
c3RhdHVzIHsKKwlEUk1fVEFTS19TVEFUVVNfQ09NUExFVEUsCisJRFJNX1RBU0tfU1RBVFVTX0FM
SVZFCit9OworCiAvKioKICAqIHN0cnVjdCBkcm1fc2NoZWRfYmFja2VuZF9vcHMKICAqCkBAIC0y
MzAsMTAgKzIzNSwxOSBAQCBzdHJ1Y3QgZHJtX3NjaGVkX2JhY2tlbmRfb3BzIHsKIAlzdHJ1Y3Qg
ZG1hX2ZlbmNlICooKnJ1bl9qb2IpKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpOwog
CiAJLyoqCi0gICAgICAgICAqIEB0aW1lZG91dF9qb2I6IENhbGxlZCB3aGVuIGEgam9iIGhhcyB0
YWtlbiB0b28gbG9uZyB0byBleGVjdXRlLAotICAgICAgICAgKiB0byB0cmlnZ2VyIEdQVSByZWNv
dmVyeS4KKwkgKiBAdGltZWRvdXRfam9iOiBDYWxsZWQgd2hlbiBhIGpvYiBoYXMgdGFrZW4gdG9v
IGxvbmcgdG8gZXhlY3V0ZSwKKwkgKiB0byB0cmlnZ2VyIEdQVSByZWNvdmVyeS4KKwkgKgorCSAq
IFJldHVybiBEUk1fVEFTS19TVEFUVVNfQUxJVkUsIGlmIHRoZSB0YXNrIChqb2IpIGlzIGhlYWx0
aHkKKwkgKiBhbmQgZXhlY3V0aW5nIGluIHRoZSBoYXJkd2FyZSwgaS5lLiBpdCBuZWVkcyBtb3Jl
IHRpbWUuCisJICoKKwkgKiBSZXR1cm4gRFJNX1RBU0tfU1RBVFVTX0NPTVBMRVRFLCBpZiB0aGUg
dGFzayAoam9iKSBoYXMKKwkgKiBiZWVuIGFib3J0ZWQgb3IgaXMgdW5rbm93biB0byB0aGUgaGFy
ZHdhcmUsIGkuZS4gaWYKKwkgKiB0aGUgdGFzayBpcyBvdXQgb2YgdGhlIGhhcmR3YXJlLCBhbmQg
bWF5YmUgaXQgaXMgbm93CisJICogaW4gdGhlIGRvbmUgbGlzdCwgb3IgaXQgd2FzIGNvbXBsZXRl
ZCBsb25nIGFnbywgb3IKKwkgKiBpZiBpdCBpcyB1bmtub3duIHRvIHRoZSBoYXJkd2FyZS4KIAkg
Ki8KLQl2b2lkICgqdGltZWRvdXRfam9iKShzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9i
KTsKKwllbnVtIGRybV90YXNrX3N0YXR1cyAoKnRpbWVkb3V0X2pvYikoc3RydWN0IGRybV9zY2hl
ZF9qb2IgKnNjaGVkX2pvYik7CiAKIAkvKioKICAgICAgICAgICogQGZyZWVfam9iOiBDYWxsZWQg
b25jZSB0aGUgam9iJ3MgZmluaXNoZWQgZmVuY2UgaGFzIGJlZW4gc2lnbmFsZWQKLS0gCjIuMjku
Mi40MDQuZ2U2N2ZiZjkyN2QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo=
